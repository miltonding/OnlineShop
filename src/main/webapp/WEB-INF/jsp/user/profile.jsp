<%@page import="com.milton.shop.util.Validator"%>
<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String contentPath = request.getContextPath();%>
<!-- 引入自定义标签 -->
<%@taglib uri="/WEB-INF/taglib/mui.tld" prefix="mui"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改个人资料</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/user/register.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/user/profile.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/mui/js/component/upload/core.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <div class="disable-screen hidden"></div>
      <!-- confirm message -->
      <div class="confirm-message text-center hidden">
        <div>确定删除</div>
        <div>
          <a class="ok" href="#"><span class="glyphicon glyphicon-ok"></span>确定</a>
          <font>&nbsp;&nbsp;&nbsp;&nbsp;</font>
          <font>&nbsp;&nbsp;&nbsp;&nbsp;</font>
          <a class="cancel" href="#"><span class="glyphicon glyphicon-remove"></span>取消</a>
        </div>
      </div>

      <!-- flash message -->
      <div class="fixed-message-ok text-center hidden">
        <span class="glyphicon glyphicon-ok"></span>
      </div>
      <div class="fixed-message-error text-center hidden">
        <span class="glyphicon glyphicon-remove"></span>
      </div>
      <%String option = (String) request.getParameter("option");
        if (!Validator.isNullEmptyString(option) && "addressManage".equals(option)) {
      %>
        <c:set var="formProfileCss" value="hidden"/>
        <c:set var="formAddressCss" value=""/>
        <c:set var="itemProfileCss" value=""/>
        <c:set var="itemAddressCss" value="active"/>
      <%
        } else {
      %>
        <c:set var="formProfileCss" value=""/>
        <c:set var="formAddressCss" value="hidden"/>
        <c:set var="itemProfileCss" value="active"/>
        <c:set var="itemAddressCss" value=""/>
      <%
        }
      %>

      <c:choose>
        <c:when test="${updateProfile == 'success' }">
          <c:set var="result" value="${updateProfile }"/>
          <%session.removeAttribute("updateProfile");%>
          <c:choose>
            <c:when test="${result == 'success'}">
              <div class="fixed-message-ok text-center" id="profile-message">
                <span class="glyphicon glyphicon-ok">修改成功!</span>
              </div>
            </c:when>
            <c:otherwise>
              <div class="fixed-message-error text-center hidden">
                <span class="glyphicon glyphicon-ok">修改失败!</span>
              </div>
            </c:otherwise>
          </c:choose>
          <script>
          setTimeout(function() {
              $("#profile-message").fadeOut(1000);
          }, 2000);
          </script>
        </c:when>
        <c:when test="${!empty editAddress}">
          <script>
            console.log('editAddress......................');
          </script>
          <c:set var="result" value="${editAddress }"/>
          <%session.removeAttribute("editAddress");%>
          <c:choose>
            <c:when test="${result == 'success'}">
              <div class="fixed-message-ok text-center" id="profile-message">
                <span class="glyphicon glyphicon-ok">修改成功!</span>
              </div>
            </c:when>
            <c:otherwise>
              <div class="fixed-message-error text-center" id="profile-message">
                <span class="glyphicon glyphicon-remove">修改失败!</span>
              </div>
            </c:otherwise>
          </c:choose>
          <script>
          setTimeout(function() {
              $("#profile-message").fadeOut(1000);
          }, 2000);
          </script>
        </c:when>
        <c:when test="${!empty createAddress }">
          <script>
            console.log('createAddress......................');
          </script>
          <c:set var="result" value="${createAddress }"/>
          <%session.removeAttribute("createAddress");%>
          <c:choose>
            <c:when test="${result == 'success'}">
              <div class="fixed-message-ok text-center" id="profile-message">
                <span class="glyphicon glyphicon-ok">创建成功!</span>
              </div>
            </c:when>
            <c:otherwise>
              <div class="fixed-message-error text-center" id="profile-message">
                <span class="glyphicon glyphicon-remove">创建失败!</span>
              </div>
            </c:otherwise>
          </c:choose>
          <script>
          setTimeout(function() {
              $("#profile-message").fadeOut(1000);
          }, 2000);
          </script>
        </c:when>
      </c:choose>

      <jsp:include page="../common/header.jsp"/>
      <div id="content">
        <div class="row" id="profile_menu">
          <div class="col-lg-5 col-lg-offset-3">
            <ul class="nav nav-tabs nav-justified">
              <li role="presentation" class="${itemProfileCss }" form="profile-form">
                <a>个人基本资料</a>
              </li>
              <li role="presentation" form="update-password-form">
                <a>修改密码</a>
              </li>
              <li role="presentation" class="${itemAddressCss }" form="address-group-form">
                <a>地址管理</a>
              </li>
            </ul>
          </div>
        </div>

        <form id="profile-form" method="post" 
        class="form-horizontal ${formProfileCss }" 
        action="<%=contentPath%>/page/user/profile">
          <!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <h4 class="text-center">个 人 基 本 资 料</h4>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">用 户 名</label>
            <label class="col-lg-5 control-label font-md username-label">
              ${user.username }
            </label>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">昵 称</label>
              <div class="col-lg-5">
                <input type="text" class="form-control input-lg" name="screenName" value="${user.screenName }"/>
              </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
              <div class="col-lg-5">
                <input type="text" class="form-control input-lg" name="phone" value="${user.phoneNumber }"/>
              </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">个 人 邮 箱 </label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="email" value="${user.email }"/>
            </div>
          </div>

          <!-- 个人头像 -->
          <div class="form-group">
            <label class="col-lg-3 control-label font-md">个 人 头 像</label>
            <div class="col-lg-5">
              <mui:upload name="file" action="/miltonshop/page/documents/uploadHeader"
                type="image" src="${user.srcPath}"
                chooseText="选择头像" uploadText="上传头像"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full">提交修改</button>
            </div>
          </div>
        </form>

        <form id="update-password-form" method="post" 
          class="form-horizontal hidden" 
          action="<%=contentPath%>/page/user/updatePwd">
          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <h4 class="text-center">修 改 密 码</h4>
            </div>
          </div>

