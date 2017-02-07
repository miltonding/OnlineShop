<%@page import="util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <body>
    <div id="navigation">
      <!-- shortcut-->
      <div class="row shortcut">
        <div class="col-lg-8 col-lg-offset-2 shortcut-control">
          <div class="col-lg-6 col-xs-6" style="padding: 0">
            <ul class="menu-ul">
               <li class="user-li">Hi, 欢迎来到威购物!</li>
               <li class="user-li"><a href="#">游客登录</a></li>
            </ul>
          </div>

          <div class="col-lg-6 col-xs-6">
            <ul class="menu-ul">
              <li class="menu-li"> <a href="#">修改密码</a></li>
              <li class="menu-li"><a href="#">免费注册</a></li>
              <li class="menu-li"><a href="#">个人中心</a></li>
              <li class="menu-li"><a href="#">商品管理</a></li>
              <li class="menu-li"> <a href="#">购物车</a></li>
              <li class="menu-li"><a href="#">我的订单</a></li>
            </ul>
          </div>
        </div>
      </div>

      <div class="row search-wrapper">
        <div class="col-lg-8 col-lg-offset-2 search-container" >

          <div class="search-group">
            <form method="post" action="#">
              <input type="text" class="search-keyword" placeholder="自营服饰3免1"/>
              <button type="button" class="btn btn-primary search-btn"
                      onclick="javascript: window.top.location = 'goods-list.html';">
                <span class="glyphicon glyphicon-search"></span>
              </button>
            </form>
          </div>

          <div class="cart-group">
            <a class="btn btn-primary btn-full cart-link" href="cart.html" target="_blank"
               onclick="javascript: window.top.location = 'cart.html';">
              <span class="glyphicon glyphicon-shopping-cart"></span>
              <font>我的购物车</font>
              <span class="badge">4</span>
            </a>
          </div>
        </div>

        <div class="introduce-wrapper">
          <div  class="col-lg-8 col-lg-offset-2 introduce-group">
            <div class="col-lg-10 col-lg-offset-1 nav-items">
              <ul>
                <li class="items-li"><a href="#">手机</a></li>
                <li class="items-li"><a href="#">平板</a></li>
                <li class="items-li"> <a href="#">笔记本</a></li>
                <li class="items-li"><a href="#">台式机</a></li>
                <li class="items-li"><a href="#">商务本</a></li>
                <li class="items-li"><a href="#">个人电脑</a></li>
                <li class="items-li"> <a href="#">电子手表</a></li>
                <li class="items-li"><a href="#">音响</a></li>
                <li class="items-li"><a href="#">电视</a></li>
                <li class="items-li"><a href="#">显示屏</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>