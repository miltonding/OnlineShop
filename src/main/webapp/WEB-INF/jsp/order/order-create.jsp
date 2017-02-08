<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>确认商品</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-create.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/order/order-create.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="navigation">
        <!-- shortcut-->
        <div class="row shortcut">
          <div class="col-lg-9 col-lg-offset-1 shortcut-control">
            <div class="col-lg-6 col-xs-6">
              <ul class="menu-ul">
                <li class="user-li">Hi, 欢迎来到威购物!</li>
                <li class="user-li"><a href="#">游客登录</a></li>
              </ul>
            </div>

            <div class="col-lg-6 col-xs-6">
              <ul class="menu-ul">
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/user/forgetPassword" target="_blank">修改密码</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/user/register" target="_blank">免费注册</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/user/profile" target="_blank">个人中心</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/cart/cartList" target="_blank">购物车</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/order/orderList" target="_blank">我的订单</a>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="row search-wrapper">
          <div class="col-lg-8 col-lg-offset-2 search-container" >

            <div class="search-group">
              <form method="GET" action="<%=contentPath%>/page/goods/goodsList" id="listForm">
                <input type="hidden" name="goalPage" value="${pagination.goalPage}">
                <input type="hidden" name="order" value="${pagination.order}">
                <input type="text" name="keyword" class="search-keyword" placeholder="自营服饰3免1" value="${outputKeyword}"/>
                <button type="submit" class="btn btn-primary search-btn">
                  <span class="glyphicon glyphicon-search"></span>
                </button>
              </form>
            </div>

            <div class="cart-group">
              <button class="btn btn-primary btn-full" type="button" 
                onclick="location.href = '<%=contentPath%>/page/cart/cartList';">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                <font>我的购物车</font>
                <span class="badge">${cartQuantity }</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div class="order-content">
        <form action="<%=contentPath%>/page/order/orderPay" method="post">
          <div id="order-create" class="col-lg-8 col-lg-offset-2 order-page">
            <div class="order-wrapper">
              <h4 class="order-title">
                <label>填写并核对订单信息</label>
              </h4>
  
              <div class="order-address container-fluid">
                <div class="address-manage col-lg-12">
                  <label class="show-label">收货人信息</label>
                  <div class="address-group">
                    <c:if test="${!empty addressList}">
                      <c:forEach items="${addressList }" var="address">
                        <c:set var="receiveAddCss" value=""/>
                        <c:if test="${address.isDefault == 1 }">
                          <c:set var="defaultReceiveId" value="${address.addressid}"/>
                          <c:set var="receiveAddCss" value="item-selected"/>
                        </c:if>
                        <div class="address-single" id="address-${address.addressid}">
                          <div class="btn btn-default address-btn ${receiveAddCss }">${address.receiverName }</div>
                          <span>${address.receiverName }</span>
                          <span>
                            ${address.provinceName } 
                            ${address.cityName } 
                            ${address.districtName }
                            ${address.detailAddress }
                           </span>
                          <span>
                            ${fn:substring(address.phoneNumber, 0, 3) }
                            ****
                            ${fn:substring(address.phoneNumber, 7, 13) }
                          </span>
                          <c:if test="${address.isDefault == 1 }">
                            <span class="address-default">默认地址</span>
                          </c:if>
                        </div>
                      </c:forEach>
                      <input type="hidden" name="receiveAddrid" value="${defaultReceiveId }">
                    </c:if>
  
                    <div class="address-operate">
                      <a class="glyphicon glyphicon-arrow-up" href="#">收起地址</a>
                    </div>
                  </div>
  
                  <label class="show-label margin-thirty">账单地址</label>
                  <div class="address-group">
                    <c:if test="${!empty addressList}">
                      <c:forEach items="${addressList }" var="address">
                        <c:set var="billAddCss" value=""/>
                        <c:if test="${address.isDefault == 1 }">
                          <c:set var="defaultBillId" value="${address.addressid}"/>
                          <c:set var="billAddCss" value="item-selected"/>
                        </c:if>
                        <div class="address-single" id="address-${address.addressid}">
                          <div class="btn btn-default address-btn ${billAddCss }">${address.receiverName }</div>
                          <span>${address.receiverName }</span>
                          <span>
                            ${address.provinceName } 
                            ${address.cityName } 
                            ${address.districtName }
                            ${address.detailAddress }
                           </span>
                          <span>
                            ${fn:substring(address.phoneNumber, 0, 3) }
                            ****
                            ${fn:substring(address.phoneNumber, 7, 13) }
                          </span>
                          <c:if test="${address.isDefault == 1 }">
                            <span class="address-default">默认地址</span>
                          </c:if>
                        </div>
                      </c:forEach>
                      <input type="hidden" name="billAddrid" value="${defaultBillId }">
                    </c:if>
  
                    <div class="address-operate">
                      <a class="glyphicon glyphicon-arrow-up" href="#">收起地址</a>
                    </div>
                  </div>
                </div>
  
                <div class="payment-way col-lg-12">
                  <label class="show-label">支付方式</label>
                  <ul class="pay-ul">
                    <li class="pay-li item-selected" payid="1">货到付款</li>
                    <li class="pay-li" payid="2">微信支付</li>
                    <li class="pay-li" payid="3">在线支付</li>
                  </ul>
                  <input type="hidden" name="paymentid" value="1">
                </div>
  
                <div class="pay-goods col-lg-12">
                  <label class="show-label">送货清单</label>
                  <div class="order-breadcrumb row text-center">
                    <div class="col-lg-6 part-one">
                      <font>商品</font>
                    </div>
                    <div class="col-lg-2 text-right">
                      <font>价格</font>
                    </div>
                    <div class="col-lg-2">
                      <font>数量</font>
                    </div>
                    <div class="col-lg-2">
                      <font>数量</font>
                    </div>
                  </div>
  
                  <div class="order-list col-lg-12">
                    <ul>
                      <c:if test="${!empty goodsList}">
                        <c:forEach items="${goodsList }" var="goodsWrapper">
                          <li class="goods-li" goodsid="${goodsWrapper.goodsid}" cartid="${goodsWrapper.cartid}">
                            <input type="hidden" name="cartid" value="${goodsWrapper.cartid}">
                            <div class="col-lg-6 p-goods">
                              <div class="p-goods">
                                <div class="goods-item">
                                  <div class="p-img">
                                    <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                      <img alt="${goodsWrapper.goodsDescribe }" class="img-full"
                                      src="<%=PropertyUtil.getStaticUrl()%>${goodsWrapper.srcPath }">
                                    </a>
                                  </div>
                                  <div class="p-name">
                                    <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                      ${goodsWrapper.goodsDescribe }
                                    </a>
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="p-receiver col-lg-2 text-right">
                              <span class="goods-price">¥${goodsWrapper.listPrice }</span>
                            </div>
                            <div class="p-phone col-lg-2 text-center">
                              <span class="goods-quantity">${goodsWrapper.cartQuantity }</span>
                            </div>
                            <div class="total-single col-lg-2 text-center">
                              <c:choose>
                                <c:when test="${goodsWrapper.quantity > 0}">
                                  <strong>有货</strong>
                                </c:when>
                                <c:otherwise>
                                  <strong class="no-goods">无货</strong>
                                </c:otherwise>
                              </c:choose>
                            </div>
                          </li>
                        </c:forEach>
                      </c:if>
                    </ul>
                  </div>
  
                  <div class="order-pay col-lg-12">
                    <div class="col-lg-4 col-lg-offset-8 text-right">
                      <font>应付总额:</font>
                      <strong class="pay-price">¥0.00</strong>
                    </div>
                  </div>
  
                  <div class="order-commit col-lg-12 text-right">
                    <button type="submit" class="btn btn-danger font-eighteen">提交订单</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>

      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>