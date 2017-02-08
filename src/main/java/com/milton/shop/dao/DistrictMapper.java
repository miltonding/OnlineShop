package com.milton.shop.dao;

import com.milton.shop.model.District;
import java.util.List;

public interface DistrictMapper {
    int deleteByPrimaryKey(Integer districtid);

    int insert(District record);

    District selectByPrimaryKey(Integer districtid);

    List<District> selectAll();

    int updateByPrimaryKey(District record);
    
    List<District> findByCityId(int cityid);
}