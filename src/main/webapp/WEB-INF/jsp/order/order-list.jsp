<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单列表</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/cart/cart.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-list.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>

      <div id="navigation">
        <!-- shortcut-->
        <div class="row shortcut">
          <div class="col-md-9 col-md-offset-1 shortcut-control">
            <div class="col-md-6 col-md-6">
              <ul class="menu-ul">
                <li class="user-li">Hi, 欢迎来到威购物!</li>
                <li class="user-li"><a href="#">游客登录</a></li>
              </ul>
            </div>

            <div class="col-md-6 col-md-6">
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
          <div class="col-md-8 col-md-offset-2 search-container" >

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

      <div id="cart-content">
        <div id="cart-page" class="col-md-8 col-md-offset-2">
          <div class="cart-wrapper">
            <h4 class="cart-title">
              <a href="#none">订单列表</a>
            </h4>
            <div class="cart-breadcrumb row text-center">
              <div class="col-md-5">
                <font>商品</font>
              </div>
              <div class="col-md-2">
                <font>收货人</font>
              </div>
              <div class="col-md-2">
                <font>总金额</font>
              </div>
              <div class="col-md-1">
               <font>状态</font>
              </div>
              <div class="col-md-1">
               <font>详细</font>
              </div>
              <div class="col-md-1">
               <font>操作</font>
              </div>
            </div>

            <div class="order-list">
              <form action="<%=contentPath%>/page/order/orderCreate" method="post" id="cartForm">
                <ul>
                  <c:choose>
                    <c:when test="${!empty orderList}">
                      <c:forEach var="orderMap" items="${orderList }">
                        <li class="order-single">
                          <div class="row">
                            <div class="col-md-12 order-front">
                              <div class="col-md-3 col-xs-6 text-left">
                                <span><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss"
                                  value="${orderMap.order.createTime}" />
                                </span>
                              </div>
                              <div class="col-md-4 col-xs-6 text-left">
                                <span>订单号 ：
                                  <a href="<%=contentPath%>/page/order/orderDetail?orderid=${orderMap.order.orderid}"
                                    target="_blank">
                                    ${orderMap.order.displayid}
                                  </a>
                                </span>
                              </div>
                              <div class="col-md-3 text-left">
                                <span>快递单号 ：
                                  <a href="#">
                                    ${orderMap.order.transportid}
                                  </a>
                                </span>
                              </div>
                              <c:if test="${orderMap.order.isPay == 0 }">
                                <div class="col-md-2 text-right">
                                  <a href="<%=contentPath%>/page/order/orderPay?orderid=${orderMap.order.orderid}"
                                    target="_blank" style="color: #c81623 !important;">
                                   <span>继续支付</span>
                                  </a>
                                </div>
                              </c:if>
                            </div>
                          </div>
  
                          <div class="row">
                            <div class="order-end">
                              <div class="col-md-5 no-padding">
                                <c:set var="columnHeight" value="80px" />
                                <c:set var="columnCss" value="" />
                                <c:if test="${!empty orderMap.goodsList}">
                                  <c:set var="columnHeight" value="${fn:length(orderMap.goodsList) * 80}px" />
                                  <c:set var="columnCss" value="style='height: ${columnHeight};line-height: ${columnHeight};'" />
                                  <c:forEach var="goodsWrapper" items="${orderMap.goodsList }">
                                    <div class="p-goods">
                                      <div class="p-img">
                                        <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                          <img alt="${goodsWrapper.goodsDescribe }" class="display-picture"
                                          src="<%=PropertyUtil.getStaticUrl()%>${goodsWrapper.srcPath }">
                                        </a>
                                      </div>
                                      <div class="p-name text-left">
                                        <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                          ${goodsWrapper.goodsDescribe }
                                        </a>
                                      </div>
                                      <div class="p-quantity text-center">
                                        <span>￥${goodsWrapper.listPrice }</span><br />
                                        x${goodsWrapper.quantity }
                                        
                                      </div>
                                    </div>
                                  </c:forEach>
                                </c:if>
                              </div>
      
                              <!--  style="height: ; line-heilght" -->
                              <div class="col-md-2 common-column text-center" ${columnCss }>
                                <span>${orderMap.addressWrapper.receiverName}</span>
                              </div>
                              <div class="col-md-2 common-column text-center" ${columnCss }>
                                <span>￥${orderMap.order.totalPrice }</span>
                              </div>
                              <div class="col-md-1 common-column text-center" ${columnCss }>
                                <c:choose>
                                  <c:when test="${orderMap.order.isDelete == 1 }">
                                    <span style="color: #c9302c;">已删除</span>
                                  </c:when>
                                  <c:when test="${orderMap.order.isCancel == 1 }">
                                    <span style="color: #286090;">已取消</span>
                                  </c:when>
                                  <c:when test="${orderMap.order.isPay == 1 }">
                                    <span style="color: #449d44;">已支付</span>
                                  </c:when>
                                  <c:when test="${orderMap.order.isPay == 0 }">
                                    <span style="color: #f0ad4e;">待支付</span>
                                  </c:when>
                                </c:choose>
                              </div>
                              <div class="col-md-1 common-column text-center" ${columnCss }>
                                <a href="<%=contentPath%>/page/order/orderDetail?orderid=${orderMap.order.orderid}"
                                  target="_blank">
                                  <span>订单详细</span>
                                </a>
                              </div>
                              <div class="col-md-1 common-column text-center" ${columnCss }>
                                <a href="javascript:void(0);" class="removeBtn" goodsid="1">删除</a>
                              </div>
                            </div>
                          </div>
                        </li>
                      </c:forEach>
                    </c:when>
                    <c:otherwise>
                      <li class="text-center no-order">
                        <font>暂时没有订单&nbsp;&nbsp;</font>
                        <a href="<%=contentPath %>/page/dashboard/dashboard">去购物</a>
                      </li>
                    </c:otherwise>
                  </c:choose>
                </ul>
              </form>

            </div>
          </div>
        </div>
      </div>

      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>