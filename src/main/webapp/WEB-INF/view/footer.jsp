<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
            background: #f0f2f5;
        }
        .footer {
            background-color: #fff;
            margin-top: 100px;
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
<footer class="footer">
    <div class="container">
        V2Explore是一个有趣的社区，欢迎大家在此分享见解
        <br/><br/><br/>
        <p>Designed by </span> WCCN</p>
    </div>
    <div class="info">
        <p style="text-align: center;font-size: 16px;">统计信息</p>
        <ul >
            <li>总访问量: ${visitorNum}</li>
            <li>今日访问量: ${todayVisitor}</li>
            <li>会员数: ${usersNum}</li>
            <li>话题数: ${topicsNum}</li>
        </ul>
    </div>
    <div class="info">
        <p style="text-align: center;font-size: 16px;">友情链接</p>
        <ul >
            <li><a href="https://github.com/">Github</a></li>
            <li><a href="https://bbs.csdn.net/home">CSDN</a></li>
            <li><a href="https://www.v2ex.com/">V2EX</a></li>
        </ul>
    </div>
    <div class="info" >
        <p style="text-align: center;font-size: 16px;">其他信息</p>
        <ul >
            <li><a href="">关于本站</a></li>
            <li><a href="">联系我们</a></li>
        </ul>
    </div>
</footer>
</body>
</html>