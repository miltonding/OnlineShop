<%@page import="org.apache.catalina.deploy.LoginConfig"%>
<%@page import="util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <body>
    <div id="header">
      <!-- First block -->
      <div class="row header-container">
        <div class="col-lg-2 col-xs-6 nav">
          <div class="col-lg-2 col-xs-2 home-page">
            <a href="<%=contentPath%>/jsp/dashboard/dashboard.jsp';">
              <span class="glyphicon glyphicon-home home-page"></span>
            </a>
          </div>

          <div class="col-lg-10 col-xs-10 logo">
            <img src="<%=PropertyUtil.staticUrl%>/images/logo.png" class="display-picture">
          </div>
        </div>

        <div class="col-lg-8 col-xs-6 advertisement"></div>
        <div class="col-lg-2 col-xs-6 back" >
          <div class="col-lg-4 col-xs-4 avatar">
            <a href="<%=contentPath%>/jsp/user/user-edit.jsp" target="_blank">
              <img class="display-picture" src="<%=PropertyUtil.staticUrl%>/images/head_100x100.png" alt="display picuture" />
            </a>
          </div>
          <div class="col-lg-7 col-lg-offset-1 col-xs-7 col-xs-offset-1 user-block">
            <div class="greetings">Hi, 欢迎来到威购物!</div>
            <div class="command">
              <a href="<%=contentPath%>/jsp/user/login.jsp" target="_blank">登录</a>
              &nbsp;&nbsp;
              <a href="<%=contentPath%>/jsp/user/register.jsp" target="_blank">注册</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>