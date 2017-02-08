package com.milton.shop.model;

import java.util.Date;

public class Order {
    private Integer orderid;

    private Integer paymentid;

    private Integer cardTypeId;

    private String creditcard;

    private Integer userid;

    private Integer receiveAddrid;

    private Integer billAddrid;

    private Double transportPrice;

    private Double totalPrice;

    private Integer transportid;

    private Integer isPay;

    private Integer isCancel;

    private Integer isDelete;

    private Date createTime;

    private Date payTime;

    private Date updateTime;

    private Date cancelTime;

    private Date deleteTime;

    private String displayid;
    // Extra
    private String paymentName;

    public Order() {
        super();
        // TODO Auto-generated constructor stub
    }

    public Order(Integer paymentid, Integer cardTypeId, String creditcard, Integer userid,
            Integer receiveAddrid, Integer billAddrid, Double transportPrice, Double totalPrice, Integer transportid,
            Integer isPay, Integer isCancel, Integer isDelete) {
        super();
        this.paymentid = paymentid;
        this.cardTypeId = cardTypeId;
        this.creditcard = creditcard;
        this.userid = userid;
        this.receiveAddrid = receiveAddrid;
        this.billAddrid = billAddrid;
        this.transportPrice = transportPrice;
        this.totalPrice = totalPrice;
        this.transportid = transportid;
        this.isPay = isPay;
        this.isCancel = isCancel;
        this.isDelete = isDelete;
    }


    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getPaymentid() {
        return paymentid;
    }

    public void setPaymentid(Integer paymentid) {
        this.paymentid = paymentid;
    }

    public Integer getCardTypeId() {
        return cardTypeId;
    }

    public void setCardTypeId(Integer cardTypeId) {
        this.cardTypeId = cardTypeId;
    }

    public String getCreditcard() {
        return creditcard;
    }

    public void setCreditcard(String creditcard) {
        this.creditcard = creditcard;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getReceiveAddrid() {
        return receiveAddrid;
    }

    public void setReceiveAddrid(Integer receiveAddrid) {
        this.receiveAddrid = receiveAddrid;
    }

    public Integer getBillAddrid() {
        return billAddrid;
    }

    public void setBillAddrid(Integer billAddrid) {
        this.billAddrid = billAddrid;
    }

    public Double getTransportPrice() {
        return transportPrice;
    }

    public void setTransportPrice(Double transportPrice) {
        this.transportPrice = transportPrice;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getTransportid() {
        return transportid;
    }

    public void setTransportid(Integer transportid) {
        this.transportid = transportid;
    }

    public Integer getIsPay() {
        return isPay;
    }

    public void setIsPay(Integer isPay) {
        this.isPay = isPay;
    }

    public Integer getIsCancel() {
        return isCancel;
    }

    public void setIsCancel(Integer isCancel) {
        this.isCancel = isCancel;
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(Date cancelTime) {
        this.cancelTime = cancelTime;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    public String getPaymentName() {
        return paymentName;
    }

    public void setPaymentName(String paymentName) {
        this.paymentName = paymentName;
    }

    public String getDisplayid() {
        return displayid;
    }

    public void setDisplayid(String displayid) {
        this.displayid = displayid;
    }
}