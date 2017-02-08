package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.CityMapper;
import com.milton.shop.model.City;
import com.milton.shop.service.CityService;

public class CityServiceImpl implements CityService{

    private CityMapper cityDao;

    public void setCityMapper(CityMapper cityDao) {
        this.cityDao = cityDao;
    }

    public List<City> findByProvinceId(int provinceid) {
        return cityDao.findByProvinceId(provinceid);
    }

}
