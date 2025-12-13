package com.gm.wj.controller;

import com.gm.wj.entity.Homework;
import com.gm.wj.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
public class HomeworkController {
    @Autowired
    private HomeworkService homeworkService;

    // 获取指定类别的作业
    @GetMapping("/api/homework/category")
    public ResponseEntity<List<Homework>> getHomeworkByCategory(@RequestParam("category") String category) {
        System.out.println("收到的category: " + category);
        List<Homework> homeworkList = homeworkService.getHomeworkByCategory(category);
        if (homeworkList.isEmpty()) {
            return ResponseEntity.noContent().build();  // 如果没有数据，返回204 No Content
        }
        return ResponseEntity.ok(homeworkList);  // 返回查询到的作业列表
    }

    // 获取所有作业
    @GetMapping("/api/homework")
    public ResponseEntity<List<Homework>> getAllHomework() {
        List<Homework> homeworkList = homeworkService.getAllHomework();
        if (homeworkList.isEmpty()) {
            return ResponseEntity.noContent().build();  // 如果没有数据，返回204 No Content
        }
        return ResponseEntity.ok(homeworkList);  // 返回所有作业列表
    }

    // 增加作业
    @PostMapping("/api/homework/add")
    public ResponseEntity<Homework> addHomework(@RequestBody Homework homework) {
        Homework savedHomework = homeworkService.addHomework(homework);
        return ResponseEntity.ok(savedHomework);  // 返回保存后的作业对象
    }

    // 根据作业名称删除作业
    @DeleteMapping("/api/homework/delete")
    public ResponseEntity<Void> deleteHomework(@RequestParam("homeworkName") String homeworkName) {
        System.out.println("收到删除请求：" + homeworkName);  // 调试用
        boolean isDeleted = homeworkService.deleteHomework(homeworkName);
        if (isDeleted) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.status(404).build();
        }
    }
}
