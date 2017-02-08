<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>笔记本-商品搜索-微购物</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/goods/goods-detail.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/goods/goods-detail.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/cart/cart-option.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/common/message.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <!-- flash message -->
      <div class="fixed-message-ok text-center hidden">
        <span class="glyphicon glyphicon-ok"></span>
      </div>
      <div class="fixed-message-error text-center hidden">
        <span class="glyphicon glyphicon-remove"></span>
      </div>
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

      <div id="goods-detail" goodsid="${goodsWrapper.goodsid }">
          <!--item-wrapper start -->
          <div class="col-lg-10 col-lg-offset-1 breadcrumb no-padding-left">
            <a href="<%=contentPath%>/page/goods/goodsList?kindid=${goodsWrapper.kindid}"
              class="breadcrumb-keyword"><b>${goodsWrapper.kindName }</b>
            </a>
            &nbsp;&gt;&nbsp;
            <a href="<%=contentPath%>/page/goods/goodsList?categoryid=${goodsWrapper.categoryid}">
              ${goodsWrapper.categoryName }
            </a>
            &nbsp;&gt;&nbsp;
            <a href="<%=contentPath%>/page/goods/goodsList?productid=${goodsWrapper.productid}">
              ${goodsWrapper.productName }
            </a>
            &nbsp;&gt;&nbsp;
            ${goodsWrapper.englishName }
          </div>
          <div class="col-lg-10 col-lg-offset-1 goods-wrapper">
            <div class="col-lg-3 col-xs-6 goods-picture">
              <img src="<%=PropertyUtil.getStaticUrl()%>${goodsWrapper.srcPath }" class="display-picture">
            </div>

            <div class="col-lg-6 col-xs-6 goods-name">
              <h1 class="describe">${goodsWrapper.goodsDescribe }</h1>
              <div class="advantage">
              <font>${goodsWrapper.goodsAdvantage }</font>
              </div>
              <div class="price">
                <font>威 购 物 价</font>
                <strong>￥${goodsWrapper.listPrice }</strong>
              </div>
              <div class="btn-group row">
                <div class="quantity-group col-lg-2 col-xs-4 no-padding-right">
                  <input type="text" class="input-sm quantity-input" value="1"/>
                  <div class="quantity-control">
                    <button type="button" class="btn btn-default control-btn" id="addBtn">+</button>
                    <button type="button" class="btn btn-default control-btn" id="deleteBtn">-</button>
                  </div>
                </div>
              </div>
              <div class="add-or-buy">
                <c:choose>
                  <c:when test="${goodsWrapper.quantity <= 0}">
                    <div class="col-lg-2 col-xs-4 no-padding">
                      <a class="btn btn-warning" id="wait-btn" style="width: 100%;" disabled="disabled" >
                        <font>到货通知</font>
                      </a>
                    </div>
                  </c:when>
                  <c:otherwise>
                    <div class="col-lg-2 col-xs-4 no-padding">
                      <a class="btn btn-danger add-cart">
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
                  </c:otherwise>
                </c:choose>
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