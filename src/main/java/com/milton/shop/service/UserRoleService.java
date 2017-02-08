package com.milton.shop.service;

import java.util.List;

import com.milton.shop.model.UserRole;

public interface UserRoleService {

    public List<Integer> findRoleByUserid(Integer userid);

    public void insert(UserRole record);
}
