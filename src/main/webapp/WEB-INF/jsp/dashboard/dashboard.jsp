<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 引入自定义标签 -->
<%@taglib uri="/WEB-INF/taglib/mui.tld" prefix="mui"%>

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>微购物</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/dashboard/dashboard.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/item-animation/item-animation.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/mui/js/component/carousel/core.js"></script>
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
                  <c:if test="${!empty productList}">
                    <c:forEach items="${productList }" var="product">
                      <li class="category-li">
                        <a href="<%=contentPath%>/page/goods/goodsList?productid=${product.productid}">
                          ${product.productName }
                        </a>
                      </li>
                    </c:forEach>
                  </c:if>
                </ul>
              </div>

              <div class="item-animation col-lg-10 col-xs-9">
                <mui:carousel id="my-carousel">
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_one.jpg"/>
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_two.jpg" link="234"/>
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_three.jpg" link="123"/>
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_four.jpg" link="123"/>
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_five.jpg"/>
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_six.png"/>
                  <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_seven.jpg"/>
                </mui:carousel>
              </div>

            </div>
            <!--item-wrapper end-->
          </div>
        </div>
      </div>
      
      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>

  </body>
</html>