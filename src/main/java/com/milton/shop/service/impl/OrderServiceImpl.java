package com.milton.shop.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.milton.shop.common.ServiceContext;
import com.milton.shop.constants.Constants;
import com.milton.shop.dao.AddressMapper;
import com.milton.shop.dao.CartMapper;
import com.milton.shop.dao.GoodsMapper;
import com.milton.shop.dao.InventoryMapper;
import com.milton.shop.dao.LineGoodsMapper;
import com.milton.shop.dao.OrderMapper;
import com.milton.shop.dao.PaymentMapper;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Address;
import com.milton.shop.model.Cart;
import com.milton.shop.model.Inventory;
import com.milton.shop.model.LineGoods;
import com.milton.shop.model.Order;
import com.milton.shop.model.Payment;
import com.milton.shop.model.wrapper.AddressWrapper;
import com.milton.shop.model.wrapper.GoodsWrapper;
import com.milton.shop.service.OrderService;
import com.milton.shop.util.EncodeUtil;
import com.milton.shop.util.Validator;

public class OrderServiceImpl implements OrderService {

    private OrderMapper orderDao;
    private CartMapper cartDao;
    private GoodsMapper goodsDao;
    private LineGoodsMapper lineGoodsDao;
    private PaymentMapper paymentDao;
    private InventoryMapper inventoryDao;
    private AddressMapper addressDao;

    public Integer createOrderAndLineGoods(Integer paymentid, Integer userid,
                                        Integer receiveAddrid, Integer billAddrid,
                                        List<Integer> cartidList) throws Exception {
        Integer orderid = null;
        // Find cart list
        List<Cart> cartList = cartDao.findCarts(cartidList);
        if (Validator.isNullEmptyCollection(cartList)) {
            throw new Exception();
        }

        // Confirm inventory
        for (Cart cart : cartList) {
            GoodsWrapper goods = goodsDao.getByPrimaryKey(cart.getGoodsid());
            if (cart.getQuantity() > goods.getQuantity()) {
                throw new ServiceException(String.format("[goodsid = %s] has not enough inventory", cart.getGoodsid()));
            }
        }
        Double totalPrice = cartDao.getListTotalPrice(cartidList);

        // 1. Create order
        Order order = new Order(paymentid, null, null, userid,
                receiveAddrid, billAddrid, null, totalPrice, null,
                0, 0, 0);
        orderid = orderDao.insert(order);

        // 2. Create line goods
        List<LineGoods> lineGoodsList = new ArrayList<LineGoods>();
        for (Cart cart : cartList) {
            LineGoods lineGoods = new LineGoods();
            lineGoods.setOrderid(orderid);
            lineGoods.setGoodsid(cart.getGoodsid());
            lineGoods.setQuantity(cart.getQuantity());
            lineGoods.setTotalCost(cartDao.getTotalCost(cart.getCartid()));
            lineGoods.setTotalPrice(cartDao.getTotalPrice(cart.getCartid()));
            lineGoodsList.add(lineGoods);
        }
        lineGoodsDao.createBatch(lineGoodsList);

        // Delete Cart
        cartDao.deleteBatch(cartidList);
        return orderid;
    }

    @Override
    public Order getOrderByPrimarykey(Integer orderid) {
        Order order = orderDao.selectByPrimaryKey(orderid);
        if (order == null) {
            return null;
        }
        Payment payment = paymentDao.selectByPrimaryKey(order.getPaymentid());
        if (payment != null) {
            order.setPaymentName(payment.getPaymentName());
        }
        return order;
    }

    @Override
    public Order getOrderByDisplayid(String displayid) {
        Order order = orderDao.selectBydisplayid(displayid);
        if (order == null) {
            return null;
        }
        Payment payment = paymentDao.selectByPrimaryKey(order.getPaymentid());
        if (payment != null) {
            order.setPaymentName(payment.getPaymentName());
        }
        return order;
    }

    @Override
    public void updateByPrimaryKey(Order order) throws ServiceException {
        int result = orderDao.updateByPrimaryKey(order);
        if (result <= 0) {
            throw new ServiceException(String.format(
                    "Update Order failed (orderid = %s)", order.getOrderid()));
        }
    }

