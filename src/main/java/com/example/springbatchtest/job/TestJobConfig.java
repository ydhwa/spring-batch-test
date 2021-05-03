package com.example.springbatchtest.job;

import com.example.springbatchtest.domain.TestData;
import com.example.springbatchtest.job.reader.QuerydslPagingItemReader;
import com.example.springbatchtest.job.tasklet.DeleteJobRepositoryTasklet;
import com.example.springbatchtest.service.TestService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.DefaultBatchConfigurer;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepScope;
import org.springframework.batch.core.repository.JobRepository;
import org.springframework.batch.core.repository.support.JobRepositoryFactoryBean;
import org.springframework.batch.item.ItemProcessor;
import org.springframework.batch.item.database.JpaItemWriter;
import org.springframework.batch.item.database.builder.JpaItemWriterBuilder;
import org.springframework.batch.support.transaction.ResourcelessTransactionManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.task.TaskExecutor;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import static com.example.springbatchtest.domain.QTestData.testData;

@Configuration
@RequiredArgsConstructor
@Slf4j
public class TestJobConfig extends DefaultBatchConfigurer {

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;
    private final EntityManagerFactory entityManagerFactory;
    private int chunkSize = 10;
    private int poolSize = 16;

    private final TestService testService;


    public DataSource embeddedDataSource() {
        return new EmbeddedDatabaseBuilder()
                .addScript("classpath:schema-drop-create-h2-job.sql")
                .setType(EmbeddedDatabaseType.H2)
                .build();
    }

    @Override
    protected JobRepository createJobRepository() throws Exception {
        JobRepositoryFactoryBean factory = new JobRepositoryFactoryBean();
        factory.setDataSource(embeddedDataSource());
        factory.setTransactionManager(transactionManager());
        factory.afterPropertiesSet();
        factory.setValidateTransactionState(false);
        return factory.getObject();
    }

    private ResourcelessTransactionManager transactionManager() {
        return new ResourcelessTransactionManager();
    }


    @Bean
    public Job testJob() {
        Step deleteJobRepositoryTaskletStep = stepBuilderFactory.get("deleteJobRepositoryTasklet")
                .tasklet(new DeleteJobRepositoryTasklet(embeddedDataSource()))
                .build();

        return jobBuilderFactory.get("testJob")
                .start(testStep())
                .next(deleteJobRepositoryTaskletStep)
                .build();
    }

    @Bean
    public Step testStep() {
        return stepBuilderFactory.get("testStep")
                .transactionManager(new JpaTransactionManager(entityManagerFactory))
                .<TestData, TestData> chunk(chunkSize)
                .reader(testReader())
                .processor(testProcessor())
                .writer(testWriter())
                .taskExecutor(testTaskExecutor())
                .throttleLimit(poolSize)
                .build();
    }

    @Bean
    @StepScope
    public QuerydslPagingItemReader<TestData> testReader() {
        return new QuerydslPagingItemReader<>(
                entityManagerFactory, chunkSize, queryFactory ->
                queryFactory
                        .selectFrom(testData)
                        .orderBy(testData.id.desc())
        );
    }

    @Bean
    @StepScope
    public ItemProcessor<TestData, TestData> testProcessor() {
        return testData -> {
            testService.sleepAndUpdate(testData);
            log.info("{} ::: testProcessor worked.", testData.getId());
            return testData;
        };
    }

    @Bean
    @StepScope
    public JpaItemWriter<TestData> testWriter() {
        return new JpaItemWriterBuilder<TestData>()
                .entityManagerFactory(entityManagerFactory)
                .build();
    }

    @Bean
    public TaskExecutor testTaskExecutor() {
        ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
        executor.setCorePoolSize(poolSize);
        executor.setMaxPoolSize(poolSize);
        executor.setThreadNamePrefix("test-multi-thread-");
        executor.setWaitForTasksToCompleteOnShutdown(Boolean.TRUE);
        executor.initialize();
        return executor;
    }
}
