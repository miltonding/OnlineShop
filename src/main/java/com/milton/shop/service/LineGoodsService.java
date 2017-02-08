package com.milton.shop.service;

import java.util.List;

import com.milton.shop.model.LineGoods;

public interface LineGoodsService {

    public void create(LineGoods lineGoods);

    public void createBatch(List<LineGoods> lineGoodsList);

    public List<LineGoods> findByOrderid(Integer orderid);
}
