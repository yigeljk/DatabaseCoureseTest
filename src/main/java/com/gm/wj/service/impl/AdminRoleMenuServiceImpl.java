package com.gm.wj.service.impl;

import com.gm.wj.dao.AdminRoleMenuDAO;
import com.gm.wj.entity.AdminRoleMenu;
import com.gm.wj.service.AdminRoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class AdminRoleMenuServiceImpl implements AdminRoleMenuService {

    @Autowired
    AdminRoleMenuDAO adminRoleMenuDAO;

    @Override
    public List<AdminRoleMenu> findAllByRid(int rid) {
        return adminRoleMenuDAO.findAllByRid(rid);
    }

    @Override
    public List<AdminRoleMenu> findAllByRid(List<Integer> rids) {
        return adminRoleMenuDAO.findAllByRid(rids);
    }

    @Override
    public void save(AdminRoleMenu rm) {
        adminRoleMenuDAO.save(rm);
    }

    @Override
    @Transactional
    public void updateRoleMenu(int rid, Map<String, List<Integer>> menusIds) {
        adminRoleMenuDAO.deleteAllByRid(rid);
        List<AdminRoleMenu> rms = new ArrayList<>();
        for (Integer mid : menusIds.get("menusIds")) {
            AdminRoleMenu rm = new AdminRoleMenu();
            rm.setMid(mid);
            rm.setRid(rid);
            rms.add(rm);
        }
        adminRoleMenuDAO.saveAll(rms);
    }
}