<%@page import="com.milton.shop.constants.Constants"%>
<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <body>
    <div id="header">
      <!-- First block -->
      <div class="row header-container">
        <div class="col-lg-2 col-xs-6 nav" onclick="javascript:location.href = '<%=contentPath%>/page/dashboard/dashboard';">
          <div class="col-lg-2 col-xs-2 home-page">
              <span class="glyphicon glyphicon-home home-page"></span>
          </div>

          <div class="col-lg-10 col-xs-10 logo">
            <img src="<%=PropertyUtil.getStaticUrl()%>/images/logo.png" class="display-picture">
          </div>
        </div>

        <div class="col-lg-8 col-xs-6 advertisement"></div>
        <div class="col-lg-2 col-xs-6 back" >
          <div class="col-lg-4 col-xs-4 avatar">
            <a href="<%=contentPath%>/page/user/profile" target="_blank">
              <c:choose>
                <c:when test="${empty user.srcPath}">
                  <img class="display-picture" src="<%=PropertyUtil.getStaticUrl()%>/images/head_100x100.png" alt="display picuture" />
                </c:when>
                <c:otherwise>
                  <img class="display-picture" src="${user.srcPath}" alt="display picuture" />
                </c:otherwise>
              </c:choose>
            </a>
          </div>
          <div class="col-lg-8 col-xs-8 user-block">
            <c:choose>
              <c:when test="${empty user}">
                <div class="greetings">Hi, 欢迎来到威购物!</div>
                <div class="command text-center">
                  <a href="<%=contentPath%>/page/user/login">登录</a>
                  &nbsp;&nbsp;&nbsp;
                  <a href="<%=contentPath%>/page/user/forgetPassword">忘记密码</a>
                  &nbsp;&nbsp;&nbsp;
                  <a href="<%=contentPath%>/page/user/register" target="_blank">注册</a>
                </div>
              </c:when>
              <c:otherwise>
                <div class="greetings">Hi, ${user.screenName }!</div>
                <div class="command text-center">
                  <a href="<%=contentPath%>/page/user/register" target="_blank">注册</a>
                  &nbsp;&nbsp;&nbsp;
                  <a href="<%=contentPath%>/page/user/forgetPassword">忘记密码</a>
                  &nbsp;&nbsp;&nbsp;
                  <a href="<%=contentPath%>/page/user/logout">登出</a>
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>