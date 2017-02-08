package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.UserMapper;
import com.milton.shop.model.User;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserMapper {
    private static final String CLASS_NAME = UserMapper.class.getName();
 
    public int deleteByPrimaryKey(Integer userid) {
        return 0;
    }

    public int createUser(User user) {
        getSqlSession().insert(CLASS_NAME + ".createUser", user);
        return user.getUserid();
    }

    public User selectByPrimaryKey(Integer userid) {
        return getSqlSession().selectOne(CLASS_NAME + ".selectByPrimaryKey", userid);
    }

    public List<User> selectAll() {
        return getSqlSession().selectList(CLASS_NAME + ".selectAll");
    }

    public User getUserByUserName(String userName) {
        return getSqlSession().selectOne(CLASS_NAME + ".getUserByUserName", userName);
    }

    public int updatePassword(User user) {
        return getSqlSession().update(CLASS_NAME + ".updatePassword", user);
    }

    public int updateLatLoginTime(User user) {
        return getSqlSession().update(CLASS_NAME + ".updateLatLoginTime", user);
    }

    public int updateHeader(User user) {
        return getSqlSession().update(CLASS_NAME + ".updateHeader", user);
    }

    public int updateProfile(User user) {
        return getSqlSession().update(CLASS_NAME + ".updateProfile", user);
    }
}
