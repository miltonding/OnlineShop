package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.CityMapper;
import com.milton.shop.dao.DistrictMapper;
import com.milton.shop.model.City;
import com.milton.shop.model.District;
import com.milton.shop.service.CityService;
import com.milton.shop.service.DistrictService;

public class DistrictServiceImpl implements DistrictService{

    private DistrictMapper districtDao;

    public void setDistrictDao(DistrictMapper districtDao) {
        this.districtDao = districtDao;
    }

    public List<District> findByCityId(int cityid) {
        return districtDao.findByCityId(cityid);
    }

}
