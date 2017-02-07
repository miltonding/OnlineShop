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
    <title>登录</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/user/login.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper">
      <!-- header -->
     <jsp:include page="../common/header.jsp"/>

      <!-- content -->
      <div id="content">
        <div class="login_back">
          <a class="shop_link" href="#">
          </a>
          <div class="login_block">
            <div class="login_label">用户登录</div>
            <!-- login form start-->
            <div class="login_form">
              <div class="error_message">error message here...</div>
              <form role="form">
                <div class="form-group email_field">
                   <div class="input-group">
                     <span class="input-group-addon">
                       <span class="glyphicon glyphicon-user"></span>
                     </span>
                     <input type="text" class="form-control" placeholder="Username">
                   </div>
                 </div>
                 <div class="form-group common_field">
                   <div class="input-group">
                     <span class="input-group-addon">
                       <span class="glyphicon glyphicon-lock"></span>
                     </span>
                     <input type="text" class="form-control" placeholder="Password">
                   </div>
                 </div>
                 <div class="checkbox common_field">
                   <label>
                     <input type="checkbox">记住密码
                   </label>
                   <a class="forget_password" href="./password-update.html" target="_blank">忘记密码 </a>
                 </div>
                 <div class="form-group btn_field">
                   <button type="submit" class="btn btn-primary login_btn">登&nbsp;&nbsp;&nbsp;&nbsp;录</button>
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