<!--           <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">手 机 号 码</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="phone_number" />
            </div>
          </div> -->

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">新 密 码</label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="password" />
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">确 认 密 码 </label>
            <div class="col-lg-5">
              <input type="password" class="form-control input-lg" name="repeatPassword" />
            </div>
          </div>

          <div class="form-group form-margin">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="submit" class="btn btn-danger input-lg btn-full">修改密码 </button>
            </div>
          </div>
        </form>

        <form id="address-group-form" method="post" class="form-horizontal ${formAddressCss }" action="#">
          <!-- Address management -->
          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3 control-label">
              <h4 class="text-center">收 货 地 址 管 理</h4>
            </div>
          </div>
          <!-- Address start-->
          <!-- <div class="address">
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
 -->          <!-- Address end-->
 
          <c:if test="${!empty addressList}">
            <c:forEach items="${addressList }" var="address" varStatus="status">
              <!-- Address start-->
              <div class="address">
                <div class="form-group">
                  <label class="col-lg-3 control-label checkbox-inline">
                    <c:choose>
                      <c:when test="${address.isDefault == 1}">
                        <input type="checkbox" class="input-md default-address" checked="checked" addressid="${address.addressid }">
                      </c:when>
                      <c:otherwise>
                        <input type="checkbox" class="input-md default-address" addressid="${address.addressid }">
                      </c:otherwise>
                    </c:choose>
                    <font>默 认 收 货 地 址</font>
                  </label>
                  <div class="col-lg-5 control-label show-personal">
                    <div class="address-username">${address.receiverName }</div>
                    <div class="address-phone">
                      ${fn:substring(address.phoneNumber, 0, 3) }
                      ****
                      ${fn:substring(address.phoneNumber, 7, 13) }
                    </div>
                    <div class="address-code">${address.zipCode }</div>
                  </div>
                  <div class="col-lg-4 add-btn control-label">
                    <a href="<%=contentPath %>/page/address/editAddress?addressid=${address.addressid }">
                      <span class="glyphicon glyphicon-pencil"></span>
                    </a>
                    <a href="javascript:void(0);" class="delete-address" addressid="${address.addressid }">
                      <span class="glyphicon glyphicon-remove"></span>
                    </a>
                  </div>
                </div>
    
                <div class="form-group form-margin">
                  <label class="col-lg-3 control-label font-md">详 细 地 址</label>
                  <div class="col-lg-5 control-label show-address">
                    <label class="show-common">${address.provinceName }</label>
                    <label class="show-common">${address.cityName }</label>
                    <label class="show-common">${address.districtName }</label>
                    <label class="show-detail">${address.detailAddress }</label>
                  </div>
                </div>
              </div>
              <!-- Address end-->
            </c:forEach>
          </c:if>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="button" class="btn btn-primary btn-full" onclick="javascript:location.href = 
              '<%=contentPath%>/page/address/createAddress'">新增收货地址</button>
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