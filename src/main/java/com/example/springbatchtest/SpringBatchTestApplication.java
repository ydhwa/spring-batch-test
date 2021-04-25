package com.example.springbatchtest;

import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.PostConstruct;
import java.util.TimeZone;

@SpringBootApplication
@EnableScheduling
@EnableBatchProcessing
public class SpringBatchTestApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBatchTestApplication.class, args);
	}

	@PostConstruct
	public void initialize() {
		TimeZone.setDefault(TimeZone.getTimeZone("UTC"));
	}
}
