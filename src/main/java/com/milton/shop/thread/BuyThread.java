package com.milton.shop.thread;

import com.milton.shop.exception.ServiceException;
import com.milton.shop.service.OrderService;
import com.milton.shop.util.SpringUtil;

public class BuyThread extends Thread{

    private static OrderService orderService;
    private Integer orderid;
    private String creditcard;

    static {
        if (orderService == null) {
            orderService = (OrderService) SpringUtil.getBean("orderService");
        }
    }

    public BuyThread(Integer orderid, String creditcard) {
        super();
        this.orderid = orderid;
        this.creditcard = creditcard;
    }

    @Override
    public void run() {

        synchronized ("1") {
            // 购买操作
            try {
                orderService.updateInventoryAndOrder(orderid, creditcard);
            } catch (ServiceException e) {
                e.printStackTrace();
            }
        }
    }
}
