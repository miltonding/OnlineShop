package com.milton.shop.dao;

import com.milton.shop.model.LineGoods;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LineGoodsMapper {
    int deleteByOrderid(@Param("orderid") Integer orderid);

    public int create(LineGoods record);

    public List<LineGoods> findByOrderid(@Param("orderid") Integer orderid);

    List<LineGoods> selectAll();

    int updateByOrderid(LineGoods record);

    public int createBatch(List<LineGoods> lineGoodsList);
}