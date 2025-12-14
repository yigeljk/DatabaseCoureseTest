package com.gm.wj.service;

import com.gm.wj.entity.AdminRoleMenu;

import java.util.List;
import java.util.Map;

public interface AdminRoleMenuService {
    List<AdminRoleMenu> findAllByRid(int rid);
    List<AdminRoleMenu> findAllByRid(List<Integer> rids);
    void save(AdminRoleMenu rm);
    void updateRoleMenu(int rid, Map<String, List<Integer>> menusIds);
}