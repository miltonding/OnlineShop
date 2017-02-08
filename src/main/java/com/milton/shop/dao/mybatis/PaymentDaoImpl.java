package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.PaymentMapper;
import com.milton.shop.model.Payment;

public class PaymentDaoImpl extends SqlSessionDaoSupport implements PaymentMapper {
    private static final String CLASS_NAME = PaymentMapper.class.getName();

    @Override
    public int deleteByPrimaryKey(Integer paymentid) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Payment record) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public Payment selectByPrimaryKey(Integer paymentid) {
        return getSqlSession().selectOne(CLASS_NAME + ".selectByPrimaryKey", paymentid);
    }

    @Override
    public List<Payment> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKey(Payment record) {
        // TODO Auto-generated method stub
        return 0;
    }

}
