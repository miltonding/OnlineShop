package com.milton.shop.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.milton.shop.dao.ProductMapper;
import com.milton.shop.model.Product;
import com.milton.shop.model.wrapper.ProductWrapper;

public class ProductDaoImpl extends SqlSessionDaoSupport implements ProductMapper {
    private static final String CLASS_NAME = ProductMapper.class.getName();

    public List<ProductWrapper> findByKindid(Integer kindid, Integer limit) {
        Map<String, Integer> paramMap = new HashMap<>();
        paramMap.put("kindid", kindid);
        paramMap.put("limit", limit);
        return getSqlSession().selectList(CLASS_NAME + ".findByKindid", paramMap);
    }

    @Override
    public int deleteByPrimaryKey(Integer productid) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int insert(Product record) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public ProductWrapper selectByPrimaryKey(Integer productid) {
        return getSqlSession().selectOne(CLASS_NAME + ".selectByPrimaryKey", productid);
    }

    @Override
    public int updateByPrimaryKey(Product record) {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public List<Product> selectByCategoryid(Integer categoryid) {
        return getSqlSession().selectList(CLASS_NAME + ".selectByCategoryid", categoryid);
    }

}
