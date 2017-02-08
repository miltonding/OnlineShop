<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/mui/css/mui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/common.css"/>

    <!-- JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/validator/common.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/jquery-2.1.1.min.js"></script>
    <!-- bootstrap validator -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/bootstrap/js/bootstrapvalidator.min.js"></script>
    <!-- mui -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/mui/js/mui.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/bootstrap/js/bootstrap.min.js"></script>
    <script>
      mui.setStaticUrl('<%=PropertyUtil.getStaticUrl()%>');
      mui.setApacheUrl('<%=PropertyUtil.getApacheUrl()%>');
    </script>
  </head>
</html>