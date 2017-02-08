package com.milton.shop.dao;

import com.milton.shop.model.Inventory;
import java.util.List;

public interface InventoryMapper {
    int deleteByPrimaryKey(Integer goodsid);

    public int insert(Inventory record);

    public Inventory selectByPrimaryKey(Integer goodsid);

    List<Inventory> selectAll();

    int updateByPrimaryKey(Inventory record);
}