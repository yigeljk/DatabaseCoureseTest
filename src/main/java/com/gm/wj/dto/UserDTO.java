package com.gm.wj.dto;

import com.gm.wj.dto.base.OutputConverter;
import com.gm.wj.entity.AdminRole;
import com.gm.wj.entity.User;
import lombok.Data;
import lombok.ToString;

import java.util.List;

/**
 * @author Evan
 * @date 2020/4/1 19:57
 */
@Data
@ToString
public class UserDTO implements OutputConverter<UserDTO, User> {

    private int id;
    private String username;
    private String name;
    private String phone;
    private String email;
    private boolean enabled;
    private List<AdminRole> roles;

    // 转换方法，将 User 转换为 UserDTO
    @Override
    public UserDTO convertFrom(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setUsername(user.getUsername());
        userDTO.setName(user.getName());
        userDTO.setPhone(user.getPhone());
        userDTO.setEmail(user.getEmail());
        userDTO.setEnabled(user.isEnabled());
        // 可以通过传递给 UserDTO 的其他数据来初始化 roles 等字段
        return userDTO;
    }

    // Getters 和 Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public List<AdminRole> getRoles() {
        return roles;
    }

    public void setRoles(List<AdminRole> roles) {
        this.roles = roles;
    }
}
