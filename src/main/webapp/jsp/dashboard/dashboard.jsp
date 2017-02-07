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
    <title>微购物</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/dashboard/dashboard.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper" id="dashboard">
      <jsp:include page="../common/header.jsp"/>
      <jsp:include page="../common/navigation.jsp"/>
      <div id="content">
        <div class="row">
          <div class="col-lg-8 col-lg-offset-2">
            <!--item-wrapper start-->
            <div class="item-wrapper row">
              <div class="item-category col-lg-2 col-xs-3">
                <ul class="category-ul">
                  <li class="category-li"><a href="#">手机</a></li>
                  <li class="category-li"><a href="#">平板</a></li>
                  <li class="category-li"> <a href="#">笔记本</a></li>
                  <li class="category-li"><a href="#">台式机</a></li>
                  <li class="category-li"><a href="#">商务本</a></li>
                  <li class="category-li"><a href="#">个人电脑</a></li>
                  <li class="category-li"> <a href="#">电子手表</a></li>
                  <li class="category-li"><a href="#">音响</a></li>
                  <li class="category-li"><a href="#">电视</a></li>
                  <li class="category-li"><a href="#">显示屏</a></li>
                </ul>
              </div>

              <div class="item-animation col-lg-10 col-xs-9">
                <jsp:include page="../item-animation/item-animation.jsp"/>
              </div>
            </div>
            <!--item-wrapper end-->
          </div>
        </div>
      </div>
    </div>

    <!-- footer-->
    <jsp:include page="../common/footer.jsp"/>
  </body>
</html>