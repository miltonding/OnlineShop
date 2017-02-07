<%@page import="util.PropertyUtil"%>
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
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/order/order-common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/order/order-create.css"/>
    <!-- Extra JS -->
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
                <li class="menu-li"> <a href="#">请登录</a></li>
                <li class="menu-li"><a href="#">免费注册</a></li>
                <li class="menu-li"><a href="#">个人中心</a></li>
                <li class="menu-li"><a href="#">商品管理</a></li>
                <li class="menu-li"> <a href="#">购物车</a></li>
                <li class="menu-li"><a href="#">我的订单</a></li>
              </ul>
            </div>
          </div>
        </div>

        <div class="row search-wrapper">
          <div class="col-lg-8 col-lg-offset-2 search-container" >

            <div class="search-group">
              <form method="post" action="#">
                <input type="text" class="search-keyword" placeholder="自营服饰3免1"/>
                <button type="button" class="btn btn-primary search-btn">
                  <span class="glyphicon glyphicon-search"></span>
                </button>
              </form>
            </div>

            <div class="cart-group">
              <button class="btn btn-primary btn-full" type="button">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                <font>我的购物车</font>
                <span class="badge">4</span>
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
                <label class="show-label">订单提交成功，请您尽快付款！ 订单号：49684123204</label>
                <div class="col-lg-7 no-padding-left">
                  <form id="pay-order" method="post" class="form-horizontal" action="#">
                    <div class="form-group">
                      <div class="col-lg-12 no-padding-left margin-left-thirty-five">
                        <h3><strong>在线支付</strong></h3>
                      </div>
                    </div>
                    <div class="form-group form-margin">
                      <label class="col-lg-2 control-label font-md">卡号</label>
                      <div class="col-lg-6">
                        <div class="input-group btn-full">
                          <input type="text" class="form-control input-md btn-full" name="cart-number"/>
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-margin">
                      <label class="col-lg-2 control-label font-md">密码</label>
                      <div class="col-lg-6">
                        <div class="input-group btn-full">
                          <input type="password" class="form-control input-md btn-full" name="cart-password"/>
                        </div>
                      </div>
                    </div>
                    <div class="form-group form-margin">
                      <div class="col-lg-offset-2 col-lg-3">
                        <button type="button" class="btn btn-danger input-md btn-full"
                                onclick="javascript: window.top.location = 'order-detail.html';">
                          <font>立即支付</font>
                        </button>
                      </div>
                      <div class="col-lg-3">
                        <button type="button" class="btn btn-warning input-md btn-full"
                                onclick="javascript: window.top.location = 'order-list.html';">
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
    </div>

    <!-- footer-->
    <jsp:include page="../common/footer.jsp"/>
  </body>
</html>