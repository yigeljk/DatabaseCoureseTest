package com.gm.wj.service.impl;

import com.gm.wj.dao.AdminUserRoleDAO;
import com.gm.wj.entity.AdminRole;
import com.gm.wj.entity.AdminUserRole;
import com.gm.wj.service.AdminUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminUserRoleServiceImpl implements AdminUserRoleService {
    @Autowired
    AdminUserRoleDAO adminUserRoleDAO;

    @Override
    public List<AdminUserRole> listAllByUid(int uid) {
        return adminUserRoleDAO.findAllByUid(uid);
    }

    @Override
    @Transactional
    public void saveRoleChanges(int uid, List<AdminRole> roles) {
        adminUserRoleDAO.deleteAllByUid(uid);
        List<AdminUserRole> urs = new ArrayList<>();
        roles.forEach(r -> {
            AdminUserRole ur = new AdminUserRole();
            ur.setUid(uid);
            ur.setRid(r.getId());
            urs.add(ur);
        });
        adminUserRoleDAO.saveAll(urs);
    }
}
