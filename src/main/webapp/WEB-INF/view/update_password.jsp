<%--
  Created by IntelliJ IDEA.
  User: All Falls Down
  Date: 2019/12/18
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page language="java" import="util.ProduceMD5" pageEncoding="UTF-8" %>
<html>
<head>
    <title>修改密码</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/">V2Explore</a> › 设置 ›修改信息
        </div>

        <div class="panel-body">

            <form  action="/settings/changePassword/update" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                    <label class="col-sm-2 control-label">uid</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.id}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">旧密码</label>
                    <div class="col-sm-10">
                        <input class="form-group" type="password" name="oldPassword" id="oldPassword" >
                        &nbsp&nbsp&nbsp&nbsp<span style="display: inline-block" id="info">${errorMessage}</span>
                        <%--<p class="form-control-static">${user.username}</p>--%>
                    </div>

                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">新密码</label>
                    <div class="col-sm-10">
                        <input class="form-group" type="password" name="newPassword" id="newPassword">
                        <%--<p class="form-control-static">${user.email}</p>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">再次输入新密码</label>
                    <div class="col-sm-10">
                        <input class="form-group" type="password" name="reNewPassword" id="reNewPassword">
                        <%--<p class="form-control-static">${user.email}</p>--%>
                        &nbsp&nbsp&nbsp&nbsp<span style="display: inline-block" id="checkPassword"></span>
                    </div>

                </div>
                <input class="btn btn-default" type="submit" id="update" value="保存更改">
            </form>

        </div>

    </div>

</div>
<div align="center" style="display:block;float: right;margin-right: 30px">
    <!-- 引入侧边栏文件 -->
    <%@ include file="side.jsp"%>
</div>
<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
<script>
    $("#oldPassword").blur(function (){
        var oldpassword=$("#oldPassword").val();
        var userID='${user.id}';
        var password={'password':oldpassword,'uid':userID};
        $.ajax({
            url:"/setting/changePassword/judge",
            type: "POST",
            data: password,
            dataType:"json",
            success:function (data) {
                if(data){
                    $("#info").html("提示：密码验证成功!");
                    $("#info").attr("style","color:green");
                    document.getElementById("update").disabled=false;
                }
                else {
                    $("#info").html("提示:输入的旧密码错误!");
                    $("#info").attr("style","color:red");
                    document.getElementById("update").disabled=true;
                }
            },
            error:function () {
                alert("error");
            }

        });
    });
    $("#reNewPassword").blur(function () {
        if($("#newPassword").val()!=$("#reNewPassword").val()){
            $("#checkPassword").html("提示:两次密码输入不一致!");
            $("#checkPassword").attr("style","color:red");
            document.getElementById("update").disabled=true;
        }
        else {
            $("#checkPassword").html("提示:密码可用!");
            $("#checkPassword").attr("style","color:green");
            document.getElementById("update").disabled=false;
        }
    })
</script>
</body>
</html>
