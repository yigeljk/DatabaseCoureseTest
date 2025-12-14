package com.gm.wj.service;

import com.gm.wj.entity.AdminPermission;
import com.gm.wj.entity.AdminRolePermission;

import java.util.List;

public interface AdminRolePermissionService {
    List<AdminRolePermission> findAllByRid(int rid);
    void savePermChanges(int rid, List<AdminPermission> perms);
}