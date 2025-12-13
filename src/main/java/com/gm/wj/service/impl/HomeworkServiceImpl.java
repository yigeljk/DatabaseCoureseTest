package com.gm.wj.service.impl;

import com.gm.wj.dao.HomeworkDAO;
import com.gm.wj.entity.Homework;
import com.gm.wj.service.HomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HomeworkServiceImpl implements HomeworkService {

    @Autowired
    private HomeworkDAO homeworkRepository;

    @Override
    //@Cacheable(value = "homeworkCache", key = "'category_' + #category")
    public List<Homework> getHomeworkByCategory(String category) {
        System.out.println("正在运行的category: " + category);
        return homeworkRepository.findByCategory(category);
    }

    @Override
    //@Cacheable(value = "homeworkCache", key = "'allhomework'")
    public List<Homework> getAllHomework() {
        return homeworkRepository.findAll();
    }

    @Override
    @CacheEvict(value = "homeworkCache", allEntries = true)
    public Homework addHomework(Homework homework) {
        return homeworkRepository.save(homework);
    }

    @Override
    @CacheEvict(value = "homeworkCache", allEntries = true)
    public boolean deleteHomework(String homeworkName) {
        Homework homework = homeworkRepository.findByName(homeworkName);
        if (homework == null) {
            return false;
        }
        homeworkRepository.delete(homework);
        return true;
    }

    @Override
    @CacheEvict(value = "homeworkCache", key = "'allhomework'")
    public void evictAllHomeworkCache() {
        // 仅用于清除缓存
    }
}