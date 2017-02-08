<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 引入自定义标签 -->
<%@taglib uri="/WEB-INF/taglib/mui.tld" prefix="mui"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>微购物</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/dashboard/dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/item-animation/item-animation.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/mui/js/component/carousel/core.js"></script>
  </head>

  <body>
    <div class="wrapper" id="dashboard">
      <div id="navigation">
        <!-- shortcut-->
        <div class="row shortcut">
          <div class="col-lg-2 shortcut-control">
            <h4>后台管理</h4>
          </div>
          <div class="col-lg-8 shortcut-control">
            <div class="col-lg-4 col-xs-4" style="padding: 0">
              <ul class="menu-ul">
                 <c:choose>
                   <c:when test="${empty user}">
                     <li class="user-li">Hi, 欢迎来到威购物!</li>
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
                  <a href="/miltonshop/page/user/logout">登出</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/user/forgetPassword" target="_blank">修改密码</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/user/profile" target="_blank">个人中心</a>
                </li>
                <li class="menu-li">
                  <a href="#">订单管理</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/documents/documentsAndMedia">documents and media</a>
                </li>
                <li class="menu-li">
                  <a href="<%=contentPath%>/page/goods/goodsCreate" target="_blank">商品管理</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
  
      </div>


      <div id="content">
      </div>
    </div>

  </body>
</html>