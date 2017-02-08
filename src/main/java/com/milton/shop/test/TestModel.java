package com.milton.shop.test;

import com.milton.shop.model.wrapper.ProductWrapper;

public class TestModel {

    public static void main(String[] args) {
        ProductWrapper ProductWrapper = new ProductWrapper();
        ProductWrapper.setProductid(1);
        System.out.println(ProductWrapper.getProductid());
    }
}
