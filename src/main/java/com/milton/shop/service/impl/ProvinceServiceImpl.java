package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.ProvinceMapper;
import com.milton.shop.model.Province;
import com.milton.shop.service.ProvinceService;

public class ProvinceServiceImpl implements ProvinceService{

    private ProvinceMapper provinceDao;

    public void setProvinceDao(ProvinceMapper provinceDao) {
        this.provinceDao = provinceDao;
    }

    public List<Province> findAllProvince() {
        return provinceDao.selectAll();
    }

}
