package com.milton.shop.model.util;

public class CartGoods {

    private Integer goodsid;
    private Integer quantity;

    public CartGoods() {
        super();
    }

    public CartGoods(Integer goodsid, Integer quantity) {
        super();
        this.goodsid = goodsid;
        this.quantity = quantity;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    @Override
    public int hashCode() {
        return this.goodsid;
    }

    @Override
    public boolean equals(Object obj) {
        CartGoods goods = (CartGoods) obj;
        if (this.goodsid == goods.getGoodsid()) {
            return true;
        }
        return false;
    }

}
