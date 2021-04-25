package com.example.springbatchtest.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "test_data")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TestData {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column
    private String title;

    @Column
    private String description;

    @Column
    private Double duration;

    @Column(name = "insert_timestamp")
    private LocalDateTime insertTimestamp;

    @Column(name = "update_timestamp")
    private LocalDateTime updateTimestamp;


    public void setUpdateData(double duration) {
        this.duration = duration;
        this.updateTimestamp = LocalDateTime.now();
    }
}
