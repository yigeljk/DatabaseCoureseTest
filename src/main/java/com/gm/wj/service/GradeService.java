package com.gm.wj.service;

import com.gm.wj.entity.Grade;
import com.gm.wj.dao.GradeDAO;
import com.gm.wj.dao.HomeworkDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GradeService {

    @Autowired
    private GradeDAO gradeRepository;

    @Autowired
    private HomeworkDAO homeworkRepository;

    // 查询所有成绩记录
    public List<Grade> getAllGrades() {
        return gradeRepository.findAll();
    }

    // 查询某个学生的所有成绩
    public List<Grade> getGradesByStudentId(Integer studentId) {
        return gradeRepository.findByStudentId(studentId);
    }

    public List<Grade> getGradesByCourseName(String courseName) {
        return gradeRepository.findByHomeworkName(courseName);
    }

    // 保存成绩
    public Grade saveGrade(Grade grade) {
        return gradeRepository.save(grade);
    }

    // 根据作业名计算平均成绩
    public Double getAverageScoreByHomeworkName(String homeworkName) {
        // 查找作业
        List<Grade> grades = gradeRepository.findByHomeworkName(homeworkName);
        if (grades.isEmpty()) {
            return 0.0;
        }
        double sum = 0.0;
        for (Grade grade : grades) {
            sum += grade.getScore();
        }
        return sum / grades.size();
    }

    // 更新成绩的方法
    public String updateGrade(int studentId, Grade grade) {
        Grade existingGrade = gradeRepository.findByStudentIdAndHomeworkName(studentId, grade.getHomeworkName());
        if (existingGrade == null) {
            return "成绩记录未找到";
        }
        existingGrade.setScore(grade.getScore());
        existingGrade.setCompleted(grade.getCompleted());
        existingGrade.setCategory(grade.getCategory());
        existingGrade.setCrossCheck(grade.getCrossCheck());
        existingGrade.setHomeworkName(grade.getHomeworkName());
        gradeRepository.save(existingGrade);

        return "成绩更新成功";
    }
}
