package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.UserMapper;
import com.milton.shop.dao.UserRoleMapper;
import com.milton.shop.model.UserRole;

public class UserRoleDaoimpl extends SqlSessionDaoSupport implements UserRoleMapper {

    private static final String CLASS_NAME = UserRoleMapper.class.getName();

    @Override
    public int deleteByPrimaryKey(Integer userid, Integer roleid) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(UserRole record) {
        return getSqlSession().insert(CLASS_NAME + ".insert", record);
    }

    @Override
    public List<UserRole> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public List<Integer> findRoleByUserid(Integer userid) {
        return getSqlSession().selectList(CLASS_NAME + ".findRoleByUserid", userid);
    }

}
