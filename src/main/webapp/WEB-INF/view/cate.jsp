 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type"  content="text/html;charset=utf-8">
    <meta name="keywords" content="V2Explore,论坛,社区,程序员">
    <title>V2Explore - 一个分享创造的开发者社区  </title>
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <style>
        li {list-style-type:none;}
        /*html, body {*/
            /*height: 100%;*/
            /*font-size: 14px;*/
            /*color: #525252;*/
            /*font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;*/
            /*background: #f0f2f5;*/
        /*}*/
        body{
            /*background:black;*/
        }
        .footer {
            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 200px;
            border: 1px ;
            clear:both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            width: 40%;
            float: left;
        }

        .info {
            margin-right: 5%;
            width: 10%;
            float: left;
        }

        a{
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>
<div style="display: inline-block;width: 70%">
<div class="panel panel-success" id="main" style="width: 100%;margin:1% 2% 5% 5%;float: left;">
    <ul class="nav nav-tabs" style="background:lightgray;">
        <li><a style="color: black" href="/topic/active">活跃</a></li>
        <li><a style="color: black" href="/topic/essence">精华</a></li>
        <li><a style="color: black" href="/topic/recent">最近</a></li>
    </ul>

<ul class="list-group" style="width: 100%">
    <c:forEach items="${topics}" var="topic">
    <li class="list-group-item">
        <div style="height: 50px">
            <div style="float: left;width: 6%;margin-bottom: 5px">
                <img width="50px" height="50px" src="${topic.user.avatar}" class="img-rounded">
            </div>
            <div style="width: 89%;float: left">
                <a style="color: black;font-weight: normal;" href="/t/${topic.id}"><c:if test="${topic.isEssence==1}"><p style="color: #c9302c;display: inline">[ 精品 ]</p></c:if>${topic.title}</a><br/>
                <div>
                    <a><span class="label label-default" >${topic.tab.tabName}</span></a>&nbsp;&nbsp;&nbsp;
                    <c:if test="${topic.tab.tabName=='需求'&&topic.reward==0}"><a><span class="label label-primary">已解决</span></a></c:if>
                    <a href="/member/${topic.user.username}"><span ><strong>${topic.user.username}</strong></span></a>&nbsp;&nbsp;&nbsp;
                    <small class="text-muted">创建于: ${topic.localCreateTime}</small>
                    <small class="text-muted" style="float: right">最新回复: ${topic.localUpdateTime}</small>
                    <c:if test="${topic.tab.tabName=='需求'&&topic.reward>0}"> <small class="text-muted">悬赏积分: ${topic.reward}</small></c:if>
                </div>
            </div>
            <div style="width: 5%;float: right;text-align: center">
                <span class="badge">${topic.countReplies}</span>
            </div>
        </div>
    </li>
    </c:forEach>

</ul>
</div>
<div class="pageDiv" align="center" style="display:block;">
    <%@include file="../view/page.jsp" %>
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