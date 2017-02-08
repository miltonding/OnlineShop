package com.milton.shop.service;

import java.util.List;
import java.util.Map;

import com.milton.shop.exception.ServiceException;
import com.milton.shop.model.Cart;
import com.milton.shop.model.Goods;
import com.milton.shop.model.Pagination;
import com.milton.shop.model.util.CartGoods;
import com.milton.shop.model.wrapper.GoodsWrapper;

public interface GoodsService {

    public void createGoodsAndInventory(GoodsWrapper goods) throws ServiceException;

    public List<GoodsWrapper> findGoodsDynamic(Pagination pagination);

    public int getGoodsQuantity(Pagination pagination);

    public GoodsWrapper getByPrimaryKey(int goodsid);

    public List<GoodsWrapper> findGoodsWrapper(Map<String, Integer> cartMap);

    public List<GoodsWrapper> findGoodsOnline(List<Cart> cartList);

    public List<GoodsWrapper> findGoods(List<Integer> goodsidList);
}
