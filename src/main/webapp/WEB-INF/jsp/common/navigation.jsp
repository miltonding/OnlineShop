<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <body>
    <div id="navigation">
      <!-- shortcut-->
      <div class="row shortcut">
        <div class="col-lg-8 col-lg-offset-2 shortcut-control">
          <div class="col-lg-4 col-xs-4" style="padding: 0">
            <ul class="menu-ul">
               <li class="user-li">Hi, 欢迎来到威购物!</li>
               <c:choose>
                 <c:when test="${empty user}">
                   <li class="user-li"><a>游客登录</a></li>
                 </c:when>
                 <c:otherwise>
                   <li class="user-li"><a>${user.username }[在线]</a></li>
                 </c:otherwise>
               </c:choose>
            </ul>
          </div>

          <div class="col-lg-8 col-xs-8">
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
            <a class="btn btn-primary btn-full cart-link" href="<%=contentPath %>/page/cart/cartList" target="_blank"
               onclick="location.href = '<%=contentPath%>/page/cart/cartList';">
              <span class="glyphicon glyphicon-shopping-cart"></span>
              <font>我的购物车</font>
              <span class="badge">${cartQuantity }</span>
            </a>
          </div>
        </div>

        <div class="introduce-wrapper">
          <div  class="col-lg-8 col-lg-offset-2 introduce-group">
            <div class="col-lg-10 col-lg-offset-1 nav-items">
              <ul>
                <c:if test="${!empty productList}">
                  <c:forEach items="${productList }" var="product">
                    <li class="items-li">
                      <a href="<%=contentPath%>/page/goods/goodsList?productid=${product.productid}">
                        ${product.productName }
                      </a>
                    </li>
                  </c:forEach>
                </c:if>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>