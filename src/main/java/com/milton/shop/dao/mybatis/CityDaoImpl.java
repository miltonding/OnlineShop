package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.CityMapper;
import com.milton.shop.dao.ProvinceMapper;
import com.milton.shop.model.City;
import com.milton.shop.model.Province;

public class CityDaoImpl extends SqlSessionDaoSupport implements CityMapper {
    private static final String CLASS_NAME = CityMapper.class.getName();

    public int deleteByPrimaryKey(Integer cityid) {
        // TODO Auto-generated method stub
        return 0;
    }

    public int insert(City record) {
        // TODO Auto-generated method stub
        return 0;
    }

    public City selectByPrimaryKey(Integer cityid) {
        // TODO Auto-generated method stub
        return null;
    }

    public List<City> selectAll() {
        // TODO Auto-generated method stub
        return null;
    }

    public int updateByPrimaryKey(City record) {
        // TODO Auto-generated method stub
        return 0;
    }

    public List<City> findByProvinceId(int provinceid) {
        return getSqlSession().selectList(CLASS_NAME + ".findByProvinceId", provinceid);
    }

}
