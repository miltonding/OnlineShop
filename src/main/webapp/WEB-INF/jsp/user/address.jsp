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
    <title>修改地址</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/user/register.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/user/address.js"></script>
  </head>

  <body>
    <c:choose>
      <c:when test="${!empty addressCreate }">
        <c:set var="title" value="新 增 地 址"/>
        <c:set var="actionName" value="createAddress"/>
        <c:set var="buttonTitle" value="立即添加" />
      </c:when>
      <c:when test="${!empty addressEdit }">
        <c:set var="title" value="修 改 地 址"/>
        <c:set var="actionName" value="editAddress"/>
        <c:set var="buttonTitle" value="立即修改" />
      </c:when>
    </c:choose>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="content">
        <div class="row menu">
          <div class="col-lg-5 col-lg-offset-3">
            <ul class="nav nav-tabs nav-justified">
              <li role="presentation"><a href="<%=contentPath %>/page/user/profile?option=addressManage">地址管理</a></li>
              <li role="presentation" class="active"><a href="#" class="selected-item">${title }</a></li>
            </ul>
          </div>
        </div>
        <form id="address-form" method="post" class="form-horizontal" action="<%=contentPath %>/page/address/${actionName }">
          <input type="hidden" name="addressid" value="${addressWrapper.addressid }">
          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <h4 class="text-center">${title }</h4>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label font-md">收 货 人 姓 名</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="receiverName" value="${addressWrapper.receiverName }"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="phoneNumber" value="${addressWrapper.phoneNumber }"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label font-md">邮 编 编 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="zipCode" value="${addressWrapper.zipCode }"/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label font-md">默 认 收 货 地 址</label>
            <div class="col-lg-5 address-group">
              <div class="select-province col-lg-4 text-center">
                <select class="form-control" name="provinceid" id="select-province">
                  <option value="0">省/直辖市</option>
                  <c:if test="${!empty provinceList}">
                    <c:forEach var="province" items="${provinceList }">
                      <c:choose>
                        <c:when test="${province.provinceid == addressWrapper.provinceid }">
                          <option value="${province.provinceid }" selected="selected">${province.provinceName }</option>
                        </c:when>
                        <c:otherwise>
                          <option value="${province.provinceid }">${province.provinceName }</option>
                        </c:otherwise>
                      </c:choose>
                    </c:forEach>
                  </c:if>
                </select>
              </div>
              <div class="select-city col-lg-4 text-center">
                <select class="form-control" name="cityid" id="select-city">
                  <c:choose>
                    <c:when test="${!empty addressWrapper }">
                      <option value="${addressWrapper.cityid }" selected="selected">${addressWrapper.cityName }</option>
                    </c:when>
                    <c:otherwise>
                      <option value="0">市/区</option>
                    </c:otherwise>
                  </c:choose>
                </select>
              </div>
              <div class="select-district col-lg-4 text-center">
                <select class="form-control" name="districtid" id="select-district">
                  <c:choose>
                    <c:when test="${!empty addressWrapper }">
                      <option value="${addressWrapper.districtid }" selected="selected">${addressWrapper.districtName }</option>
                    </c:when>
                    <c:otherwise>
                      <option value="0">县/乡</option>
                    </c:otherwise>
                  </c:choose>
                </select>
              </div>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">详 细 地 址</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="detailAddress" value="${addressWrapper.detailAddress }"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full">${buttonTitle }</button>
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