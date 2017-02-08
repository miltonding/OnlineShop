package com.milton.shop.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.milton.shop.constants.Constants;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Cart;
import com.milton.shop.model.LineGoods;
import com.milton.shop.model.Order;
import com.milton.shop.model.wrapper.AddressWrapper;
import com.milton.shop.model.wrapper.GoodsWrapper;
import com.milton.shop.service.AddressService;
import com.milton.shop.service.CartService;
import com.milton.shop.service.GoodsService;
import com.milton.shop.service.LineGoodsService;
import com.milton.shop.service.OrderService;
import com.milton.shop.service.UserService;
import com.milton.shop.thread.BuyThread;
import com.milton.shop.util.ParamUtil;
import com.milton.shop.util.StringUtil;
import com.milton.shop.util.Validator;

@Controller
@RequestMapping("page/order")
public class OrderController extends BaseController {
    @Autowired
    private CartService cartService;
    @Autowired
    private UserService userService;
    @Autowired
    private GoodsService goodsService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private LineGoodsService lineGoodsService;

    private final Logger LOG = Logger.getLogger(OrderController.class);

    @RequestMapping(value = "/orderCreate", method = {RequestMethod.GET})
    public ModelAndView orderCreate() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setView(getRedirectView(Constants.CART_LIST_PAGE));
        return modelAndView;
    }

    @RequestMapping(value = "/orderCreate", method = {RequestMethod.POST})
    public ModelAndView orderCreateSubmit(Integer[] cartid) {
        ModelAndView modelAndView = new ModelAndView();
        if (getUser() == null || cartid.length == 0) {
            modelAndView.setView(getRedirectView(Constants.USER_LOGIN_PAGE));
            return modelAndView;
        }

        // Find address List
        List<AddressWrapper> addressList = userService.findAddressWrapper(getUserid());
        modelAndView.addObject(Constants.ADDRESS_LIST, addressList);

        // Find Cart list
        List<Cart> cartList = cartService.findCarts(Arrays.asList(cartid));
        List<GoodsWrapper>  goodsList = goodsService.findGoodsOnline(cartList);
        modelAndView.addObject(Constants.GOODS_LIST, goodsList);
        modelAndView.setViewName(Constants.ORDER_CREATE_JSP);
        return modelAndView;
    }

    @RequestMapping(value = "/orderPay", method = {RequestMethod.GET})
    public ModelAndView orderPay(String orderid) {
        ModelAndView modelAndView = new ModelAndView();
        Integer orderidInt = ParamUtil.getInteger(orderid, 0);
        if (orderidInt == 0) {
            return null;
        }
        Order order = orderService.getOrderByPrimarykey(orderidInt);
        if (order == null) {
            return null;
        }
        if (order.getIsPay() == 0 && order.getIsDelete() == 0 
                && getUserid() == order.getUserid()) {
            modelAndView.addObject(Constants.ORDER, order);
            modelAndView.setViewName(Constants.ORDER_PAY_JSP);
        }
        return modelAndView;
    }

    @RequestMapping(value = "/orderPay", method = {RequestMethod.POST})
    public ModelAndView orderPaySubmit(int paymentid, int receiveAddrid,
                                       int billAddrid, Integer[] cartid) {
        ModelAndView modelAndView = new ModelAndView();
        if (Validator.isNullEmptyArray(cartid)) {
            modelAndView.setView(getRedirectView(Constants.CART_LIST_PAGE));
            return modelAndView;
        }
        Integer orderid = null;
        try {
            orderid = orderService.createOrderAndLineGoods(paymentid, getUserid(),
                    receiveAddrid, billAddrid, Arrays.asList(cartid));
            // Update cart quantity
            setSessionCartQty(getSessionCartQty() - cartid.length);
            modelAndView.addObject(Constants.ORDER_ID, orderid);
        } catch (Exception e) {
            e.printStackTrace();
            modelAndView.setView(getRedirectView(Constants.CART_LIST_PAGE));
            return modelAndView;
        }

        modelAndView.setView(getRedirectView(Constants.ORDER_PAY_PAGE));
        return modelAndView;
    }

    @RequestMapping(value = "/orderBuy", method = {RequestMethod.POST})
    public ModelAndView orderBuySubmit(String orderid, String creditcard) {
        ModelAndView modelAndView = new ModelAndView();
        Integer orderidInt = ParamUtil.getInteger(orderid, 0);
        creditcard = ParamUtil.getString(creditcard, Constants.BLANK);
        if (orderidInt == 0 || Validator.isNullEmptyString(creditcard)) {
            return null;
        }
        Thread thread = new BuyThread(orderidInt, creditcard);
        thread.run();
        modelAndView.addObject(Constants.ORDER_ID, orderidInt);
        modelAndView.setView(getRedirectView(Constants.ORDER_DETAIL_PAGE));
        return modelAndView;
    }

    @RequestMapping(value = "/orderCancel", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView orderCancel(String orderid) {
        ModelAndView modelAndView = new ModelAndView();
        Integer orderidInt = ParamUtil.getInteger(orderid, 0);
        if (orderidInt == 0) {
            return null;
        }

        Order order = orderService.getOrderByPrimarykey(orderidInt);
        if (order == null) {
            return null;
        }
        if (order.getIsPay() == 0 && order.getIsDelete() == 0 
                && order.getIsCancel() == 0 && getUserid() == order.getUserid()) {
            try {
                order.setIsCancel(1);
                order.setCancelTime(new Date());
                orderService.updateByPrimaryKey(order);
            } catch (ServiceException e) {
                e.printStackTrace();
            }
            modelAndView.setView(getRedirectView(Constants.ORDER_LIST_PAGE));
        }
        return modelAndView;
    }

    @RequestMapping(value = "/orderDetail", method = {RequestMethod.GET})
    public ModelAndView orderDetail(String orderid) {
        ModelAndView modelAndView = new ModelAndView();
        Integer orderidInt = ParamUtil.getInteger(orderid, 0);
        if (orderidInt == 0) {
            return null;
        }

        Order order = null;
        try {
            order = orderService.getOrderByPrimarykey(orderidInt);
            if (order != null && getUserid() == order.getUserid()) {
                // Get Address
                AddressWrapper receiveAddress = addressService.getByAddressid(order.getReceiveAddrid(), getUserid());
                AddressWrapper billAddress = addressService.getByAddressid(order.getBillAddrid(), getUserid());

                // Get goods
                List<LineGoods> lineGoodsList = lineGoodsService.findByOrderid(order.getOrderid());
                List<Cart> cartList = new ArrayList<>();
                Map<String, Integer> cartMap = new HashMap<>();
                if (!Validator.isNullEmptyCollection(lineGoodsList)) {
                    for (LineGoods lineGoods : lineGoodsList) {
                        cartList.add(new Cart(lineGoods.getGoodsid(), lineGoods.getQuantity()));
                        cartMap.put(String.valueOf(lineGoods.getGoodsid()), lineGoods.getQuantity());
                    }
                }
                List<GoodsWrapper> goodsList = goodsService.findGoodsOnline(cartList);
                if (!Validator.isNullEmptyCollection(lineGoodsList)) {
                    for (GoodsWrapper goods : goodsList) {
                        goods.setQuantity(cartMap.get(String.valueOf(goods.getGoodsid())));
                    }
                }

                // 加密
                String creditcard = StringUtil.simpfy(order.getCreditcard(), 3, 4);
                order.setCreditcard(creditcard);
                modelAndView.addObject(Constants.ORDER, order);
                modelAndView.addObject(Constants.RECEIVE_ADDRESS, receiveAddress);
                modelAndView.addObject(Constants.BILL_ADDRESS, billAddress);
                modelAndView.addObject(Constants.RECEIVE_ADDRESS, receiveAddress);
                modelAndView.addObject(Constants.GOODS_LIST, goodsList);

                modelAndView.setViewName(Constants.ORDER_DETAIL_JSP);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @RequestMapping(value = "/orderList", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView orderList() {
        ModelAndView modelAndView = new ModelAndView();
        List<Map<String, Object>> orderList = null;
        try {
            orderList = orderService.findOrderList(getUserid());
            modelAndView.addObject(Constants.ORDER_LIST, orderList);
        } catch (ServiceException e) {
            e.printStackTrace();
        }
        modelAndView.setViewName(Constants.ORDER_LIST_JSP);
        return modelAndView;
    }

    public void setCartService(CartService cartService) {
        this.cartService = cartService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    public void setAddressService(AddressService addressService) {
        this.addressService = addressService;
    }

    public void setLineGoodsService(LineGoodsService lineGoodsService) {
        this.lineGoodsService = lineGoodsService;
    }
}
