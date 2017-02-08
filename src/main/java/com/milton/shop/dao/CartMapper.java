package com.milton.shop.dao;

import com.milton.shop.model.Cart;
import java.util.List;

public interface CartMapper {
    public int deleteByPrimaryKey(Integer cartid);

    public int deleteBatch(List<Integer> cartidList);

    public int addCart(Cart record);

    Cart selectByPrimaryKey(Integer cartid);

    List<Cart> selectAll();

    public int updateByPrimaryKey(Cart record);

    public Cart getByUseridAndGoodsid(Cart cart);

    public List<Cart> findByUserid(Integer userid);

    public Cart getByPrimarykey(Integer cartid);

    public List<Cart> findCarts(List<Integer> cartidList);

    public Double getListTotalCost(List<Integer> cartidList);

    public Double getListTotalPrice(List<Integer> cartidList);

    public Double getTotalCost(Integer cartid);

    public Double getTotalPrice(Integer cartid);
}