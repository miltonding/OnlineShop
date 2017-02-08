package com.milton.shop.dao;

import com.milton.shop.model.Product;
import com.milton.shop.model.wrapper.ProductWrapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ProductMapper {
    int deleteByPrimaryKey(Integer productid);

    int insert(Product record);

    public ProductWrapper selectByPrimaryKey(Integer productid);

    public List<ProductWrapper> findByKindid(Integer kindid, Integer limit);
    
    public List<Product> selectByCategoryid(Integer categoryid);

    int updateByPrimaryKey(Product record);
}