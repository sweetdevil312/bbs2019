<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <title>V2Explore › <c:if test="${!empty userInfo}">${userInfo.username}</c:if><c:if test="${!empty errorInfo}">会员未找到</c:if></title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

<div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/">V2Explore</a> › ${userInfo.username}
        </div>

        <div class="panel-body">
            <c:if test="${!empty userInfo}">
            <form class="form-horizontal" role="form">
                <div style="margin-left: 17%">
                    <img width="60px" height="60px" src="${userInfo.avatar}" class="img-rounded">
                </div><br/>
                <div class="form-group">
                    <label class="col-sm-2 control-label">uid</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.id}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">用户名</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.username}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.email}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">联系方式</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.phoneNum}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">职业</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.job}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">工作单位</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.workPlace}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">注册时间</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.localCreateTime}</p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">积分</label>
                    <div class="col-sm-10">
                        <p class="form-control-static">${user.credit}</p>
                    </div>
                </div>
            </form>
            </c:if>
            <c:if test="${!empty errorInfo}">
                会员未找到!
            </c:if>
        </div>
    </div>
</div>

<div align="center" style="display:block;float: right;margin-right: 30px">
    <!-- 引入侧边栏文件 -->
    <%@ include file="side.jsp"%>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>