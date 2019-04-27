<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>统一认证中心</title>

    <#import "common/common.macro.ftl" as netCommon>
    <@netCommon.commonStyle />
    <link rel="stylesheet" href="${request.contextPath}/static/adminlte/plugins/iCheck/square/blue.css">

</head>
<body class="hold-transition login-page">

    <div class="login-box">
        <div class="login-logo">
            <#--<a><b>XXL</b>SSO</a>-->
        </div>
        <form action="${request.contextPath}/doLogin" onsubmit="checkInput()" method="post">
            <div class="login-box-body">
                <p class="login-box-msg">统一认证中心</p>
                <div class="form-group has-feedback">
                    <input type="text" name="username" class="form-control" placeholder="请输入用户名" maxlength="50" >
                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                </div>
                <div class="form-group has-feedback">
                    <input type="password" id="password" class="form-control" placeholder="请输入密码" maxlength="50" >
                    <input type="hidden" id="password_md5" name="password">
                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                </div>

                <#if errorMsg?exists>
                    <p style="color: red;">${errorMsg}</p>
                </#if>

                <div class="row">
                    <div class="col-xs-8" >
                        <div class="checkbox icheck" style="display:none;">
                            <label>
                                <input type="checkbox" name="ifRemember">记住密码
                            </label>
                        </div>
                    </div><!-- /.col -->
                    <div class="col-xs-4">
                        <input type="hidden" name="redirect_url" value="${redirect_url!''}" />
                        <button type="submit" class="btn btn-primary btn-block btn-flat">登录</button>
                    </div>
                </div>
            </div>
        </form>
    </div>

</body>
<@netCommon.commonScript />
<script src="${request.contextPath}/static/adminlte/plugins/iCheck/icheck.min.js"></script>
<script src="${request.contextPath}/static/js/login.1.js"></script>
<script src="${request.contextPath}/static/js/md5.js"></script>
<script>
    function checkInput() {
        var password_input = document.getElementById('password');
        var password_md5 = document.getElementById('password_md5');
        password_md5.value = md5(password_input.value);
        return true;
    }
</script>
</html>