    @Override
    public void updateInventoryAndOrder(Integer orderid, String creditcard) throws ServiceException {
        Order order = orderDao.selectByPrimaryKey(orderid);
        if (order == null) {
            throw new ServiceException(String.format(
                    "Get Order failed [orderid = %s]", orderid));
        }
        if (order.getIsPay() == 1) {
            throw new ServiceException(String.format(
                    "Order is pay [orderid = %s]", orderid));
        }
        if (order.getIsCancel() == 1 || order.getIsDelete() == 1) {
            throw new ServiceException(String.format(
                    "Order is cancel or delete [orderid = %s]", orderid));
        }
        int userId = ServiceContext.getServiceContext().getUserId();
        if (order.getUserid() != userId) {
            throw new ServiceException(String.format(
                    "Order [userid = %s] conflicts with [current user = %s]",
                    order.getUserid(), userId));
        }

        List<LineGoods> lineGoodsList = lineGoodsDao.findByOrderid(orderid);
        if (Validator.isNullEmptyCollection(lineGoodsList)) {
            throw new ServiceException(String.format(
                    "Find line goods failed [orderid = %s]", orderid));
        }

        // Update inventory
        for (LineGoods lineGoods : lineGoodsList) {
            Integer goodsid = lineGoods.getGoodsid();
            Integer buyQuantity = lineGoods.getQuantity();
            Inventory inventory = inventoryDao.selectByPrimaryKey(goodsid);
            if (inventory == null) {
                throw new ServiceException(String.format(
                        "Find inventory failed [goodsid = %s]", goodsid));
            }

            Integer storeQuantity = inventory.getQuantity();
            if (storeQuantity <= 0 || buyQuantity > storeQuantity) {
                throw new ServiceException(String.format(
                        "Inventory is not enough [goodsid = %s] "
                        + "[buyQuantity = %s] [storeQuantity = %s]", goodsid, buyQuantity, storeQuantity));
            }

            inventory.setQuantity(storeQuantity - buyQuantity);
            inventoryDao.updateByPrimaryKey(inventory);
        }

        // Update Order
        order.setCreditcard(creditcard);
        order.setIsPay(1);
        order.setPayTime(new Date());
        int result = orderDao.updateByPrimaryKey(order);
        if (result <= 0) {
            throw new ServiceException(String.format(
                    "Update order failed [orderid = %s]", order.getOrderid()));
        }
    }

    @Override
    public List<Map<String, Object>> findOrderList(Integer userid) throws ServiceException {
        List<Map<String, Object>> listMap = new ArrayList<>();
        List<Order> orderList = orderDao.findByUserid(userid);
        if (orderList == null) {
            throw new ServiceException(String.format(
                    "Find order failed [userid = %s]", userid));
        }

        for (Order order : orderList) {
            Map<String, Object> orderMap = new HashMap<>();
            List<GoodsWrapper> goodsList = new ArrayList<>();
            List<LineGoods> lineGoodsList = lineGoodsDao.findByOrderid(order.getOrderid());
            if (!Validator.isNullEmptyCollection(lineGoodsList)) {
                for (LineGoods lineGoods : lineGoodsList) {
                    GoodsWrapper goodsWrapper = goodsDao.getByPrimaryKey(lineGoods.getGoodsid());
                    goodsWrapper.setQuantity(lineGoods.getQuantity());
                    goodsList.add(goodsWrapper);
                }
            }
            AddressWrapper addressWrapper = addressDao.getUserAddress(
                    new Address(order.getReceiveAddrid(), userid));
            orderMap.put(Constants.ORDER, order);
            EncodeUtil.encodeList(goodsList);
            orderMap.put(Constants.GOODS_LIST, goodsList);
            orderMap.put(Constants.ADDRESS_WRAPPER, addressWrapper);
            listMap.add(orderMap);
        }
        return listMap;
    }

    public void setOrderDao(OrderMapper orderDao) {
        this.orderDao = orderDao;
    }

    public void setCartDao(CartMapper cartDao) {
        this.cartDao = cartDao;
    }

    public void setLineGoodsDao(LineGoodsMapper lineGoodsDao) {
        this.lineGoodsDao = lineGoodsDao;
    }

    public void setGoodsDao(GoodsMapper goodsDao) {
        this.goodsDao = goodsDao;
    }

    public void setPaymentDao(PaymentMapper paymentDao) {
        this.paymentDao = paymentDao;
    }

    public void setInventoryDao(InventoryMapper inventoryDao) {
        this.inventoryDao = inventoryDao;
    }

    public void setAddressDao(AddressMapper addressDao) {
        this.addressDao = addressDao;
    }
}
