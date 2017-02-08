package com.milton.shop.service;

import java.util.List;
import java.util.Map;

import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Order;

public interface OrderService {

    public Integer createOrderAndLineGoods(Integer paymentid, Integer userid,
            Integer receiveAddrid, Integer billAddrid, List<Integer> cartidList)
                    throws Exception;

    public Order getOrderByPrimarykey(Integer orderid);

    public Order getOrderByDisplayid(String displayid);

    public void updateByPrimaryKey(Order order) throws ServiceException;

    // Bug goods
    public void updateInventoryAndOrder(Integer orderid, String creditcard) throws ServiceException;

    public List<Map<String, Object>> findOrderList(Integer userid) throws ServiceException;

}
