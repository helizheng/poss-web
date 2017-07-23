<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>登录</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/bootstrap-responsive.min.css" />
    <link rel="stylesheet" href="${ctx}/static/bootstrap/css/matrix-login.css" />
    <link href="${ctx}/static/bootstrap/font-awesome/css/font-awesome.css" rel="stylesheet" />
<%--    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>--%>
    <script src="${ctx}/static/bootstrap/js/jquery.min.js"></script>
    <script src="${ctx}/static/common/common.js"></script>
    <%--弹出框--%>
    <script type="text/javascript" src="${ctx}/static/bootstrap/js/layer-v1.9.2/layer/layer.js"></script>
    <script type="text/javascript">
//        $(function(){
//            var form = $("#loginform");
//            $("#login").click(function(event){
//                var userName = form.find("#userName").val();
//                var password = form.find("#password").val();
//                console.info(111);
//                CommnUtil.ajax(ctx + "/system/user/login",{'username':userName,'password':password},'json');
//                event.preventDefault();
//            });
//        });


        function checkUserForm() {
            document.loginform.submit();
        }
        $(function() {
            $('input:text:first').focus(); //把焦点放在第一个文本框
            if ("${error}" != "") {
                layer.msg("${error}",{icon: 2});
            };
            document.onkeydown = function (event) {
                var e = event || window.event || arguments.callee.caller.arguments[0];
                if (e && e.keyCode == 13) {
                    checkUserForm();
                }
            };
        });
    </script>
</head>
<body>

<%--<div class="error">${error}</div>
<form action="" method="post">
    用户名：<input type="text" name="username" value="<shiro:principal/>"><br/>
    密码：<input type="password" name="password"><br/>
    <input type="submit" value="登录">
</form>--%>
<div id="loginbox">
    <form id="loginform" name="loginform" class="form-vertical" action="${ctx}/system/login" method="post">
        <div class="control-group normal_text"> <h3><img src="${ctx}/static/bootstrap/img/logo.png" alt="Logo" /></h3></div>
        <div class="control-group">
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_lg"><i class="icon-user"></i></span><input type="text" name="username" id="userName" placeholder="Username" />
                </div>
            </div>
        </div>
        <div class="control-group">
            <div class="controls">
                <div class="main_input_box">
                    <span class="add-on bg_ly"><i class="icon-lock"></i></span><input type="password" name="password" id="password" placeholder="Password" />
                </div>
            </div>
        </div>
        <div class="form-actions">
            <%--<span class="pull-left"><a href="#" class="flip-link btn btn-info" id="to-recover">Lost password?</a></span>--%>
            <span class="pull-right"><a type="submit" href="javascript:checkUserForm();" class="btn btn-success">登录</a></span>
        </div>
    </form>
    <%--<form id="recoverform" action="#" class="form-vertical">
        <p class="normal_text">Enter your e-mail address below and we will send you instructions how to recover a password.</p>

        <div class="controls">
            <div class="main_input_box">
                <span class="add-on bg_lo"><i class="icon-envelope"></i></span><input type="text" placeholder="E-mail address" />
            </div>
        </div>

        <div class="form-actions">
            <span class="pull-left"><a href="#" class="flip-link btn btn-success" id="to-login">&laquo; Back to login</a></span>
            <span class="pull-right"><a class="btn btn-info">Reecover</a></span>
        </div>
    </form>--%>
</div>

<%--<script src="${ctx}/static/bootstrap/js/matrix.login.js"></script>--%>
</body>
</html>