package com.milton.shop.dao;

import com.milton.shop.model.City;
import java.util.List;

public interface CityMapper {
    int deleteByPrimaryKey(Integer cityid);

    int insert(City record);

    City selectByPrimaryKey(Integer cityid);

    List<City> selectAll();

    int updateByPrimaryKey(City record);

    List<City> findByProvinceId(int provinceid);
}