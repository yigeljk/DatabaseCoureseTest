package com.gm.wj.entity;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Setter
@Getter
@Entity
@Data
@IdClass(GradeId.class)
@Table(name = "grade")
@ToString
@JsonIgnoreProperties({ "handler","hibernateLazyInitializer" })
public class Grade {
    @Id
    @Column(name = "student_id")
    private Integer studentId;

    @Id
    @Column(name = "homework_id")
    private Integer homeworkId;

    @Column(name = "score")
    private Double score;

    @Column(name = "completed")
    private Boolean completed;

    @Column(name = "category")
    private String category;

    @Column(name = "homework_name")
    private String homeworkName;

    @Column(name = "description")
    private String description;

    @Column(name = "cross_check")
    private Boolean crossCheck;

}
