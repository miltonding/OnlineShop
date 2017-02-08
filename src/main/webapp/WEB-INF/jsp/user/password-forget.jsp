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
    <title>修改密码</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/user/register.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/user/password-forget.js"></script>
  </head>

  <body>
    <div class="wrapper">
    <jsp:include page="../common/header.jsp"/>
    <div id="content">
      <form id="update-password-form" method="post" 
        class="form-horizontal"
         action="<%=contentPath %>/page/user/forgetPassword">
        <div class="form-group">
          <div class="col-lg-5 col-lg-offset-3">
            <h4 class="text-center">修 改 密 码</h4>
          </div>
        </div>

        <c:if test="${empty user }">
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">用 户 名</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="username" />
            </div>
          </div>
  
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="phone"/>
              <c:if test="${!empty errorMessage }">
                <h5 class="help-block" style="display: block;color: #a94442;">${errorMessage }</h5>
              </c:if>
            </div>
          </div>
        </c:if>

        <div class="form-group form-margin">
          <label class="col-lg-3 control-label font-md">新 密 码</label>
          <div class="col-lg-5">
            <input type="password" class="form-control input-lg" name="password"/>
          </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">确 认 密 码 </label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="repeatPassword"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full">修改密码 </button>
            </div>
          </div>
        </form>
      </div>

      <!-- footer-->
      <div id="footer">
        <div id="declare">
          Copyright @ 2017 Milton Ding All Rights Reserved.
        </div>
      </div>
    </div>
  </body>
</html>