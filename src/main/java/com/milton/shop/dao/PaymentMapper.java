package com.milton.shop.dao;

import com.milton.shop.model.Payment;
import java.util.List;

public interface PaymentMapper {
    int deleteByPrimaryKey(Integer paymentid);

    int insert(Payment record);

    Payment selectByPrimaryKey(Integer paymentid);

    List<Payment> selectAll();

    int updateByPrimaryKey(Payment record);
}