package com.milton.shop.dao;

import com.milton.shop.model.Province;
import java.util.List;

public interface ProvinceMapper {
    int deleteByPrimaryKey(Integer provinceid);

    int insert(Province record);

    Province selectByPrimaryKey(Integer provinceid);

    List<Province> selectAll();

    int updateByPrimaryKey(Province record);
}