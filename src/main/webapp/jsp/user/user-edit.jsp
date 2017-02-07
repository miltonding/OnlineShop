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
    <title>修改个人资料</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/user/register.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.staticUrl%>/js/user/user-edit.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="content">
        <div class="row" id="profile_menu">
          <div class="col-lg-5 col-lg-offset-3">
            <ul class="nav nav-tabs nav-justified">
              <li role="presentation" class="active" form="profile-form">
                <a class="selected-item">个人基本资料</a>
              </li>
              <li role="presentation" form="update-password-form">
                <a>修改密码</a>
              </li>
              <li role="presentation" form="address-group-form">
                <a>地址管理</a>
              </li>
            </ul>
          </div>
        </div>

        <form id="profile-form" method="post" class="form-horizontal" action="#">
          <!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <h4 class="text-center">个 人 基 本 资 料</h4>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">用 户 名</label>
            <label class="col-lg-5 control-label font-md username-label">
              Milton
            </label>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
              <div class="col-lg-5">
                <input type="text" class="form-control input-lg" name="phone" value="188888888"/>
              </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">个 人 邮 箱 </label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="email" value="188888888@qq.com"/>
            </div>
          </div>

          <!-- 个人头像 -->
          <div class="form-group">
              <label class="col-lg-3 control-label font-md">个 人 头 像</label>
              <div class="col-lg-5">
                <div class="show-header">
                  <div class="header-block">
                    <img src="<%=PropertyUtil.staticUrl%>/images/head_100x100.png" class="img-rounded"/>
                  </div>
                  <div class="upload-tip">仅支持JPG、GIF、PNG、JPEG、BMP格式，文件小于4M</div>
                  <div class="btn-group">
                    <button class="btn btn-primary choose-btn" type="button">
                      <label>选择头像</label>
                      <input type="file" class="upload" />
                    </button>
                    <button class="btn btn-primary upload-btn" type="button">
                      <label>上传头像</label>
                    </button>
                </div>

                <div class="progress">
                  <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100" style="width: 45%">
                    <span class="sr-only">45%</span>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full">提交修改</button>
            </div>
          </div>
        </form>

        <form id="update-password-form" method="post" class="form-horizontal hidden" action="#">
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

          <div class="form-group form-margin">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="button" class="btn btn-danger input-lg btn-full">修改密码 </button>
            </div>
          </div>
        </form>

        <form id="address-group-form" method="post" class="form-horizontal hidden" action="#">
          <!-- Address management -->
          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3 control-label">
              <h4 class="text-center">收 货 地 址 管 理</h4>
            </div>
          </div>
          <!-- Address start-->
          <div class="address">
            <div class="form-group">
              <label class="col-lg-3 control-label checkbox-inline">
                <input type="checkbox" class="input-md" checked="checked" />
                <font>默 认 收 货 地 址</font>
              </label>
              <div class="col-lg-5 control-label show-personal">
                <div class="address-username">milton</div>
                <div class="address-phone">1888888888</div>
                <div class="address-code">215600</div>
              </div>
              <div class="col-lg-4 add-btn control-label">
                <span class="glyphicon glyphicon-pencil"></span>
              </div>
            </div>

            <div class="form-group form-margin">
              <label class="col-lg-3 control-label font-md">详 细 地 址</label>
              <div class="col-lg-5 control-label show-address">
                <label> 江苏省</label>
                <label class="show-common"> 苏州市</label>
                <label class="show-common"> 张家港市</label>
                <label class="show-common">杨舍镇南二环路吾悦广场</label>
              </div>
            </div>
          </div>
          <!-- Address end-->

          <!-- Address start-->
          <div class="address">
            <div class="form-group">
              <label class="col-lg-3 control-label checkbox-inline">
                <input type="checkbox" class="input-md">
                <font>默 认 收 货 地 址</font>
              </label>
              <div class="col-lg-5 control-label show-personal">
                <div class="address-username">milton</div>
                <div class="address-phone">1888888888</div>
                <div class="address-code">215600</div>
              </div>
              <div class="col-lg-4 add-btn control-label">
                <span class="glyphicon glyphicon-pencil"></span>
                <span class="glyphicon glyphicon-remove"></span>
              </div>
            </div>

            <div class="form-group form-margin">
              <label class="col-lg-3 control-label font-md">详 细 地 址</label>
              <div class="col-lg-5 control-label show-address">
                <label> 江苏省</label>
                <label class="show-common"> 苏州市</label>
                <label class="show-common"> 张家港市</label>
                <label class="show-common">杨舍镇南二环路吾悦广场</label>
              </div>
            </div>
          </div>
          <!-- Address end-->

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="button" class="btn btn-primary btn-full" onclick="javascript:location.href = 'user-address.html'">新增收货地址</button>
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