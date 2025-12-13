package com.gm.wj.service;

import com.gm.wj.entity.User;
import java.util.List;

public interface UserService {
    List<User> list();
    boolean isExist(String username);
    User findByUsername(String username);
    User get(String username, String password);
    int register(User user);
    void updateUserStatus(User user);
    User resetPassword(User user);
    void editUser(User user);
    void deleteById(int id);
}