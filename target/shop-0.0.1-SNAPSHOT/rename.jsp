<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>rename bug</title>
    
    <!-- icon -->
    <link rel="icon" href="<%=request.getContextPath()%>/image/logo.png" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style/rename.css">

    <!-- bootstrap module-->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/bootstrap/css/docs.css">
    <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/js/bootstrap.min.js"></script>
    
    <!-- bootstrap validator -->
    <script src="<%=request.getContextPath()%>/js/bootstrapvalidator.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/validator.js"></script>
    <script>
    $(function() {
        function bugRename() {
            var bugDescribe = $('textarea[name="bugDescribe"]').val().trim();
            if (bugDescribe.length == 0) {
                if ($('#result').text().trim().length != 0) {
                    $('#result').text('');
                }
                return;
            }

            var param = {"bugDescribe": bugDescribe};
            var url = '<%=request.getContextPath()%>/rename';
            $.post(url, param, function(data) {
                console.log(data);
                $('#result').text(data);
            }, 'text');
        }
        $('#btn').on('click', bugRename);
        $('textarea[name="bugDescribe"]').on('keydown', function(event) {
            if (event.keyCode === 13) {
                bugRename();
            }
        });
        $('#progress').animate({width: '100%'}, 2000 , function() {
            $('#progress').html('100%');
        })
    });
    </script>
    </head>
  <body>
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-6">
          <h5 class="bug_label">Bug rename</h5>
          <textarea  name="bugDescribe" class="bugDescribe"></textarea>
        </div>
        <div class="col-md-6">
          <input type="button" value="rename" id="btn" class="btn btn-primary"/>
          <div class="show_wrapper">
            <span id="result"></span>
          </div>
        </div>
      </div>
    </div>

    <button type="button" class="btn btn-default btn-lg">
      <span class="glyphicon glyphicon-star"></span> Star
    </button>

    <div class="bs-glyphicons custom_btn">
      <span class="glyphicon glyphicon-play"></span>
      <span class="glyphicon-class">play</span>
    </div>
    
    <div class="dropdown">
    <button class="btn btn-danger dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">
    Dropdown
    <span class="caret"></span>
  </button>
  <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
    <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
  </ul>
</div>

<div class="row">
  <div class="progress col-md-12">
    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;" id="progress">
      0%
    </div>
  </div>
</div>

<div>
  <h4 style="text-align: center;">Form Validator</h4>
  <form id="defaultForm" method="post" class="form-horizontal" action="">
    <!-- 下面这个div必须要有，插件根据这个进行添加提示 -->
    <div class="form-group">
      <label class="col-lg-3 control-label">Username</label>
      <div class="col-lg-5">
        <input type="text" class="form-control" name="username" />
      </div>
    </div>
    <div class="form-group">
      <label class="col-lg-3 control-label">Email address</label>
      <div class="col-lg-5">
          <input type="text" class="form-control" name="email" />
      </div>
    </div>

    <div class="form-group">
      <label class="col-lg-3 control-label">Password</label>
      <div class="col-lg-5">
          <input type="password" class="form-control" name="password" />
      </div>
    </div>

    <div class="form-group">
      <div class="col-lg-9 col-lg-offset-3">
          <button type="submit" class="btn btn-primary">Sign up</button>
      </div>
   </div>
  </form>
</div>
  </body>
</html>