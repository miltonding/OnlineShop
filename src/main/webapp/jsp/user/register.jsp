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
    <title>注册</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/user/register.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="content">
        <form id="register-form" method="post" class="form-horizontal" action="#">
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">用 户 名</label>
              <div class="col-lg-5">
                <input type="text" class="form-control input-lg" name="username" />
              </div>
          </div>
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">设 置 密 码</label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="password" />
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">确 认 密 码</label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="password" />
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="password" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">默 认 收 货 地 址</label>
            <div class="col-lg-5">
              <select class="form-control select-province">
                <option value="">省/直辖市</option>
                <option>江苏省</option>
                <option>浙江省</option>
                <option>福建省</option>
                <option>4</option>
                <option>5</option>
              </select>
              <select class="form-control select-city">
                <option value="">市/区</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select>
              <select class="form-control select-district">
                <option value="">县/乡</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
              </select>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">邮 编 编 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="text" />
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">详 细 地 址</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="text" />
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full">立即注册</button>
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