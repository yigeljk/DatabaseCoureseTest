package com.gm.wj.service.impl;

import com.gm.wj.dao.UserDAO;
import com.gm.wj.entity.User;
import com.gm.wj.redis.RedisService;
import com.gm.wj.service.*;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;
import javax.transaction.Transactional;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDAO userDAO;
    @Autowired
    AdminRoleService adminRoleService;
    @Autowired
    AdminUserRoleService adminUserRoleService;
    @Autowired
    RedisService redisService;

    @Override
    public List<User> list() {
        return userDAO.findAll();
    }

    @Override
    public boolean isExist(String username) {
        return userDAO.findByUsername(username) != null;
    }

    @Override
    public User findByUsername(String username) {
        return userDAO.findByUsername(username);
    }

    @Override
    public User get(String username, String password) {
        return userDAO.getByUsernameAndPassword(username, password);
    }

    @Override
    @Transactional
    public int register(User user) {
        String username = HtmlUtils.htmlEscape(user.getUsername());
        String name = HtmlUtils.htmlEscape(user.getName());
        String phone = HtmlUtils.htmlEscape(user.getPhone());
        String email = HtmlUtils.htmlEscape(user.getEmail());
        String password = user.getPassword();

        user.setUsername(username);
        user.setName(name);
        user.setPhone(phone);
        user.setEmail(email);
        user.setEnabled(true);

        if (username.isEmpty() || password.isEmpty()) return 0;
        if (isExist(username)) return 2;

        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        String encodedPassword = new SimpleHash("md5", password, salt, 2).toString();

        user.setSalt(salt);
        user.setPassword(encodedPassword);
        userDAO.save(user);
        return 1;
    }

    @Override
    @Transactional
    public void updateUserStatus(User user) {
        User userInDB = userDAO.findByUsername(user.getUsername());
        userInDB.setEnabled(user.isEnabled());
        userDAO.save(userInDB);
    }

    @Override
    @Transactional
    public User resetPassword(User user) {
        User userInDB = userDAO.findByUsername(user.getUsername());
        String salt = new SecureRandomNumberGenerator().nextBytes().toString();
        String encodedPassword = new SimpleHash("md5", "123", salt, 2).toString();
        userInDB.setSalt(salt);
        userInDB.setPassword(encodedPassword);
        return userDAO.save(userInDB);
    }

    @Override
    @Transactional
    public void editUser(User user) {
        User userInDB = userDAO.findByUsername(user.getUsername());
        userInDB.setName(user.getName());
        userInDB.setPhone(user.getPhone());
        userInDB.setEmail(user.getEmail());
        userDAO.save(userInDB);
        adminUserRoleService.saveRoleChanges(userInDB.getId(), user.getRoles());
    }

    @Override
    @Transactional
    public void deleteById(int id) {
        userDAO.deleteById(id);
    }
}
