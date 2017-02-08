package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.CartMapper;
import com.milton.shop.model.Cart;
import com.milton.shop.service.CartService;

public class CartServiceImpl implements CartService {

    private CartMapper cartDao;

    public void addCart(Cart cart) {
        cartDao.addCart(cart);
    }

    public Cart getByUseridAndGoodsid(Cart cart) {
        return cartDao.getByUseridAndGoodsid(cart);
    }

    public void updateCart(Cart cart) {
        cartDao.updateByPrimaryKey(cart);
    }

    public List<Cart> findByUserid(Integer userid) {
        return cartDao.findByUserid(userid);
    }

    public void deleteCart(Integer cartid) {
        cartDao.deleteByPrimaryKey(cartid);
    }

    public List<Cart> findCarts(List<Integer> cartidList) {
        return cartDao.findCarts(cartidList);
    }

    public Double getListTotalCost(List<Integer> cartidList) {
        return cartDao.getListTotalCost(cartidList);
    }

    public Double getListTotalPrice(List<Integer> cartidList) {
        return cartDao.getListTotalPrice(cartidList);
    }

    public Double getTotalCost(Integer cartid) {
        return cartDao.getTotalCost(cartid);
    }

    public Double getTotalPrice(Integer cartid) {
        return cartDao.getTotalPrice(cartid);
    }

    public Cart getCartByPrimarykey(Integer cartid) {
        return cartDao.getByPrimarykey(cartid);
    }

    public void setCartDao(CartMapper cartDao) {
        this.cartDao = cartDao;
    }

}
