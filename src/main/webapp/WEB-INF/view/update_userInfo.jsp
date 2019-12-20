<%--
  Created by IntelliJ IDEA.
  User: All Falls Down
  Date: 2019/12/17
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑资料</title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/">V2Explore</a> › 设置 ›修改信息
        </div>

        <div class="panel-body">

            <form  action="/settings/userInfo/update" method="post" class="form-horizontal" role="form">
                <div class="form-group">
                <label class="col-sm-2 control-label">uid</label>
                <div class="col-sm-10">
                <p class="form-control-static">${user.id}</p>
                </div>
                </div>
                <div class="form-group">
                <label class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input class="form-group" name="username" id="username" value="${user.username}">
                    <span style="display: inline-block" id="info">${errorMessage}</span>
                <%--<p class="form-control-static">${user.username}</p>--%>
                </div>
                </div>
                <div class="form-group">
                <label class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input class="form-group" name="email" value="${user.email}">
                <%--<p class="form-control-static">${user.email}</p>--%>
                </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-10">
                        <input class="form-group" name="phone" value="${user.phoneNum}">
                        <%--<p class="form-control-static">${user.email}</p>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">职业</label>
                    <div class="col-sm-10">
                        <input class="form-group" name="job" value="${user.job}">
                        <%--<p class="form-control-static">${user.email}</p>--%>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">工作单位</label>
                    <div class="col-sm-10">
                        <input class="form-group" name="workplace" value="${user.workPlace}">
                        <%--<p class="form-control-static">${user.email}</p>--%>
                    </div>
                </div>
                <input class="btn btn-default" type="submit" value="保存更改">
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
    $("#username").blur(function () {
        var id =$("#username").val();
        $.ajax({
            type: "POST",
            url: "/existUsername",
            data: {
                username:id ,
            },
            dataType: "json",
            success:function (data) {
                if(data == "1"){
                    $("#info").html("提示:用户名已存在!");
                    $("#info").attr("style","color:red");
                }else {
                    $("#info").html("提示:用户名可以使用");
                    $("#info").attr("style","color:green");
                }
            }
        });
    })
</script>
</body>
</html>
