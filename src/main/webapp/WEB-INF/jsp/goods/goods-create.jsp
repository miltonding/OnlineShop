<%@page import="com.milton.shop.util.PropertyUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%String contentPath = request.getContextPath();%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 移动设备优先 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品添加</title>
    <!-- icon -->
    <link rel="icon" href="<%=PropertyUtil.getStaticUrl()%>/images/title_logo.png" type="image/x-icon" />
    <%@include file="../common/init.jsp"%>
    <link rel="stylesheet" type="text/css" href="<%=PropertyUtil.getStaticUrl()%>/css/goods/goods-create.css"/>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/documents-and-media/select.js"></script>
    <script src="<%=PropertyUtil.getStaticUrl()%>/js/goods/goods-create.js"></script>
  </head>

  <body>
    <div class="wrapper">
      <jsp:include page="../common/header.jsp"/>
      <div id="content">
        <form id="goods-form" action="<%=contentPath %>/page/goods/goodsCreate" method="post" class="form-horizontal">
          <div class="form-group form-margin">
            <div class="col-lg-5 col-lg-offset-3 text-center">
              <h3>商品添加</h3>
            </div>
          </div>
          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">品牌名称</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="brand" id="brand"/>
            </div>
          </div>

          <div class="form-group hidden-flow">
            <label class="col-lg-3 control-label font-md">类别</label>
            <div class="col-lg-2 text-center">
              <select class="form-control" id="kindid" name="kindid">
                <option value="0">——请选择——</option>
                <c:if test="${!empty kindList}">
                  <c:forEach var="kind" items="${kindList}">
                    <option value="${kind.kindid }">${kind.kindName }</option>
                  </c:forEach>
                </c:if>
              </select>
            </div>
            <label class="col-lg-1 control-label font-md">种类</label>
            <div class="col-lg-2 text-center">
              <select class="form-control" id="categoryid" name="categoryid">
                <option value="0">——请选择——</option>
              </select>
            </div>
          </div>

          <div class="form-group hidden-flow">
            <label class="col-lg-3 control-label font-md">产品</label>
            <div class="col-lg-2 text-center">
              <select class="form-control" name="productid" id="productid">
                <option value="0">——请选择——</option>
              </select>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">图标</label>
            <div class="col-lg-5">
              <!-- Large button group -->
              <div id="img-group">
                <input type="hidden" name="entryid" id="entryid">
                <button class="btn btn-default btn-lg dropdown-toggle" type="button" 
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" id="img-btn">
                  <font>商品图片</font>
                  <span class="caret"></span>
                </button>
                <ul class="dropdown-menu img-ul">
                </ul>
              </div>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">中文名</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="chineseName" id="chineseName" value="苹果笔记本电脑" />
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">英文名</label>
            <div class="col-lg-5">
              <input type="text" class="form-control input-lg" name="englishName" id="englishName" 
              value="AppleMacbook Pro" />
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">商品描述</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="goodsDescribe" id="describe" 
              value=""/>
            </div>
          </div>

          <div class="form-group">
            <label class="col-lg-3 control-label font-md">商品优势</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="goodsAdvantage" id="advantage" 
              value="数码开学季，精选大牌优惠折，全场低至99元，领券再减！"/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">单位成本</label>
            <div class="col-lg-2">
              <input type="text" class="form-control" name="unitCost" id="unitCost" value="" />
            </div>
            <label class="col-lg-1 control-label font-md">单位售价</label>
            <div class="col-lg-2">
              <input type="text" class="form-control" name="listPrice" id="listPrice" value=""/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">库存</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="quantity"/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">属性1</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="attrOne" id="attrOne" value="Core i5 处理器"/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">属性2</label>
            <div class="col-lg-5">
              <input type="text" class="form-control " name="attrTwo" id="attrTwo" value="8GB内存"/>
            </div>
          </div>

          <div class="form-group form-margin">
            <label class="col-lg-3 control-label font-md">属性3</label>
            <div class="col-lg-5">
              <input type="text" class="form-control" name="attrThree" id="attrThree" value="128GB SSD闪存 MMGF2CH/A"/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-lg-5 col-lg-offset-3">
              <button type="button" class="btn btn-danger input-lg btn-full" id="addBtn">立即添加</button>
            </div>
          </div>
        </form>
      </div>
      <!-- footer-->
      <jsp:include page="../common/footer.jsp"/>
    </div>
  </body>
</html>