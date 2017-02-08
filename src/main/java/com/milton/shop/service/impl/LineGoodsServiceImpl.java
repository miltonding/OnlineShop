package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.LineGoodsMapper;
import com.milton.shop.model.LineGoods;
import com.milton.shop.service.LineGoodsService;

public class LineGoodsServiceImpl implements LineGoodsService {

    private LineGoodsMapper lineGoodsDao;

    public void create(LineGoods lineGoods) {
        lineGoodsDao.create(lineGoods);
    }

    public void createBatch(List<LineGoods> lineGoodsList) {
        lineGoodsDao.createBatch(lineGoodsList);
    }

    @Override
    public List<LineGoods> findByOrderid(Integer orderid) {
        return lineGoodsDao.findByOrderid(orderid);
    }

    public void setLineGoodsDao(LineGoodsMapper lineGoodsDao) {
        this.lineGoodsDao = lineGoodsDao;
    }
}
