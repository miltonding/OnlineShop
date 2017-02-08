package com.milton.shop.dao;

import com.milton.shop.model.UserRole;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UserRoleMapper {
    int deleteByPrimaryKey(@Param("userid") Integer userid, @Param("roleid") Integer roleid);

    public int insert(UserRole record);

    List<UserRole> selectAll();

    public List<Integer> findRoleByUserid(Integer userid);
}