<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="/css/bootstrap.min.css" rel="stylesheet">
    <script src="/js/jquery-3.2.1.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <title>${topic.title} - Genesis </title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>
<div style="display:inline-block;width: 70%;margin:1% 2% 1% 5%;">
<div class="panel panel-default" id="main" style="">
    <div class="panel-heading" style="background-color: white">
        <div>
            <div class="panel-heading" style="background-color: white">
                <a href="/">V2Explorer</a> › 主题
            </div>
            <h3 style="color: black;font-weight: bold"><c:if test="${topic.isEssence==1}"><p style="color: #c9302c;display: inline">[ 精品 ]</p> </c:if>${topic.title}</h3><br/>
            <div>
                <div style="float: right;margin-top: -70px" >
                    <img width="50px" height="50px" src="${topic.user.avatar}" class="img-rounded">
                </div>
                <a href="/member/${topic.user.username}"><span ><strong>${topic.user.username}</strong></span></a>&nbsp;&nbsp;
                <small class="text-muted">创建于: ${topic.localCreateTime}&nbsp;&nbsp;&nbsp;</small>&nbsp;&nbsp;
                <small class="text-muted">阅读量: ${topic.click}</small>
                <c:if test="${topic.tabId=='6'&&topic.reward>0}"> <small class="text-muted">悬赏积分: ${topic.reward}</small></c:if>
                <c:if test="${topic.tabId=='6'&&topic.reward==0}"><a><span class="label label-primary">状态:已解决</span></a></c:if>
                <c:if test="${user.type==1}"><a id="deleteTopic" href="/topic/delete/${topic.id}"><p class="btn btn-success btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">删除主题&nbsp;&nbsp;</p></a></c:if>
                <c:if test="${user.type==1}"><a id="cancelEssence" href="/topic/cancelEssence/${topic.id}"><p class="btn btn-info btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">取消精品&nbsp;&nbsp;</p></a></c:if>
                <c:if test="${user.type==1}"><a id="addEssence" href="/topic/addEssence/${topic.id}"><p class="btn btn-danger btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">添加精品&nbsp;&nbsp;</p></a></c:if>
            </div>
        </div>
    </div>

    <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                ${topic.content}
            </li>
    </ul>
</div>

<c:if test="${!empty replies}">
<div class="panel panel-default" id="main" style="">
    <div class="panel-heading" style="background-color: white">
        <span>
                评论数: ${fn:length(replies)}  |  最新评论: <c:forEach items="${replies}" var="reply" varStatus="status">

<c:if test="${status.last}">
    ${reply.localCreateTime}
    </c:if>
    </c:forEach>
    </span>
    </div>

    <ul class="list-group" style="display:block;width: 100%">
        <!-- 遍历评论 -->
        <c:forEach items="${replies}" var="reply">
        <li class="list-group-item">
            <div style="display: inline-block;margin:2px">
                <div style="width: 50px;margin-right:10px;height: 110px;vertical-align:top;display: inline-block;float:left;">
                    <img width="50px" height="50px" src="${reply.user.avatar} " class="img-rounded" >
                    <%--<div style="width: 200px;height: 110px;margin-left: 800px; float: left;font-size: 15px">--%>
                        <%--<c:if test="${topic.tabId==6&&topic.user.username==sessionScope.username&&topic.reward>0}"> <a style="float: left" id="setBestReply" href="/reply/setBestReply/${reply.id}/${topic.id}" >设置为最佳解答</a></c:if>--%>
                    <%--</div>--%>
                </div>
                    <c:if test="${topic.tabId==6&&topic.user.username==sessionScope.username&&topic.reward>0}"> <a style=" margin-left:800px;height:110px;width:200px;float: left;font-size: 15px" id="setBestReply" href="/reply/setBestReply/${reply.id}/${topic.id}" ><p class="btn btn-primary">设置为最佳解答</p></a></c:if>

                <div style="width: 900px;height: 100px;margin-top:2px;display: inline-block">
                    <a href="/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>&nbsp;&nbsp;
                    <small class="text-muted">${reply.localCreateTime}</small>
                    <c:if test="${reply.id==topic.bestReplyID}">
                        <span class="label label-primary">最佳解答</span></c:if>
                    <c:if test="${user.type==1}"><a class="deleteReply" style="margin-right: 5px" href="/reply/delete/${reply.id}/${topic.id}"><p class="btn btn-danger btn-xs" style="text-align:center;display: inline">删除回复</p></a></c:if>
                    <br/>
                    <div>
                        <p>${reply.content}</p>
                    </div>
                </div>
            </div>
        </li>
        </c:forEach>

    </ul>
</div>
</c:if>

<c:if test="${!empty user}">

<div class="panel panel-default" id="main" style="display: block">
    <div class="panel-heading" style="background-color: white">
        添加一条新回复
    </div>
    <div class="panel-body">
        <div class="form-group">
            <form action="/reply/add" method="post">
                <input type="hidden" name="topicId" value="${topic.id}">
                <input type="hidden" name="replyUserId" value="${user.id}">
                <textarea class="form-control" rows="3" name="content" required="required"></textarea><br/>
            <input type="submit" class="btn btn-default btn-sm" value="回复">
            </form>
        </div>

    </div>
</div>
</c:if>

</div>
<div align="center" style="display:block;float: right;margin-right: 30px">
    <!-- 引入侧边栏文件 -->
    <%@ include file="side.jsp"%>
</div>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
<script>
    function submitValidate(flag){
        return flag;
    }
    $("#deleteTopic").click(function () {
        var ifSubmit=confirm("确定删除该主题吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    });
    $("#cancelEssence").click(function () {
        var ifSubmit=confirm("确定把该主题置为普通帖子吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    });
    $("#addEssence").click(function () {
        var ifSubmit=confirm("确定把该主题添加为精品主题吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    });
    $(".deleteReply").click(function () {
        var ifSubmit=confirm("确定删除该回复吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    });
    $("#setBestReply").click(function () {
        var ifSubmit=confirm("确定将该恢复设置为最佳解答吗？设置完之后将不可更改！");
        if(ifSubmit==true){}
        else {return submitValidate(false);
        }

    })
</script>
</body>
</html>