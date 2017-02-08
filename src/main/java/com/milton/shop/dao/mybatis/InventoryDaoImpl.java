package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.InventoryMapper;
import com.milton.shop.model.Inventory;

public class InventoryDaoImpl extends SqlSessionDaoSupport implements InventoryMapper {
    private static final String CLASS_NAME = InventoryMapper.class.getName();

    @Override
    public int deleteByPrimaryKey(Integer goodsid) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Inventory record) {
        return  getSqlSession().insert(CLASS_NAME + ".insert", record);
    }

    @Override
    public Inventory selectByPrimaryKey(Integer goodsid) {
        return getSqlSession().selectOne(CLASS_NAME + ".selectByPrimaryKey", goodsid);
    }

    @Override
    public List<Inventory> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public int updateByPrimaryKey(Inventory record) {
        return getSqlSession().update(CLASS_NAME + ".updateByPrimaryKey", record);
    }

}
