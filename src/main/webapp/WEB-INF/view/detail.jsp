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
    <title>${topic.title} - V2Explore </title>
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
            <h3 style="color: black;font-weight: bold"><c:if test="${topic.isSticky==1}"><p style="color: #2e6da4;display: inline">[ 置顶 ]</p> </c:if>
                <c:if test="${topic.isEssence==1}"><p style="color: #c9302c;display: inline">[ 精品 ]</p> </c:if>
                ${topic.title}</h3><br/>
            <div>
                <div style="float: right;margin-top: -70px" >
                    <img width="50px" height="50px" src="${topic.user.avatar}" class="img-rounded">
                </div>
                <a href="/member/${topic.user.username}"><span ><strong>${topic.user.username}</strong></span></a>&nbsp;&nbsp;
                <small class="text-muted">创建于: ${topic.localCreateTime}&nbsp;&nbsp;&nbsp;</small>&nbsp;&nbsp;
                <small class="text-muted">阅读量: ${topic.click}</small>
                <c:if test="${user.type==1}">
                    <a id="deleteTopic" href="/topic/delete/${topic.id}">
                        <p class="btn btn-success btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">删除主题&nbsp;&nbsp;</p></a>
                </c:if>
                <c:if test="${user.type==1}">
                    <a id="cancelEssence" href="/topic/cancelEssence/${topic.id}">
                        <p class="btn btn-info btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">取消精品&nbsp;&nbsp;</p></a>
                </c:if>
                <c:if test="${user.type==1}">
                    <a id="addEssence" href="/topic/addEssence/${topic.id}">
                        <p class="btn btn-danger btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">添加精品&nbsp;&nbsp;</p></a>
                </c:if>
                <c:if test="${user.type==1}">
                    <a id="cancelSticky" href="/topic/cancelSticky/${topic.id}">
                        <p class="btn btn-info btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">取消置顶&nbsp;&nbsp;</p></a>
                </c:if>
                <c:if test="${user.type==1}">
                    <a id="addSticky" href="/topic/addSticky/${topic.id}">
                        <p class="btn btn-warning btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">添加置顶&nbsp;&nbsp;</p></a>
                </c:if>
                <c:if test="${(user.type==1)||(user.id==topic.userId)}">
                    <a data-toggle="modal" data-target="#myModal">
                        <p class="btn btn-primary btn-xs" style="margin-left:5px;text-align:center;float:right;display: inline">修改主题&nbsp;&nbsp;</p></a>
                </c:if>
            </div>
        </div>


    </div>

    <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                ${topic.content}
            </li>
    </ul>
</div>
    <!-- 修改主题 使用模态窗口-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        修改主题内容
                    </h4>
                </div>
                <div class="modal-body">
                        <form action="/topic/update/${topic.id}" method="post">
                            <div class="form-group">
                                <label for="title">主题标题</label>
                                <input type="text" class="form-control" id="title" name="title" value="${topic.title}" required="required">
                            </div>
                            <div class="form-group">
                                <label for="content">正文</label>
                                <textarea class="form-control" rows="10" id="content" name="content">
                                    ${topic.content}
                                </textarea>
                            </div>
                            <div class="form-group">
                                <label for="tab">板块</label><br/>
                                <div class="col-sm-10" style="width: 40%">
                                    <select class="form-control" id="tab" name="tab">
                                        <c:forEach items="${tabs}" var="tab">
                                            <option value="${tab.id}">${tab.tabName}</option>
                                        </c:forEach>
                                    </select>
                                </div><br>
                            </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消修改
                    </button>
                    <input type="submit" class="btn btn-primary" value="提交更改">
                    </form>
                </div>
            </div>
        </div>
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
                <div style="width: 50px;margin-right:10px;height: 110px;vertical-align:top;display: inline-block">
                    <img width="50px" height="50px" src="${reply.user.avatar} " class="img-rounded">
                </div>
                <div style="width: 900px;height: 100px;margin-top:2px;display: inline-block">
                    <a href="/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>&nbsp;&nbsp;
                    <small class="text-muted">${reply.localCreateTime}</small>
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
    })
    $("#cancelEssence").click(function () {
        var ifSubmit=confirm("确定把该主题置为普通帖子吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    })
    $("#addEssence").click(function () {
        var ifSubmit=confirm("确定把该主题添加为精品主题吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    })
    $("#cancelSticky").click(function () {
        var ifSubmit=confirm("确定把该主题取消置顶吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    })
    $("#addSticky").click(function () {
        var ifSubmit=confirm("确定把该主题置顶吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    })
    $(".deleteReply").click(function () {
        var ifSubmit=confirm("确定删除该回复吗?");
        if (ifSubmit == true){

        }else {
            return submitValidate(false);
        }
    })
</script>
</body>
</html>