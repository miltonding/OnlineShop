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
    <title>笔记本-商品搜索-微购物</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/goods/goods-detail.css"/>
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

          <div class="introduce-wrapper">
            <div  class="col-lg-12 introduce-group">
              <div class="col-lg-10 col-lg-offset-1 nav-items">
                <ul>
                  <li class="items-li"><a href="#">手机</a></li>
                  <li class="items-li"><a href="#">平板</a></li>
                  <li class="items-li"> <a href="#">笔记本</a></li>
                  <li class="items-li"><a href="#">台式机</a></li>
                  <li class="items-li"><a href="#">商务本</a></li>
                  <li class="items-li"><a href="#">个人电脑</a></li>
                  <li class="items-li"> <a href="#">电子手表</a></li>
                  <li class="items-li"><a href="#">音响</a></li>
                  <li class="items-li"><a href="#">电视</a></li>
                  <li class="items-li"><a href="#">显示屏</a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div id="goods-detail">
          <!--item-wrapper start -->
          <div class="col-lg-10 col-lg-offset-1 breadcrumb no-padding-left">
            <a href="#" class="breadcrumb-keyword"><b>数码</b></a>
            &nbsp;&gt;&nbsp;
            <a href="#">电脑整机</a>
            &nbsp;&gt;&nbsp;
            <a href="#">笔记本</a>
            &nbsp;&gt;&nbsp;
            AppleMacBook Air
          </div>
          <div class="col-lg-10 col-lg-offset-1 goods-wrapper">
            <div class="col-lg-3 col-xs-6 goods-picture">
              <img src="<%=PropertyUtil.staticUrl%>/images/goods/goods-one.jpg" class="display-picture">
            </div>

            <div class="col-lg-6 col-xs-6 goods-name">
              <h1 class="describe">Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/8GB内存/128GB SSD闪存 MMGF2CH/A)</h1>
              <div class="advantage">
              <font>【成交价6388元】春节不打烊！白条分期3期免息！先到先得！神券满6000减600元！超强的续航能力，纤薄、轻巧、耐用！领券链接</font>
              </div>
              <div class="price">
                <font>威 购 物 价</font>
                <strong>￥9999.0</strong>
              </div>
              <div class="btn-group row">
                <div class="quantity-group col-lg-2 col-xs-4 no-padding-right">
                  <input type="text" class="input-sm quantity-input" value="123"/>
                  <div class="quantity-control">
                    <button type="button" class="btn btn-default control-btn">+</button>
                    <button type="button" class="btn btn-default control-btn">-</button>
                  </div>
                </div>
              </div>
              <div class="add-or-buy">
                <div class="col-lg-2 col-xs-4 no-padding">
                  <a class="btn btn-danger">
                    <span class="glyphicon glyphicon-shopping-cart"></span>
                    <font>加入购物车</font>
                  </a>
                </div>
                <div class="col-lg-2 col-xs-4 no-padding-right">
                  <a class="btn btn-warning margin-twenty">
                    <span class="glyphicon glyphicon-usd"></span>
                    <font>立即购买</font>
                  </a>
                </div>
              </div>
            </div>

            <!--&lt;!&ndash; 猜你喜欢&ndash;&gt;
            <div class="col-lg-3" style="height: 100%;border: 1px solid;">
              <font>猜你喜欢</font>
            </div>-->
        </div>
      </div>
      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>