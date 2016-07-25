<%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 16-7-21
  Time: 下午3:32
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
    <%--<script src="../js/changeColor.js"></script>--%>
    <link href="../CSS/myCount.css" rel="stylesheet">
    <link href="../CSS/common.css" rel="stylesheet">
    <title>myCount</title>

</head>
<body>

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


<nav class="navbar navbar-default" role="navigation" id="navbar">
    <div class="navbar-header">
        <a class="navbar-brand" href="HandleShow?type=cargo&sign=7">服装</a>
    </div>
    <div class="navbar-header">
        <a class="navbar-brand" href="HandleShow?type=cargo&sign=8">箱包</a>
    </div>
    <div class="navbar-header">
        <a class="navbar-brand" href="HandleShow?type=cargo&sign=10">鞋履</a>
    </div>
    <div class="navbar-header">
        <a class="navbar-brand" href="HandleShow?type=cargo&sign=9">玩物</a>
    </div>
    <div>
        <p class="navbar-text">&nbsp;&nbsp;&nbsp;SHOPPING IN S.M.</p>
    </div>
</nav>

<div class="block"></div>


<div id="custom-content">
    <div class="custom-list">
        <p>我的账户</p>
        <ul class="myTab">
            <li class="active"><a class="on" href="/UserDetial">个人信息</a></li>
            <li><a href="/HandleShow?type=indent&sign=<jsp:getProperty name="userBean" property="id"/>">我的订单</a></li>
            <li class="active"><a href="/HandleShow?type=address&sign=<jsp:getProperty name="userBean" property="id"/>">地址簿</a></li>
        </ul>
    </div>

    <div class="custom-body">
        <div class="custom-head">
            <p name="name">欢迎，<jsp:getProperty name="userBean" property="username"/>（<jsp:getProperty name="userBean" property="realname"/>）</p>
            <button name="quit" value="退出"><a href="/HandleLogout">退出</a></button>
        </div>

        <div class="tab-content">
            <div class="tab-pane fade in active" id="info">
                <p>详细信息</p>
                <ul>
                    <li>电子邮箱地址：<jsp:getProperty name="userBean" property="email"/></li>
                    <li>积分：<jsp:getProperty name="userBean" property="integral"/></li>
                    <li>电话：<jsp:getProperty name="userBean" property="phonenum"/></li>
                </ul>
                <a href="/" value="个人信息">修改个人信息</a>
                <a href="changePassword" value="密码">修改密码</a>
            </div>

        </div>
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