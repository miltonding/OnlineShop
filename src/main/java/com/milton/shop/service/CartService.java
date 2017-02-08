package com.milton.shop.service;

import java.util.List;

import com.milton.shop.model.Cart;

public interface CartService {

    public void addCart(Cart cart);

    public Cart getByUseridAndGoodsid(Cart cart);

    public void updateCart(Cart cart);

    public List<Cart> findByUserid(Integer userid);

    public void deleteCart(Integer cartid);

    public Cart getCartByPrimarykey(Integer cartid);

    public List<Cart> findCarts(List<Integer> cartidList);

    public Double getListTotalCost(List<Integer> cartidList);

    public Double getListTotalPrice(List<Integer> cartidList);

    public Double getTotalCost(Integer cartid);

    public Double getTotalPrice(Integer cartid);

}
