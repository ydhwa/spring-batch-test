package com.example.springbatchtest.repository.impl;

import com.example.springbatchtest.domain.QTestData;
import com.example.springbatchtest.domain.TestData;
import com.example.springbatchtest.repository.custom.TestDataRepositoryCustom;
import com.querydsl.jpa.impl.JPAQueryFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TestDataRepositoryImpl implements TestDataRepositoryCustom {

    private final JPAQueryFactory queryFactory;
    private final QTestData testData;

    public TestDataRepositoryImpl(JPAQueryFactory queryFactory) {
        this.queryFactory = queryFactory;
        this.testData = QTestData.testData;
    }

    @Override
    public List<TestData> getList() {
        return queryFactory
                .selectFrom(testData)
                .fetch();
    }
}
