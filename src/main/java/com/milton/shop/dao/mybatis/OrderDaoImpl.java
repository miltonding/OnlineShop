package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.OrderMapper;
import com.milton.shop.model.Order;

public class OrderDaoImpl extends SqlSessionDaoSupport implements OrderMapper {
    private static final String CLASS_NAME = OrderMapper.class.getName();

    public int deleteByPrimaryKey(Integer orderid) {
        // TODO Auto-generated method stub
        return 0;
    }

    public int insert(Order record) {
         getSqlSession().insert(CLASS_NAME + ".insert", record);
         return record.getOrderid();
    }

    public Order selectByPrimaryKey(Integer orderid) {
        return getSqlSession().selectOne(CLASS_NAME + ".selectByPrimaryKey", orderid);
    }

    public List<Order> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public int updateByPrimaryKey(Order record) {
        return getSqlSession().update(CLASS_NAME + ".updateByPrimaryKey", record);
    }

    @Override
    public Order selectBydisplayid(String displayid) {
        return getSqlSession().selectOne(CLASS_NAME + ".selectBydisplayid", displayid);
    }

    @Override
    public List<Order> findByUserid(Integer userid) {
        return getSqlSession().selectList(CLASS_NAME + ".findByUserid", userid);
    }
}
