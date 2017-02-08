package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.CartMapper;
import com.milton.shop.model.Cart;

public class CartDaoImpl extends SqlSessionDaoSupport implements CartMapper {
    private static final String CLASS_NAME = CartMapper.class.getName();

    public int deleteByPrimaryKey(Integer cartid) {
        return getSqlSession().update(CLASS_NAME + ".deleteByPrimaryKey", cartid);
    }

    public int addCart(Cart record) {
        return getSqlSession().insert(CLASS_NAME + ".addCart", record);
    }

    public Cart selectByPrimaryKey(Integer cartid) {
        // TODO Auto-generated method stub
        return null;
    }

    public List<Cart> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public int updateByPrimaryKey(Cart record) {
        return getSqlSession().update(CLASS_NAME + ".updateByPrimaryKey", record);
    }

    public Cart getByUseridAndGoodsid(Cart cart) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByUseridAndGoodsid", cart);
    }

    public List<Cart> findByUserid(Integer userid) {
        return getSqlSession().selectList(CLASS_NAME + ".findByUserid", userid);
    }

    public Cart getByPrimarykey(Integer cartid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByPrimarykey", cartid);
    }

    public List<Cart> findCarts(List<Integer> cartidList) {
        return getSqlSession().selectList(CLASS_NAME + ".findCarts", cartidList);
    }

    public Double getListTotalCost(List<Integer> cartidList) {
        return getSqlSession().selectOne(CLASS_NAME + ".getListTotalCost", cartidList);
    }

    public Double getListTotalPrice(List<Integer> cartidList) {
        return getSqlSession().selectOne(CLASS_NAME + ".getListTotalPrice", cartidList);
    }

    public Double getTotalCost(Integer cartid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getTotalCost", cartid);
    }

    public Double getTotalPrice(Integer cartid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getTotalPrice", cartid);
    }

    public int deleteBatch(List<Integer> cartidList) {
        return getSqlSession().delete(CLASS_NAME + ".deleteBatch", cartidList);
    }
}
