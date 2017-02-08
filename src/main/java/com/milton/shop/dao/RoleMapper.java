package com.milton.shop.dao;

import com.milton.shop.model.Role;
import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    Role selectByPrimaryKey(Integer roleid);

    List<Role> selectAll();

    int updateByPrimaryKey(Role record);
}