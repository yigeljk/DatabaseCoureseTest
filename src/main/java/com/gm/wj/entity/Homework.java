package com.gm.wj.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;

import javax.persistence.*;

@Entity
@Data
@Table(name = "homework")
@ToString
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class Homework {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // 作业ID

    private String name;  // 作业名称

    private String category;  // 作业类型（客观题，半开放，主观）
}