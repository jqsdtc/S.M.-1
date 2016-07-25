<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 16-7-21
  Time: 下午3:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<jsp:useBean id="infoBean" scope="session" class="JavaBean.InfoBean"/>
<jsp:useBean id="userBean" scope="session" class="JavaBean.UserBean"/>
<jsp:useBean id="indentBean" scope="session" class="JavaBean.IndentBean"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link href="../CSS/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <link href="../CSS/common.css" rel="stylesheet">
    <title>respond</title>
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

<div class="jumbotron" style="height:400px;">
    <div class="container" style="text-align:center">
        <h1 style="margin-bottom:50px;">Sorry!</h1>
        <p style="margin-bottom:50px;">Here's some problem.<br />
        <jsp:getProperty name="infoBean" property="info"/></p>
        <p><a class="btn btn-primary btn-lg" role="button">return</a>
        </p>
    </div>
</div>

<div id="bottom" class="bottom">
    <ul>
        <li class="logo">S.M.</li>
        <li>客服服务</li>
        <li>联系我们</li>
        <li>网站声明</li>
    </ul>
</div>
</body>

</html>
