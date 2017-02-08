package com.milton.shop.service;

import java.util.List;

import com.milton.shop.model.City;

public interface CityService {

    public List<City> findByProvinceId(int provinceid);
}
