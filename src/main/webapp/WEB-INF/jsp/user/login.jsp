<%@page import="com.milton.shop.util.CookieUtil"%>
<%@page import="com.milton.shop.util.Validator"%>
<%@page import="com.milton.shop.constants.Constants"%>
<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/user/login.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/user/login.js"></script>
  </head>

  <body>
    <%
      String username = Constants.BLANK;
      String password = Constants.BLANK;
      String checked = Constants.BLANK;
      String initClass = "hidden";
      Cookie[] cookies = request.getCookies();
      if (!Validator.isNullEmptyArray(cookies)) {
          for (Cookie cookie: cookies) {
              if (Constants.USER_NAME.equals(cookie.getName())) {
                  username = CookieUtil.decodeCookie(cookie.getValue());
                  checked = "checked";
              } else if (Constants.PASSWORD.equals(cookie.getName())) {
                  password = CookieUtil.decodeCookie(cookie.getValue());
              }
          }
          pageContext.setAttribute(Constants.USER_NAME, username);
          pageContext.setAttribute(Constants.PASSWORD, password);
          pageContext.setAttribute(Constants.CHECKED, checked);

          String errorMessage = (String) request.getAttribute(Constants.ERROR_MESSAGE);
          if (!Validator.isNullEmptyString(errorMessage)) {
              initClass = Constants.BLANK;
          }
      }
    %>
    <div class="wrapper">
    <c:if test="${!empty fixedMessage}">
      <script>
      mui.fixedMessageOk('<%=session.getAttribute("fixedMessage")%>', 2000);
      </script>
      <%session.removeAttribute("fixedMessage");%>
    </c:if>
      <!-- header -->
     <jsp:include page="../common/header.jsp"/>

      <!-- content -->
      <div id="content">
        <div class="login_back">
          <a class="shop_link" href="#">
          </a>
          <div class="login_block">
            <c:if test="${!empty user}">
              <div class="logined_display text-center">
                Hi, <font>${user.username }!&nbsp;&nbsp;</font>
              <a href="<%=contentPath%>/page/user/logout">退出</a>
            </div>
            </c:if>
            <div class="login_label">用户登录</div>
            <!-- login form start-->
            <div class="login_form">
              <div class="error_message <%=initClass%>">${errorMessage }</div>
              <form role="form" action="<%=contentPath%>/page/user/login" method="POST" id="loginForm">
                <div class="form-group email_field">
                   <div class="input-group">
                     <span class="input-group-addon">
                       <span class="glyphicon glyphicon-user"></span>
                     </span>
                     <input type="text" class="form-control" name="userName" id="userName"
                     placeholder="Username" value="${userName }"/>
                   </div>
                 </div>
                 <div class="form-group common_field">
                   <div class="input-group">
                     <span class="input-group-addon">
                       <span class="glyphicon glyphicon-lock"></span>
                     </span>
                     <input type="password" class="form-control" name="password" id="password"
                     value="${password }" placeholder="Password"/>
                   </div>
                 </div>
                 <div class="checkbox common_field">
                   <label>
                     <input type="checkbox" name="rememberPassword" id="rememberPassword" ${checked }/>
                     <font>记住密码</font>
                   </label>
                   <a class="forget_password" href="<%=contentPath%>/page/user/forgetPassword">忘记密码 </a>
                 </div>
                 <div class="form-group btn_field">
                   <button type="button" id="loginBtn" class="btn btn-primary login_btn">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
                 </div>
                 <div class="form-group common_field" style="position: relative">
                   <a href="register.html" target="_blank" class="register_a">
                   <label class="register_here"></label> 立即注册 </a>
                 </div>
               </form>
               <!-- login form end-->
            </div>
          </div>
        </div>
        <!-- footer-->
        <div id="footer">
          <div id="declare">
            Copyright @ 2017 Milton Ding All Rights Reserved.
          </div>
        </div>
      </div>
    </div>
  </body>
</html>