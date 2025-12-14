package com.gm.wj.service;

import com.gm.wj.entity.Homework;
import java.util.List;

public interface HomeworkService {
    List<Homework> getHomeworkByCategory(String category);
    List<Homework> getAllHomework();
    Homework addHomework(Homework homework);
    boolean deleteHomework(String homeworkName);
    void evictAllHomeworkCache();
}