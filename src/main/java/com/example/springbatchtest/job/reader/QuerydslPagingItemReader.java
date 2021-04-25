package com.example.springbatchtest.job.reader;

import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.batch.item.database.AbstractPagingItemReader;
import org.springframework.dao.DataAccessResourceFailureException;
import org.springframework.util.ClassUtils;
import org.springframework.util.CollectionUtils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.Function;

public class QuerydslPagingItemReader<T> extends AbstractPagingItemReader<T> {

    private EntityManagerFactory entityManagerFactory;

    private EntityManager entityManager;

    private final Map<String, Object> jpaPropertyMap = new HashMap<>();

    protected Function<JPAQueryFactory, JPAQuery<T>> queryFunction;

    private boolean transacted = true;//default value


    public QuerydslPagingItemReader() {
        setName(ClassUtils.getShortName(QuerydslPagingItemReader.class));
    }

    public QuerydslPagingItemReader(
            EntityManagerFactory entityManagerFactory,
            int pageSize,
            Function<JPAQueryFactory, JPAQuery<T>> queryFunction
    ) {
        this();
        this.entityManagerFactory = entityManagerFactory;
        this.queryFunction = queryFunction;
        setPageSize(pageSize);
    }

    /**
     * By default (true) the EntityTransaction will be started and committed around the read.
     * Can be overridden (false) in cases where the JPA implementation doesn't support a
     * particular transaction.  (e.g. Hibernate with a JTA transaction).  NOTE: may cause
     * problems in guaranteeing the object consistency in the EntityManagerFactory.
     *
     * @param transacted indicator
     */
    public void setTransacted(boolean transacted) {
        this.transacted = transacted;
    }

    @Override
    protected void doOpen() throws Exception {
        super.doOpen();

        entityManager = entityManagerFactory.createEntityManager(jpaPropertyMap);
        if (entityManager == null) {
            throw new DataAccessResourceFailureException("Unable to obtain an EntityManager");
        }
    }

    @Override
    @SuppressWarnings("unchecked")
    protected void doReadPage() {
        EntityTransaction tx = null;

        if (transacted) {
            tx = entityManager.getTransaction();
            tx.begin();

            entityManager.flush();
            entityManager.clear();
        }//end if

        JPAQuery<T> query = createQuery()
                .offset(getPage() * getPageSize())
                .limit(getPageSize());

        if (CollectionUtils.isEmpty(results)) {
            results = new CopyOnWriteArrayList<>();
        } else {
            results.clear();
        }

        if (!transacted) {
            List<T> queryResult = query.fetch();
            for (T entity : queryResult) {
                entityManager.detach(entity);
                results.add(entity);
            }//end if
        } else {
            results.addAll(query.fetch());
            tx.commit();
        }//end if
    }

    protected JPAQuery<T> createQuery() {
        JPAQueryFactory queryFactory = new JPAQueryFactory(entityManager);
        return queryFunction.apply(queryFactory);
    }

    @Override
    protected void doJumpToPage(int itemIndex) {
    }

    @Override
    protected void doClose() throws Exception {
        entityManager.close();
        super.doClose();
    }
}
