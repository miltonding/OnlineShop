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
    <title>笔记本-商品搜索-微购物</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/goods/goods-list.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper" id="dashboard">
      <jsp:include page="../common/header.jsp"/>
      <div id="navigation">
        <!-- shortcut-->
        <div class="row shortcut">
          <div class="col-lg-9 col-lg-offset-1 shortcut-control">
            <div class="col-lg-6 col-xs-6">
              <ul class="menu-ul">
                <li class="user-li">Hi, 欢迎来到威购物!</li>
                <li class="user-li"><a href="#">游客登录</a></li>
              </ul>
            </div>

            <div class="col-lg-6 col-xs-6">
              <ul class="menu-ul">
                <li class="menu-li"> <a href="#">请登录</a></li>
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
                <button type="button" class="btn btn-primary search-btn">
                  <span class="glyphicon glyphicon-search"></span>
                </button>
              </form>
            </div>

            <div class="cart-group">
              <button class="btn btn-primary btn-full" type="button">
                <span class="glyphicon glyphicon-shopping-cart"></span>
                <font>我的购物车</font>
                <span class="badge">4</span>
              </button>
            </div>
          </div>

          <div class="introduce-wrapper">
            <div  class="col-lg-12 introduce-group">
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

      <div id="goods-list">
        <div class="row">
          <!--item-wrapper start -->
          <div class="col-lg-10 col-lg-offset-1 list-wrapper">
            <div class="thumbnail goods-li">
              <div class="goods-model">
                <a href="goods-detail.html" target="_blank" title="第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面">
                  <img class="goods-img" data-src="holder.js/100%x200" alt="220x220" src="<%=PropertyUtil.staticUrl%>/images/goods/goods-one.jpg" data-holder-rendered="true">
                </a>
                <div class="caption">
                  <div class="goods-price">
                    <strong><em>￥</em>19999.0</strong>
                  </div>
                  <div class="goods-describe">
                    <a href="goods-detail.html" target="_blank" title="第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面">
                      <font>第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面</font>
                    </a>
                  </div>
                  <div class="goods-operation">
                    <a class="btn btn-primary detail-btn" target="_blank" href="goods-detail.html">查看</a>
                    <a class="btn btn-danger add-btn" href="cart.html">
                      <span class="glyphicon glyphicon-shopping-cart"></span>
                      <font>加入购物车</font>
                    </a>
                  </div>
                </div>
              </div>
            </div>

            <div class="thumbnail goods-li">
              <div class="goods-model">
                <a href="goods-detail.html" target="_blank" title="第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面">
                  <img class="goods-img" data-src="holder.js/100%x200" alt="220x220" src="<%=PropertyUtil.staticUrl%>/images/goods/goods-one.jpg" data-holder-rendered="true">
                </a>
                <div class="caption">
                  <div class="goods-price">
                    <strong><em>￥</em>19999.0</strong>
                  </div>
                  <div class="goods-describe">
                    <a href="goods-detail.html" target="_blank" title="第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面">
                      <font>第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面</font>
                    </a>
                  </div>
                  <div class="goods-operation">
                    <a class="btn btn-primary detail-btn" target="_blank" href="goods-detail.html">查看</a>
                    <a class="btn btn-danger add-btn" href="cart.html">
                      <span class="glyphicon glyphicon-shopping-cart"></span>
                     <font> 加入购物车</font>
                    </a>
                  </div>
                </div>
              </div>
            </div>

            <div class="thumbnail goods-li">
              <div class="goods-model">
                <a href="goods-detail.html" target="_blank" title="第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面">
                  <img class="goods-img" data-src="holder.js/100%x200" alt="220x220" src="<%=PropertyUtil.staticUrl%>/images/goods/goods-one.jpg" data-holder-rendered="true">
                </a>
                <div class="caption">
                  <div class="goods-price">
                    <strong><em>￥</em>19999.0</strong>
                  </div>
                  <div class="goods-describe">
                    <a href="goods-detail.html" target="_blank" title="第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面">
                      <font>第七代i7处理器，8G超大内存与1T硬盘，快无止境、大无止境。【华硕惠战】好物惠聚！部分直降，还可享白条免息！详情见活动页面</font>
                    </a>
                  </div>
                  <div class="goods-operation">
                    <a class="btn btn-primary detail-btn" target="_blank" href="goods-detail.html">查看</a>
                    <a class="btn btn-danger add-btn" href="cart.html">
                      <span class="glyphicon glyphicon-shopping-cart"></span>
                      <font>加入购物车</font>
                    </a>
                  </div>
                </div>
              </div>
            </div>


          </div>
          <!--item-wrapper end-->
          <div class="col-lg-8 col-lg-offset-3 page-wrapper">
            <nav class="col-lg-7 col-lg-offset-2 page-block">
              <ul class="pagination page-ul">
                <li><a href="#">上一页</a></li>
                <li><a class="current-page">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a class="less-single">...</a></li>
                <li><a href="#">下一页</a></li>
              </ul>
            </nav>

            <nav class="col-lg-3 redirect-wrapper">
              <em>共<b>100</b>页&nbsp;&nbsp;到第</em>
              <input class="input-sm goal-page" type="text" value="1"/>
              <em>页</em>
              <a class="btn btn-default" onclick="SEARCH.page_jump(100,1)" href="javascript:;">确定</a>
            </nav>
          </div>
        </div>
      </div>
      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>