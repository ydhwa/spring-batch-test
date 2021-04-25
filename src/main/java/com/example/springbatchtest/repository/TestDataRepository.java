package com.example.springbatchtest.repository;

import com.example.springbatchtest.domain.TestData;
import com.example.springbatchtest.repository.custom.TestDataRepositoryCustom;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TestDataRepository extends JpaRepository<TestData, Long>, TestDataRepositoryCustom {
}
