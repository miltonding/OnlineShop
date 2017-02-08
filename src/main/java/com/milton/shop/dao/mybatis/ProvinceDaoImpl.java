package com.milton.shop.dao.mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.ProvinceMapper;
import com.milton.shop.model.Province;

public class ProvinceDaoImpl extends SqlSessionDaoSupport implements ProvinceMapper {
    private static final String CLASS_NAME = ProvinceMapper.class.getName();

    public int deleteByPrimaryKey(Integer provinceid) {
        // TODO Auto-generated method stub
        return 0;
    }

    public int insert(Province record) {
        // TODO Auto-generated method stub
        return 0;
    }

    public Province selectByPrimaryKey(Integer provinceid) {
        // TODO Auto-generated method stub
        return null;
    }

    public List<Province> selectAll() {
        return getSqlSession().selectList(CLASS_NAME + ".selectAll");
    }

    public int updateByPrimaryKey(Province record) {
        // TODO Auto-generated method stub
        return 0;
    }

}
