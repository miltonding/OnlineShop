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
    <title>注册</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/user/register.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/user/register.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="content">
        <form id="register-form" action="<%=contentPath %>/page/user/register" 
          method="post" class="form-horizontal">
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">用 户 名</label>
              <div class="col-lg-5">
                <input type="text" class="form-control input-lg" name="username" id="username"/>
              </div>
          </div>
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">设 置 密 码</label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="password" id="password"/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">确 认 密 码</label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="repeatPassword" id="repeatPassword" />
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="phone" id="phone" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">默 认 收 货 地 址</label>
            <div class="col-lg-5 address-group">
              <div class="select-province col-lg-4 text-center">
                <select class="form-control" name="selectProvince" id="select-province">
                  <option value="0">省/直辖市</option>
                  <c:if test="${!empty provinceList}">
                    <c:forEach var="province" items="${provinceList }">
                      <option value="${province.provinceid }">${province.provinceName }</option>
                    </c:forEach>
                  </c:if>
                </select>
              </div>
              <div class="select-city col-lg-4 text-center">
                <select class="form-control" name="selectCity" id="select-city">
                  <option value="0">市/区</option>
                </select>
              </div>
              <div class="select-district col-lg-4 text-center">
                <select class="form-control" name="selectDistrict" id="select-district">
                  <option value="0">县/乡</option>
                </select>
              </div>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">收 货 人 姓 名</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="receiverName" id="receiverName"/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">邮 编 编 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="addressCode" id="addressCode"/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">详 细 地 址</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="detailAddress" id="detailAddress" />
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full" id="registerBtn">立即注册</button>
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