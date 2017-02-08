package com.milton.shop.dao;

import com.milton.shop.model.Order;
import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer orderid);

    public int insert(Order record);

    public Order selectByPrimaryKey(Integer orderid);

    public Order selectBydisplayid(String displayid);

    List<Order> selectAll();

    public int updateByPrimaryKey(Order record);
    
    public List<Order> findByUserid(Integer userid);
}