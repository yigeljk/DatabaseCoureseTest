package com.gm.wj.dao;

import com.gm.wj.entity.GradeId;
import com.gm.wj.entity.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface GradeDAO extends JpaRepository<Grade, GradeId> {
    // 查询某个学生的所有作业成绩
    List<Grade> findByStudentId(Integer studentId);

    // 根据作业名查询成绩
    List<Grade> findByHomeworkName(String homeworkName);

    // 查询单项成绩
    Grade findByStudentIdAndHomeworkName(Integer studentId, String homeworkName);
}
