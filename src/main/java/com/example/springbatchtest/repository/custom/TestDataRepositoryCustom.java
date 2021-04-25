package com.example.springbatchtest.repository.custom;

import com.example.springbatchtest.domain.TestData;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestDataRepositoryCustom {

    List<TestData> getList();
}
