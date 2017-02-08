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
    <title>购物车</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/cart/cart.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/cart/cart-option.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/cart/cart-list.js"></script>
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
              <button class="btn btn-primary btn-full" type="button">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                <font>我的购物车</font>
                <span class="badge">${cartQuantity }</span>
              </button>
            </div>
          </div>
        </div>
      </div>

      <div id="cart-content">
        <div id="cart-page" class="col-lg-8 col-lg-offset-2">
          <div class="cart-wrapper">
            <h4 class="cart-title">
              <a href="#none">全部商品</a>
            </h4>
            <div class="cart-breadcrumb row text-center">
              <div class="col-lg-6 part-one">
                <input type="checkbox" id="selectAll"/>
                <font>全选</font>
                <font>商品</font>
              </div>
              <div class="col-lg-1 text-right">
                <font>单价</font>
              </div>
              <div class="col-lg-2">
                <font>数量</font>
              </div>
              <div class="col-lg-2 text-right">
                <font>小计</font>
              </div>
              <div class="col-lg-1 text-right">
               <font> 操作</font>
              </div>
            </div>

            <div class="cart-list">
              <form action="<%=contentPath%>/page/order/orderCreate" method="post" id="cartForm">
                <ul>
                  <c:set var="noGoodsCss" value=""/>
                  <c:set var="totalCss" value="hidden"/>
                  <c:if test="${!empty goodsList }">
                    <c:set var="noGoodsCss" value="hidden"/>
                    <c:set var="totalCss" value=""/>
                    <c:forEach items="${goodsList }" var="goodsWrapper">

                      <c:choose>
                        <c:when test="${goodsWrapper.quantity <= 0}">
                          <li class="disable-goods-li" goodsid="${goodsWrapper.goodsid }">
                            <div class="col-lg-6 p-goods">
                              <div class="cart-checkbox">
                              </div>
                              <div class="p-goods">
                                <div class="goods-item">
                                  <div class="p-img">
                                    <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                      <img alt="${goodsWrapper.goodsDescribe }" src="<%=PropertyUtil.getStaticUrl()%>${goodsWrapper.srcPath }"
                                      class="display-picture" >
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
    
                            <div class="p-price col-lg-1 text-right">
                              <span class="price-show">¥${goodsWrapper.listPrice }</span>
                                <div class="quantity-warning">${quantityWarning }</div>
                            </div>
    
                            <div class="quantity-control col-lg-2 text-center">
                              <div class="quantity-warning text-center">无库存</div>
                            </div>
                            <div class="total-single col-lg-2 text-right">
                            </div>
                            <div class="goods-operate col-lg-1 text-right">
                              <a href="javascript:void(0);" class="removeBtn" goodsid="${goodsWrapper.goodsid }">删除</a>
                            </div>
                          </li>
                        </c:when>
                        <c:otherwise>
                          <c:set var="quantityWarning" value=""/>
                          <c:set var="goodsLiCss" value="goods-li"/>
                          <c:set var="notDisable" value=""/>
                          <c:choose>
                            <c:when test="${goodsWrapper.cartQuantity > goodsWrapper.quantity}">
                              <c:set var="quantityWarning" value="仅剩${goodsWrapper.quantity }件"/>
                              <c:set var="goodsLiCss" value="disable-goods-li"/>
                              <c:set var="notDisable" value="disable"/>
                            </c:when>
                            <c:when test="${goodsWrapper.quantity <= 100 }">
                              <c:set var="quantityWarning" value="仅剩${goodsWrapper.quantity }件"/>
                            </c:when>
                          </c:choose>
                          <li class="${goodsLiCss }" goodsid="${goodsWrapper.goodsid }">
                            <div class="col-lg-6 p-goods">
                              <div class="cart-checkbox">
                                <c:if test="${empty notDisable}">
                                  <input type="checkbox" name="cartid" value="${goodsWrapper.cartid }"/>
                                </c:if>
                              </div>
                              <div class="p-goods">
                                <div class="goods-item">
                                  <div class="p-img">
                                    <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank">
                                      <img alt="${goodsWrapper.goodsDescribe }" src="<%=PropertyUtil.getStaticUrl()%>/${goodsWrapper.srcPath }"
                                      class="display-picture">
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
    
                            <div class="p-price col-lg-1 text-right">
                              <span class="price-show">¥${goodsWrapper.listPrice }</span>
                              <c:if test="${!empty quantityWarning}">
                                <div class="quantity-warning">${quantityWarning }</div>
                              </c:if>
                            </div>
    
                            <div class="quantity-control col-lg-2 text-center">
                                <a href="javascript:void(0);" class="reduceBtn">-</a>
                                <input type="text" class="quantity-input" value="${goodsWrapper.cartQuantity }">
                                <a href="javascript:void(0);" class="addBtn">+</a>
                            </div>
                              
                            <div class="total-single col-lg-2 text-right">
                              <strong>¥</strong>
                              <strong class="p-total">${goodsWrapper.listPrice * goodsWrapper.cartQuantity }</strong>
                            </div>
                            <div class="goods-operate col-lg-1 text-right">
                              <a href="javascript:void(0);" class="removeBtn" goodsid="${goodsWrapper.goodsid }">删除</a>
                            </div>
                          </li>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </c:if>
  
                  <li class="total-li ${totalCss }">
                    <div class="total-price col-lg-4 col-lg-offset-7 text-right">
                      <font>总价：</font>
                      <strong class="total-number">¥0.0</strong>
                    </div>
                    <div class="buy-total col-lg-1 text-right">
                      <a href="javascript:void(0);" class="btn btn-danger" id="buyBtn">去结算</a>
                    </div>
                  </li>
                  <li class="text-center ${noGoodsCss } no-goods">
                    <font>购物车内暂时没有商品&nbsp;&nbsp;</font>
                    <a href="<%=contentPath %>/page/dashboard/dashboard">去购物</a>
                  </li>
                </ul>
                </form>
              <!-- change page-->
              <!-- <div class="page-wrapper col-lg-12">
                <nav class="col-lg-7 col-lg-offset-1 page-block">
                  <ul class="pagination page-ul">
                    <li><a href="#">上一页</a></li>
                    <li><a class="current-page">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a class="less-single">...</a></li>
                    <li><a href="#">下一页</a></li>
                  </ul>
                </nav>

                <nav class="col-lg-4 redirect-wrapper text-right">
                  <em>共<b>100</b>页&nbsp;&nbsp;到第</em>
                  <input class="input-sm goal-page" type="text" value="1">
                  <em>页</em>
                  <a class="btn btn-default" onclick="SEARCH.page_jump(100,1)" href="javascript:;">确定</a>
                </nav>
              </div> -->
            </div>
          </div>
        </div>
      </div>

      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>