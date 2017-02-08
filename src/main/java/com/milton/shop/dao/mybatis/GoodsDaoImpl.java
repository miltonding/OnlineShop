package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.GoodsMapper;
import com.milton.shop.model.Goods;
import com.milton.shop.model.Pagination;
import com.milton.shop.model.wrapper.GoodsWrapper;

public class GoodsDaoImpl extends SqlSessionDaoSupport implements GoodsMapper {
    private static final String CLASS_NAME = GoodsMapper.class.getName();

    public int deleteByPrimaryKey(Integer goodsid, Integer productid) {
        // TODO Auto-generated method stub
        return 0;
    }

    public GoodsWrapper getByPrimaryKey(Integer goodsid) {
        return getSqlSession().selectOne(CLASS_NAME + ".getByPrimaryKey", goodsid);
    }

    public int updateByPrimaryKey(Goods record) {
        // TODO Auto-generated method stub
        return 0;
    }

    public int createGoods(Goods record) {
        getSqlSession().insert(CLASS_NAME + ".createGoods", record);
        return record.getGoodsid();
    }

    public int getGoodsQuantity(Pagination pagination) {
        return getSqlSession().selectOne(CLASS_NAME + ".getGoodsQuantity", pagination);
    }

    public List<GoodsWrapper> dynamicQuery(Pagination pagination) {
        return getSqlSession().selectList(CLASS_NAME + ".dynamicQuery", pagination);
    }

    public List<GoodsWrapper> findGoods(List<Integer> goodsidList) {
        return getSqlSession().selectList(CLASS_NAME + ".findGoods", goodsidList);
    }

}
