package com.gm.wj.service.impl;

import com.gm.wj.dao.AdminRolePermissionDAO;
import com.gm.wj.entity.AdminPermission;
import com.gm.wj.entity.AdminRolePermission;
import com.gm.wj.service.AdminRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminRolePermissionServiceImpl implements AdminRolePermissionService {

    @Autowired
    AdminRolePermissionDAO adminRolePermissionDAO;

    @Override
    public List<AdminRolePermission> findAllByRid(int rid) {
        return adminRolePermissionDAO.findAllByRid(rid);
    }

    @Override
    @Transactional
    public void savePermChanges(int rid, List<AdminPermission> perms) {
        adminRolePermissionDAO.deleteAllByRid(rid);
        List<AdminRolePermission> rps = new ArrayList<>();
        perms.forEach(p -> {
            AdminRolePermission rp = new AdminRolePermission();
            rp.setRid(rid);
            rp.setPid(p.getId());
            rps.add(rp);
        });
        adminRolePermissionDAO.saveAll(rps);
    }
}