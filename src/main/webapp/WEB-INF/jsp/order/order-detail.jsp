<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>订单详细</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-create.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/order/order-detail.js"></script>
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
        <div id="order-create" class="col-lg-8 col-lg-offset-2 order-page">
          <div class="order-wrapper">
            <h4 class="order-title">
              <label>
                <span>订单详细</span>
                <c:choose>
                  <c:when test="${order.isDelete == 1 }">
                    <span style="color: #c9302c;">(已删除)</span>
                  </c:when>
                  <c:when test="${order.isCancel == 1 }">
                    <span style="color: #286090;">(已取消)</span>
                  </c:when>
                  <c:when test="${order.isPay == 1 }">
                    <span style="color: #449d44;">(已支付)</span>
                  </c:when>
                  <c:when test="${order.isPay == 0 }">
                    <span style="color: #f0ad4e;">(待支付)</span>
                    <span style="font-size: 14px;color: #449d44;">&nbsp;&nbsp;
                       <a href="<%=contentPath%>/page/order/orderPay?orderid=${order.orderid}">
                       <span>继续支付</span>
                      </a>
                    </span>
                    
                  </c:when>
                </c:choose>
              </label>
            </h4>

            <div class="order-address container-fluid">
              <div class="address-manage col-lg-12">
                <label class="show-label">订单编号: ${order.displayid }</label>
                <c:if test="${!empty order.transportid}">
                  <label class="show-label">快递单号: ${order.transportid }</label>
                </c:if>
                <label class="show-label">收货人信息</label>
                <div class="address-group">
                  <div class="address-single">
                    <span>${receiveAddress.receiverName }</span>
                    <span>${receiveAddress.districtName }
                          ${receiveAddress.cityName }
                          ${receiveAddress.districtName }
                          ${receiveAddress.detailAddress }
                    </span>
                    <span>
                      ${fn:substring(receiveAddress.phoneNumber, 0, 3) }
                      ****
                      ${fn:substring(receiveAddress.phoneNumber, 7, 13) }
                    </span>
                  </div>
                </div>

                <label class="show-label">账单地址</label>
                <div class="address-group">
                  <div class="address-single">
                    <span>${billAddress.receiverName }</span>
                    <span>${billAddress.districtName }
                          ${billAddress.cityName }
                          ${billAddress.districtName }
                          ${billAddress.detailAddress }
                    </span>
                    <span>
                      ${fn:substring(billAddress.phoneNumber, 0, 3) }
                      ****
                      ${fn:substring(billAddress.phoneNumber, 7, 13) }
                    </span>
                  </div>
                </div>
              </div>

              <div class="payment-way col-lg-12">
                <label class="show-label">支付</label>
                  <span class="margin-left-tp">${order.paymentName }</span>
                  <span class="margin-left-tp">银行卡号: </span>
                  <span>${order.creditcard }</span>
              </div>

              <div class="payment-way col-lg-12">
                <label class="show-label">订单时间</label>
                <c:if test="${!empty order.createTime}">
                  <div class="create-time">
                    <span class="margin-left-tp">创建时间: </span>
                    <span>
                      <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss"
                       value="${order.createTime}" />
                    </span>
                  </div>
                </c:if>
                <c:if test="${!empty order.payTime}">
                  <div class="pay-time">
                    <span class="margin-left-tp">付款时间: </span>
                    <span>
                      <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss"
                      value="${order.payTime}" />
                    </span>
                  </div>
                </c:if>
                <c:if test="${!empty order.updateTime}">
                  <div class="update-time">
                    <span class="margin-left-tp">更新时间: </span>
                    <span>
                      <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss"
                      value="${order.updateTime}" />
                    </span>
                  </div>
                </c:if>
                <c:if test="${!empty order.cancelTime}">
                  <div class="cancel-time">
                    <span class="margin-left-tp">取消时间: </span>
                    <span>
                      <fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss"
                      value="${order.cancelTime}" />
                    </span>
                  </div>
                </c:if>
              </div>


              <div class="pay-goods col-lg-12">
                <label class="show-label">送货清单</label>

                <div class="order-breadcrumb row text-center">
                  <div class="col-lg-6 part-one">
                    <font>商品</font>
                  </div>
                  <div class="col-lg-2 text-center">
                    <font>商品编号</font>
                  </div>
                  <div class="col-lg-2 text-right">
                    <font>价格</font>
                  </div>
                  <div class="col-lg-2">
                    <font>数量</font>
                  </div>
                </div>

                <div class="order-list col-lg-12">
                  <ul>
                    <c:if test="${!empty goodsList}">
                      <c:forEach items="${goodsList }" var="goodsWrapper">
                        <li class="goods-li">
                          <div class="col-lg-6 p-goods">
                            <div class="p-goods">
                              <div class="goods-item">
                                <div class="p-img">
                                  <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                    <img alt="${goodsWrapper.goodsDescribe }" class="display-picture"
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
                          <div class="total-single col-lg-2 text-center">
                            <span>${goodsWrapper.goodsid }</span>
                          </div>
                          <div class="p-receiver col-lg-2 text-right" style="font-weight: 700;">
                            <span>¥</span>
                            <span class="goods-price">${goodsWrapper.listPrice }</span>
                          </div>
                          <div class="p-phone col-lg-2 text-center">
                            <span class="goods-quantity">${goodsWrapper.quantity }</span>
                          </div>
                        </li>
                      </c:forEach>
                    </c:if>

                  </ul>
                </div>

                <div class="order-pay col-lg-12">
                  <div class="col-lg-4 col-lg-offset-8 text-right">
                    <font>应付总额：</font>
                    <strong class="pay-price">¥0.00</strong>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>