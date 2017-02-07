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
    <title>修改密码</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/user/register.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper">
    <jsp:include page="../common/header.jsp"/>
    <div id="content">
      <form id="update-password-form" method="post" class="form-horizontal" action="#">
        <div class="form-group">
          <div class="col-lg-5 col-lg-offset-3">
            <h4 class="text-center">修 改 密 码</h4>
          </div>
        </div>

        <div class="form-group form-margin">
          <label class="col-lg-3 control-label font-md">手 机 号 码</label>
          <div class="col-lg-5">
            <input type="text" class="form-control input-lg" name="phone_number" />
          </div>
        </div>

        <div class="form-group form-margin">
          <label class="col-lg-3 control-label font-md">新 密 码</label>
          <div class="col-lg-5">
            <input type="password" class="form-control input-lg" name="password" />
          </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">确 认 密 码 </label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="password" />
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="button" class="btn btn-danger input-lg btn-full">修改密码 </button>
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