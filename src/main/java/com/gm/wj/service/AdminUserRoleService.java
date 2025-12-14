package com.gm.wj.service;

import com.gm.wj.entity.AdminRole;
import com.gm.wj.entity.AdminUserRole;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AdminUserRoleService {
    List<AdminUserRole> listAllByUid(int uid);

    @Transactional
    void saveRoleChanges(int uid, List<AdminRole> roles);
}
