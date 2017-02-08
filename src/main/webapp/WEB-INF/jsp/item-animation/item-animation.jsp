<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <head>
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/item-animation/item-animation.css"/>
    <!-- Extra JS -->
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/item-animation/item-animation.js"></script>
  </head>

  <body>
    <div id="" class="carousel-wrapper">
      <div id="item-animation">
        <!-- main part-->
        <ul class="slider_item" id="move_block">
          <li class="slider_item slider_show">
            <a href="javascript:void(0);" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_one.jpg" class="slider_item"/>
            </a>
          </li>
          <li class="slider_item slider_hide">
            <a href="javascript:void(0);" class="slider_item" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_two.jpg" class="slider_item common_img"/>
            </a>
          </li>
          <li class="slider_item slider_hide">
            <a href="javascript:void(0);" class="slider_item" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_three.jpg" class="slider_item"/>
            </a>
          </li>
          <li class="slider_item slider_hide">
            <a href="javascript:void(0);" class="slider_item" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_four.jpg" class="slider_item"/>
            </a>
          </li>
          <li class="slider_item slider_hide">
            <a href="javascript:void(0);" class="slider_item" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_five.jpg" class="slider_item"/>
            </a>
          </li>
          <li class="slider_item slider_hide">
            <a href="javascript:void(0);" class="slider_item" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_six.png" class="slider_item"/>
            </a>
          </li>
          <li class="slider_item slider_hide">
            <a href="javascript:void(0);" class="slider_item" target="_blank">
              <img src="<%=PropertyUtil.getStaticUrl()%>/images/item/item_seven.jpg" class="slider_item"/>
            </a>
          </li>
        </ul>
  
        <!-- indicator -->
        <ul class="slider_indicator">
          <li class="slider_indicator_btn slider_indicator_active"></li>
          <li class="slider_indicator_btn"></li>
          <li class="slider_indicator_btn"></li>
          <li class="slider_indicator_btn"></li>
          <li class="slider_indicator_btn"></li>
          <li class="slider_indicator_btn"></li>
          <li class="slider_indicator_btn slider_indicator_btn_last"></li>
        </ul>
  
        <!-- prev -->
        <a href="javascript:void(0);" class="slider_control_prev slider_control_font">&lt;</a>
  
        <!-- next -->
        <a href="javascript:void(0);" class="slider_control_next slider_control_font">&gt;</a>
      </div>
    </div>
  </body>
</html>