package com.milton.shop.service;

import java.util.List;

import com.milton.shop.model.City;
import com.milton.shop.model.District;

public interface DistrictService {

    public List<District> findByCityId(int cityid);
}
