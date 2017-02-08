package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.LineGoodsMapper;
import com.milton.shop.model.LineGoods;

public class LineGoodsDaoImpl extends SqlSessionDaoSupport implements LineGoodsMapper {
    private static final String CLASS_NAME = LineGoodsMapper.class.getName();

    public int deleteByOrderid(Integer orderid) {
        // TODO Auto-generated method stub
        return 0;
    }

    public int create(LineGoods record) {
        return getSqlSession().insert(CLASS_NAME + ".create", record);
    }

    public int createBatch(List<LineGoods> lineGoodsList) {
        return getSqlSession().insert(CLASS_NAME + ".createBatch", lineGoodsList);
    }

    public List<LineGoods> findByOrderid(Integer orderid) {
        return getSqlSession().selectList(CLASS_NAME + ".findByOrderid", orderid);
    }

    public List<LineGoods> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public int updateByOrderid(LineGoods record) {
        // TODO Auto-generated method stub
        return 0;
    }
}
