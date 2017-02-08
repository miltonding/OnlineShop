package com.milton.shop.dao;

import com.milton.shop.model.Goods;
import com.milton.shop.model.Pagination;
import com.milton.shop.model.wrapper.GoodsWrapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface GoodsMapper {
    int deleteByPrimaryKey(@Param("goodsid") Integer goodsid, @Param("productid") Integer productid);

    int updateByPrimaryKey(Goods record);

    public int createGoods(Goods record);

    public int getGoodsQuantity(Pagination pagination);

    public List<GoodsWrapper> dynamicQuery(Pagination pagination);

    public GoodsWrapper getByPrimaryKey(@Param("goodsid") Integer goodsid);

    public List<GoodsWrapper> findGoods(List<Integer> goodsidList);
}