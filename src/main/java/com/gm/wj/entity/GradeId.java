package com.gm.wj.entity;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Objects;

@Setter
@Getter
public class GradeId implements Serializable {

    private Integer studentId;
    private Integer homeworkId;

    // Getters, Setters, hashCode, equals

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        GradeId gradeId = (GradeId) o;
        return Objects.equals(studentId, gradeId.studentId) &&
                Objects.equals(homeworkId, gradeId.homeworkId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(studentId, homeworkId);
    }
}