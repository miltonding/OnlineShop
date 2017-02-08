package com.milton.shop.service.impl;

import java.util.List;

import com.milton.shop.dao.ProductMapper;
import com.milton.shop.model.wrapper.ProductWrapper;
import com.milton.shop.service.ProductService;

public class ProductServiceImpl implements ProductService {

    private ProductMapper productDao;

    public List<ProductWrapper> findByKindid(Integer kindid, Integer limit) {
        return productDao.findByKindid(kindid, limit);
    }

    public void setProductDao(ProductMapper productDao) {
        this.productDao = productDao;
    }

}
