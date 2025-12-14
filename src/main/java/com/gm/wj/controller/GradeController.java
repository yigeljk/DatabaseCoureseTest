package com.gm.wj.controller;

import com.gm.wj.entity.Grade;
import com.gm.wj.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.validation.Valid;
import java.util.List;

@RestController
@RequestMapping("/api/grades")
public class GradeController {

    private static final Logger logger = LoggerFactory.getLogger(GradeController.class);

    @Autowired
    private GradeService gradeService;

    // 获取所有成绩记录
    @GetMapping("/all")
    public List<Grade> getAllGrades() {
        return gradeService.getAllGrades();
    }

    @GetMapping("/by-student-id/{studentId}")
    public List<Grade> getGradesByStudentId(@PathVariable Integer studentId) {
        return gradeService.getGradesByStudentId(studentId);
    }

    @GetMapping("/by-course-name")
    public List<Grade> getGradesByCourseName(@RequestParam String courseName) {
        System.out.println("courseName: " + courseName);
        return gradeService.getGradesByCourseName(courseName);
    }

    // 插入一条成绩记录
    @PostMapping("/renew")
    public ResponseEntity<Grade> createGrade(@Valid @RequestBody Grade grade) {
        logger.info("Received Grade data: {}", grade);
        Grade savedGrade = gradeService.saveGrade(grade);
        return ResponseEntity.ok(savedGrade);  // 成功时返回200 OK
    }

    // 查询某个作业的平均成绩
    @GetMapping("/average/{homeworkName}")
    public ResponseEntity<Double> getAverageScoreByHomeworkName(@PathVariable String homeworkName) {
        Double averageScore = gradeService.getAverageScoreByHomeworkName(homeworkName);
        if (averageScore == 0.0) {
            return ResponseEntity.notFound().build();  // 如果没有找到作业或没有成绩，返回404
        }
        return ResponseEntity.ok(averageScore);  // 返回平均成绩
    }

    @PutMapping("/{studentId}")
    public ResponseEntity<String> updateGrade(@PathVariable int studentId, @RequestBody Grade grade) {
        String result = gradeService.updateGrade(studentId, grade);
        if ("成绩更新成功".equals(result)) {
            // 成功时返回 200 OK 和成功信息
            return ResponseEntity.ok(result);
        } else {
            // 失败时返回 400 Bad Request 和失败信息
            return ResponseEntity.notFound().build();
        }
    }
}
