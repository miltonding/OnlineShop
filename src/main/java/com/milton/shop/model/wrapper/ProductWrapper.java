package com.milton.shop.model.wrapper;

import com.milton.shop.model.Product;

public class ProductWrapper extends Product {

    private Integer kindid;

    // Query conditions
    private Integer limit;

    public Integer getKindid() {
        return kindid;
    }

    public void setKindid(Integer kindid) {
        this.kindid = kindid;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

}
