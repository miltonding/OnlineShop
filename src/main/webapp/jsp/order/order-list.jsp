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
    <title>订单列表</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.staticUrl%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <!-- Extra CSS -->
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/order/order-common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.staticUrl%>/css/order/order-list.css"/>
    <!-- Extra JS -->
  </head>

  <body>
    <div class="wrapper">
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
        </div>
      </div>

      <div class="order-content">
        <div id="order-list" class="col-lg-8 col-lg-offset-2 order-page">
          <div class="order-wrapper">
            <h4 class="order-title">
              <a href="#none"> 全部订单</a>
            </h4>
            <div class="order-breadcrumb row text-center">
              <div class="col-lg-6 part-one">
                <font>商品</font>
              </div>
              <div class="col-lg-1 text-right">
                <font>收货人</font>
              </div>
              <div class="col-lg-2">
                <font> 联系电话</font>
              </div>
              <div class="col-lg-1 text-right">
                <font>订单金额</font>
              </div>
              <div class="col-lg-2">
                <font>状态</font>
              </div>
            </div>

            <div class="order-list">
              <ul>
                <li class="goods-li">
                  <div class="col-lg-6 p-goods">
                    <div class="p-goods">
                      <div class="goods-item">
                        <div class="p-img">
                          <a href="//item.jd.com/2341892.html" target="_blank" class="J_zyyhq_2341892">
                            <img alt="Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)" clstag="clickcart|keycount|xincart|cart_sku_pic" src="//img10.360buyimg.com/cms/s80x80_jfs/t3049/267/321414843/238650/70df281e/57b12a70N8c7a9741.jpg">
                          </a>
                        </div>
                        <div class="p-name">
                          <a clstag="clickcart|keycount|xincart|cart_sku_name" href="//item.jd.com/2341892.html" target="_blank">
                            Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="p-receiver col-lg-1 text-right">
                    <span class="receiver-name">milton</span>
                  </div>
                  <div class="p-phone col-lg-2 text-center">
                    138888888
                  </div>
                  <div class="total-single col-lg-1 text-right">
                    <strong>¥8488.00</strong>
                  </div>
                  <div class="order-status col-lg-2 text-center">
                    <label>已支付</label>
                    <a href="#" target="_blank">订单详细</a>
                  </div>
                </li>

                <li class="goods-li">
                  <div class="col-lg-6 p-goods">
                    <div class="p-goods">
                      <div class="goods-item">
                        <div class="p-img">
                          <a href="//item.jd.com/2341892.html" target="_blank" class="J_zyyhq_2341892">
                            <img alt="Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)" clstag="clickcart|keycount|xincart|cart_sku_pic" src="//img10.360buyimg.com/cms/s80x80_jfs/t3049/267/321414843/238650/70df281e/57b12a70N8c7a9741.jpg">
                          </a>
                        </div>
                        <div class="p-name">
                          <a clstag="clickcart|keycount|xincart|cart_sku_name" href="//item.jd.com/2341892.html" target="_blank">
                            Apple MacBook Air 13.3英寸笔记本电脑 银色(Core i5 处理器/8GB内存/256GB SSD闪存 MMGG2CH/A)
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="p-receiver col-lg-1 text-right">
                    <span class="receiver-name">milton</span>
                  </div>
                  <div class="p-phone col-lg-2 text-center">
                    138888888
                  </div>
                  <div class="total-single col-lg-1 text-right">
                    <strong>¥8488.00</strong>
                  </div>
                  <div class="order-status col-lg-2 text-center">
                    <label>已支付</label>
                    <a href="#" target="_blank">订单详细</a>
                  </div>
                </li>
              </ul>
              <!-- change page-->
              <div class="page-wrapper col-lg-12">
                <nav class="col-lg-7 col-lg-offset-1 page-block">
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

                <nav class="col-lg-4 redirect-wrapper text-right">
                  <em>共<b>100</b>页&nbsp;&nbsp;到第</em>
                  <input class="input-sm goal-page" type="text" value="1">
                  <em>页</em>
                  <a class="btn btn-default" onclick="SEARCH.page_jump(100,1)" href="javascript:;">确定</a>
                </nav>
              </div>

            </div>
          </div>
        </div>
      </div>

      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>