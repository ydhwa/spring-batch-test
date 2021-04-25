package com.example.springbatchtest.scheduler;

import com.example.springbatchtest.job.TestJobConfig;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.JobParametersInvalidException;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.batch.core.repository.JobExecutionAlreadyRunningException;
import org.springframework.batch.core.repository.JobInstanceAlreadyCompleteException;
import org.springframework.batch.core.repository.JobRestartException;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
@Slf4j
public class TestScheduler {

    private final JobLauncher jobLauncher;
    private final TestJobConfig testJobConfig;


    @Scheduled(cron = "15 * * * * *")
    public void test() {
        try {
            log.info("----- job started -----");
            jobLauncher.run(
                    testJobConfig.testJob(),
                    new JobParametersBuilder()
                            .addLong("currentTimeMillis", System.currentTimeMillis())
                            .toJobParameters()
            );
            log.info("----- job ended -----");
        } catch (JobExecutionAlreadyRunningException | JobRestartException | JobInstanceAlreadyCompleteException | JobParametersInvalidException e) {
            log.error("{}", e.getMessage());
        }
    }
}
