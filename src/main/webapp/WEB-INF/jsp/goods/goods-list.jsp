<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.milton.shop.model.Pagination"%>
<%@page import="com.milton.shop.constants.Constants"%>
<%@page import="com.milton.shop.util.PropertyUtil"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/goods/goods-list.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/goods/goods-list.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/cart/cart-option.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/common/message.js"></script>
  </head>

  <body>
    <div class="wrapper" id="dashboard">
      <!-- flash message -->
      <div class="fixed-message-ok text-center hidden">
        <span class="glyphicon glyphicon-ok"></span>
      </div>
      <div class="fixed-message-error text-center hidden">
        <span class="glyphicon glyphicon-remove"></span>
      </div>
      <div class="fixed-message-error text-center hidden">
        <span class="glyphicon glyphicon-remove">请输入正确数字!</span>
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
                <input type="hidden" name="kindid" value="${pagination.kindid}">
                <input type="hidden" name="categoryid" value="${pagination.categoryid}">
                <input type="hidden" name="productid" value="${pagination.productid}">
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

      <div id="goods-list">
        <div class="row">
          <!--item-wrapper start -->
          <div class="col-lg-10 col-lg-offset-1 list-wrapper">
            <c:if test="${!empty goodsList}">
              <c:forEach items="${goodsList }" var="goodsWrapper">
                <div class="thumbnail goods-li">
                  <div class="goods-model">
                    <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank" title="${goodsWrapper.goodsAdvantage }">
                      <img class="goods-img" alt="220x220" src="<%=PropertyUtil.getStaticUrl()%>${goodsWrapper.srcPath }">
                    </a>
                    <div class="caption">
                      <div class="goods-price">
                        <strong><em>￥</em>${goodsWrapper.listPrice }</strong>
                      </div>
                      <div class="goods-describe">
                        <a href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}" target="_blank" title="${goodsWrapper.goodsAdvantage }">
                          <c:choose> 
                            <c:when test="${fn:length(goodsWrapper.goodsDescribe) > 80}"> 
                              <c:out value="${fn:substring(goodsWrapper.goodsDescribe, 0, 80)}......" /> 
                            </c:when> 
                            <c:otherwise> 
                              <c:out value="${goodsWrapper.goodsDescribe}" /> 
                            </c:otherwise>
                           </c:choose>
                        </a>
                      </div>
                      <div class="goods-operation">
                        <c:choose>
                          <c:when test="${goodsWrapper.quantity <= 0}">
                            <a class="btn btn-warning" target="_blank" href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}">到货通知</a>
                          </c:when>
                          <c:otherwise>
                            <a class="btn btn-primary detail-btn" target="_blank" href="<%=contentPath %>/page/goods/goodsDetail?goodsid=${goodsWrapper.goodsid}">查看</a>
                            <a class="btn btn-danger add-btn" href="javascript:void(0);" goodsid="${goodsWrapper.goodsid}">
                              <span class="glyphicon glyphicon-shopping-cart"></span>
                              <font>加入购物车</font>
                            </a>
                          </c:otherwise>
                        </c:choose>
                      </div>
                    </div>
                  </div>
                </div>
              </c:forEach>
            </c:if>
          </div>
          <!--item-wrapper end-->

          <div class="col-lg-8 col-lg-offset-3 page-wrapper">
            <nav class="col-lg-7 col-lg-offset-2 page-block">
              <ul class="pagination page-ul">
                <c:choose>
                  <c:when test="${pagination.goalPage == 1 }">
                    <li><a>上一页</a></li>
                  </c:when>
                  <c:otherwise>
                    <li id="previousPage"><a href="javascript:void(0);">上一页</a></li>
                  </c:otherwise>
                </c:choose>
                <%
                  Pagination pagination = (Pagination) request.getAttribute(Constants.PAGINATION);
                  int currentPage = pagination.getGoalPage();
                  int pageCount = pagination.getPageCount();
                %>
                <c:choose>
                  <c:when test="${pagination.pageCount - pagination.goalPage >= 4}">
                    <%
                    int start = 0;
                    int end = 0;
                    if (currentPage <= 1) {
                        start = 1;
                        end = currentPage + 5;
                    } else {
                        start = currentPage - 1;
                        end = currentPage + 4;
                    }
                    for (int i = start; i < end; i++) {
                        if (i == currentPage) {
                    %>
                            <li><a class="current-page">${pagination.goalPage }</a></li>
                    <%
                        } else {
                    %>
                            <li><a href="javascript:void(0);" class="common-page"><%=i %></a></li>
                    <%
                        }
                    }
                    %>
                    <li><a class="less-single">...</a></li>
                  </c:when>
                  <c:otherwise>
                    <%
                    int start = 0;
                    if (currentPage <= 1) {
                        start = 1;
                    } else {
                        start = currentPage - 1;
                    }
                    for (int i = start; i <= pageCount; i++) {
                        if (i == currentPage) {
                    %>
                            <li><a class="current-page">${pagination.goalPage }</a></li>
                    <%
                        } else if (i > 0 && i != currentPage) {
                    %>
                            <li><a href="javascript:void(0);" class="common-page"><%=i %></a></li>
                    <%
                        }
                    } 
                    %>
                  </c:otherwise>
                </c:choose>
                <c:choose>
                  <c:when test="${pagination.goalPage == pagination.pageCount }">
                    <li><a>下一页</a></li>
                  </c:when>
                  <c:otherwise>
                    <li id="nextPage"><a href="javascript:void(0);">下一页</a></li>
                  </c:otherwise>
                </c:choose>
              </ul>
            </nav>

            <nav class="col-lg-3 redirect-wrapper">
              <em>共<b>${pagination.pageCount }</b>页&nbsp;&nbsp;到第</em>
              <input class="input-sm goal-page" type="text" value="${pagination.goalPage}" id="goalInput"/>
              <em>页</em>
              <a class="btn btn-default"  href="javascript:void(0);" id="confirmBtn">确定</a>
            </nav>
          </div>
        </div>
      </div>
      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>