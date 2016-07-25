<%--
  Created by IntelliJ IDEA.
  User: stupidog
  Date: 16-7-13
  Time: 下午4:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="userBean" scope="session" class="JavaBean.UserBean"/>
<jsp:useBean id="indentBean" scope="session" class="JavaBean.IndentBean"/>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <link href="../CSS/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../CSS/common.css" rel="stylesheet">
    <title>home</title>

</head>
<body>

<% if (userBean == null || !userBean.isState()) { %>
<div class="nav-bar" id="nav-bar">
    <ul id="nav-tabs">
        <li class="sigh">
            <a href="/index.jsp"><img src="../image/homepage.jpg"></a>
        </li>
        <li>
            <a href=""><img src="../image/05.png">&nbsp;&nbsp;0</a>
        </li>
        <li><a href="/signup.jsp">注册</a></li>
        <li><a href="/login.jsp">登录</a></li>
    </ul>
</div>
<% } else { %>
<div class="nav-bar" id="nav-bar">
    <ul id="nav-tabs">
        <li class="sigh"><a href="/index.jsp"><img src="../image/homepage.jpg"></a></li>
        <% if (indentBean.getIndentUnitBeanList() != null) { %>
        <li><a href="/HandleShoppingCart?quantity=0"><img src="../image/05.png">&nbsp;&nbsp;<%=indentBean.getIndentUnitBeanList().size()%></a></li>
        <% } else { %>
        <li><a href="/HandleShoppingCart?quantity=0"><img src="../image/05.png">&nbsp;&nbsp;0</a></li>
        <% } %>
        <li class="custom"><a href="/UserDetial" name="name">欢迎用户：<jsp:getProperty name="userBean" property="username"></jsp:getProperty></a></li>
    </ul>
</div>
<% } %>


<nav class="navbar navbar-default" role="navigation" id="navbar">
    <div class="navbar-header">
        <a class="navbar-brand" href="/HandleShow?type=cargo&sign=7">服装</a>
    </div>
    <div class="navbar-header">
        <a class="navbar-brand" href="/HandleShow?type=cargo&sign=8">箱包</a>
    </div>
    <div class="navbar-header">
        <a class="navbar-brand" href="/HandleShow?type=cargo&sign=10">鞋履</a>
    </div>
    <div class="navbar-header">
        <a class="navbar-brand" href="/HandleShow?type=cargo&sign=9">玩物</a>
    </div>
    <div>
        <p class="navbar-text">&nbsp;&nbsp;&nbsp;SHOPPING IN S.M.</p>
    </div>
</nav>

<div class="block"></div>


<div id="myCarousel" class="carousel slide">
    <!-- 轮播（Carousel）指标 -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner">
        <div class="item active"><a href="/HandleDetial?type=cargo&ID=10">
            <img src="../image/home/600px/1.jpg"></a>
        </div>
        <div class="item"><a href="/HandleDetial?type=cargo&ID=8">
            <img src="../image/home/600px/2.jpg"></a>
        </div>
        <div class="item"><a href="/HandleDetial?type=cargo&ID=7">
            <img src="../image/home/600px/3.jpg"></a>
        </div>
    </div>
    <!-- 轮播（Carousel）导航 -->
    <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
</div>

<div id="bottom" class="bottom" style="border-bottom:2px #000 solid;height:51px; padding-top:10px;" >
    <ul>
        <li class="logo" style="line-height:30px;">S.M.</li>
        <li style="line-height:30px;">客服服务</li>
        <li style="line-height:30px;">联系我们</li>
        <li style="line-height:30px;">网站声明</li>
    </ul>
</div>

</body>
</html>