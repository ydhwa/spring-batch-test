package com.example.springbatchtest.service;

import com.example.springbatchtest.domain.TestData;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;

import java.util.Random;

@Service
public class TestService {

    private Random random = new Random();


    public void sleepAndUpdate(TestData testData) throws InterruptedException {
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        int duration = random.nextInt(5000);
        Thread.sleep(duration);
        stopWatch.stop();
        testData.setUpdateData(stopWatch.getTotalTimeSeconds());
    }
}
