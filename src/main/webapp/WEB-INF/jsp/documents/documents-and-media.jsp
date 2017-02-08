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
    <script src="<%=PropertyUtil.getStaticUrl()%>/mui/js/component/upload/core.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/documents-and-media/select.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/documents-and-media/documents.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="content">
      
        <div class="col-lg-offset-3 col-lg-6">
          <div id="address-form">
            <h4 class="text-center">商 品 图 片上 传</h4>

            <div class="form-group hidden-flow">
              <label class="col-lg-3 control-label font-md">类别</label>
              <div class="col-lg-9 text-center">
                <select class="form-control" id="kindid" name="kindid">
                  <option value="0">——请选择——</option>
                  <c:if test="${!empty kindList}">
                    <c:forEach var="kind" items="${kindList}">
                      <option value="${kind.kindid }">${kind.kindName }</option>
                    </c:forEach>
                  </c:if>
                </select>
              </div>
            </div>

            <div class="form-group hidden-flow">
              <label class="col-lg-3 control-label font-md">种类</label>
              <div class="col-lg-9 text-center">
                <select class="form-control" id="categoryid" name="categoryid">
                  <option value="0">——请选择——</option>
                </select>
              </div>
            </div>

            <div class="form-group hidden-flow">
              <label class="col-lg-3 control-label font-md">产品</label>
              <div class="col-lg-9 text-center">
                <select class="form-control" name="productid" id="productid">
                  <option value="0">——请选择——</option>
                </select>
              </div>
            </div>

            <div class="form-group hidden-flow">
              <label class="col-lg-3 control-label font-md">描述</label>
              <div class="col-lg-9 text-center">
                <input type="text" class="form-control" name="description"
                  id="description">
              </div>
            </div>
  
            <mui:upload name="file" action="uploadGoods" type="image"/>
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
  </body>
</html>