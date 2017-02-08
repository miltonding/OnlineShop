package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.UserRoleMapper;
import com.milton.shop.model.UserRole;
import com.milton.shop.service.UserRoleService;

public class UserRoleServiceImpl implements UserRoleService {

    private UserRoleMapper userRoleDao;

    @Override
    public List<Integer> findRoleByUserid(Integer userid) {
        return userRoleDao.findRoleByUserid(userid);
    }

    @Override
    public void insert(UserRole record) {
        userRoleDao.insert(record);
    }

    public void setUserRoleDao(UserRoleMapper userRoleDao) {
        this.userRoleDao = userRoleDao;
    }
}
