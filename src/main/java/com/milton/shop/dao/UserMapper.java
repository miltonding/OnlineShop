package com.milton.shop.dao;

import com.milton.shop.model.User;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    User selectByPrimaryKey(Integer userid);

    List<User> selectAll();

    public int createUser(User user);

    public User getUserByUserName(String userName);

    public int updatePassword(User user);

    public int updateLatLoginTime(User user);
    
    public int updateHeader(User user);

    public int updateProfile(User user);
}