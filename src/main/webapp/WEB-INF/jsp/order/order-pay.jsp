<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
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
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/order/order-create.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/order/order-pay.js"></script>
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
              <label> 收银台</label>
            </h4>

            <div class="order-address container-fluid">
              <div class="address-manage col-lg-12">
                <label class="show-label">订单提交成功，请您尽快付款！ 订单号：${order.displayid }</label>
                <div class="col-lg-7 no-padding-left">
                  <form id="pay-order" method="post" class="form-horizontal" action="<%=contentPath %>/page/order/orderBuy">
                    <input type="hidden" name="orderid" value="${order.orderid }"/>
                    <div class="form-group">
                      <div class="col-lg-12 no-padding-left margin-left-thirty-five">
                        <h3><strong>${order.paymentName }</strong></h3>
                      </div>
                    </div>
                    <div class="form-group form-margin">
                      <label class="col-lg-2 control-label font-md">卡号</label>
                      <div class="col-lg-6">
                        <div class="input-group btn-full">
                          <input type="text" class="form-control input-md btn-full" name="creditcard"/>
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-margin">
                      <label class="col-lg-2 control-label font-md">密码</label>
                      <div class="col-lg-6">
                        <div class="input-group btn-full">
                          <input type="password" class="form-control input-md btn-full" name="cardPassword"/>
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-margin">
                      <div class="col-lg-offset-2 col-lg-3">
                        <button type="submit" class="btn btn-danger input-md btn-full">
                          <font>立即支付</font>
                        </button>
                      </div>
                      <div class="col-lg-3">
                        <button type="button" class="btn btn-warning input-md btn-full" id="cancelBtn">
                          <font>取消支付</font>
                        </button>
                      </div>
                    </div>
                  </form>
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