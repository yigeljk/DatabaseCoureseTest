package com.gm.wj.dao;

import com.gm.wj.entity.Homework;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface HomeworkDAO extends JpaRepository<Homework, Long> {
    // 根据作业类别查询作业
    List<Homework> findByCategory(String category);

    // 根据作业名称查找作业
    Homework findByName(String homeworkName);
}