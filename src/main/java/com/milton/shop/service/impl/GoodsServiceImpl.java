package com.milton.shop.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.milton.shop.dao.GoodsMapper;
import com.milton.shop.dao.InventoryMapper;
import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Cart;
import com.milton.shop.model.Goods;
import com.milton.shop.model.Inventory;
import com.milton.shop.model.Pagination;
import com.milton.shop.model.util.CartGoods;
import com.milton.shop.model.wrapper.GoodsWrapper;
import com.milton.shop.service.GoodsService;
import com.milton.shop.util.EncodeUtil;

public class GoodsServiceImpl implements GoodsService {
    private GoodsMapper goodsDao;
    private InventoryMapper inventoryDao;

    public void createGoodsAndInventory(GoodsWrapper goods) throws ServiceException {
        try {
            int goodsid = goodsDao.createGoods(goods);
            Inventory inventory = new Inventory();
            inventory.setGoodsid(goodsid);
            inventory.setQuantity(goods.getQuantity());
            inventoryDao.insert(inventory);
        } catch (Exception e) {
            throw new ServiceException("Create goods failed");
        }
        
    }

    public int getGoodsQuantity(Pagination pagination) {
        return goodsDao.getGoodsQuantity(pagination);
    }

    public List<GoodsWrapper> findGoodsDynamic(Pagination pagination) {
        return goodsDao.dynamicQuery(pagination);
    }

    public GoodsWrapper getByPrimaryKey(int goodsid) {
        return goodsDao.getByPrimaryKey(goodsid);
    }

    public List<GoodsWrapper> findGoodsWrapper(Map<String, Integer> cartMap) {
        List<Integer> goodsidList = new ArrayList<Integer>();
        Set<String> keySet = cartMap.keySet();
        for (String key : keySet) {
            goodsidList.add(Integer.parseInt(key));
        }
        List<GoodsWrapper> goodsList = goodsDao.findGoods(goodsidList);
        // set cartQty
        for (GoodsWrapper goods : goodsList) {
            Integer cartQuantity = cartMap.get(String.valueOf(goods.getGoodsid()));
            goods.setCartQuantity(cartQuantity);
            EncodeUtil.encode(goods);
        }
        return goodsList;
    }

   /* public List<GoodsWrapper> findGoodsCookie(Map<Integer, Integer> cartMap) {
        List<Integer> goodsidList = new ArrayList<Integer>();
        Set<Integer> keySet = cartMap.keySet();
        for (Integer key : keySet) {
            goodsidList.add(key);
        }
        List<GoodsWrapper> goodsList = goodsDao.findGoods(goodsidList);
        // set cartQty
        for (GoodsWrapper goods : goodsList) {
            Integer cartQuantity = cartMap.get(goods.getGoodsid());
            goods.setCartQuantity(cartQuantity);
            EncodeUtil.encode(goods);
        }
        return goodsList;
    }*/

    /**
     * 
     *Cart<goodsid, quantity>
     *
     **/
    public List<GoodsWrapper> findGoodsOnline(List<Cart> cartList) {
        List<Integer> goodsidList = new ArrayList<Integer>();
        Map<Integer, Cart> cartMap = new HashMap<Integer, Cart>();
        for (Cart cart : cartList) {
            goodsidList.add(cart.getGoodsid());
            cartMap.put(cart.getGoodsid(), cart);
        }
        List<GoodsWrapper> goodsList = goodsDao.findGoods(goodsidList);
        // Set cartid  cart qty
        for (GoodsWrapper goods : goodsList) {
            Cart cart = cartMap.get(goods.getGoodsid());
            goods.setCartQuantity(cart.getQuantity());
            goods.setCartid(cart.getCartid());
            EncodeUtil.encode(goods);
        }
        return goodsList;
    }

    public List<GoodsWrapper> findGoods(List<Integer> goodsidList) {
        return goodsDao.findGoods(goodsidList);
    }

    public void setGoodsDao(GoodsMapper goodsDao) {
        this.goodsDao = goodsDao;
    }

    public void setInventoryDao(InventoryMapper inventoryDao) {
        this.inventoryDao = inventoryDao;
    }
}
