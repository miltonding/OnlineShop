package com.milton.shop.service;

import java.util.List;

import com.milton.shop.model.Product;
import com.milton.shop.model.wrapper.ProductWrapper;

public interface ProductService {

    public List<ProductWrapper> findByKindid(Integer kindid, Integer limit);
}
