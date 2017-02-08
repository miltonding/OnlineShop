package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.DistrictMapper;
import com.milton.shop.model.City;
import com.milton.shop.model.District;

public class DistrictDaoImpl extends SqlSessionDaoSupport implements DistrictMapper {
    private static final String CLASS_NAME = DistrictMapper.class.getName();

    public int deleteByPrimaryKey(Integer districtid) {
        // TODO Auto-generated method stub
        return 0;
    }

    public int insert(District record) {
        // TODO Auto-generated method stub
        return 0;
    }

    public District selectByPrimaryKey(Integer districtid) {
        // TODO Auto-generated method stub
        return null;
    }

    public List<District> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public int updateByPrimaryKey(District record) {
        // TODO Auto-generated method stub
        return 0;
    }

    public List<District> findByCityId(int cityid) {
        return getSqlSession().selectList(CLASS_NAME + ".findByCityId", cityid);
    }

}
