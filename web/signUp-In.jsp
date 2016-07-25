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
    <link href="../CSS/common.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../CSS/r&l.css">
    <title>r&l</title>

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

<div id="login-head" class="login-head">
    <h3>还未登录？/没有账户？</h3>
    <h4>现在注册&nbsp;即享会员专属服务。&nbsp;您可以：</h4>
    <ul>
        <li><img src="../image/heart.png"><p>收藏您喜欢的商品</p></li>
        <li><img src="../image/grade.png"><p>享受豪华会员积分系统</p></li>
        <li><img src="../image/card.png"><p>实现更便捷的支付流程</p></li>
        <li><img src="../image/right.png"><p>管理您的订单和退货</p></li>
    </ul>
</div>

<div>
    <div id="login-content" class="login-content">
        <h3>
            <jsp:getProperty name="infoBean" property="info"/>
        </h3>
        <h4>我的账户：</h4>
        <div>
            <form action="/HandleLogin" method="post" >
                <p>输入您的用户名及密码登录”我的账户“</p>
                <h5>用户名：</h5>
                <input type="text" name="E-address">
                <h5>密码：</h5>
                <input type="text" name="password">
                <%--<p><a href="">您忘记了密码？</a></p>--%>
                <button name="login" value="登录">登录</button>
            </form>
        </div>
    </div>

    <div id="register-content" class="register-content">
        <h4>立即注册：</h4>
        <div>
            <form action="HandleSignup" method="post">
                <h5>*必填项</h5>
                <h5>用户名*：</h5>
                <input type="text" name="username">
                <h5>电话号码*：</h5>
                <input type="text" name="phonenum">
                <h5>电子邮箱地址*：</h5>
                <input type="text" name="email">
                <h5>真实姓名*：</h5>
                <input type="text" name="realname">
                <h5>密码（6～15）位*：</h5>
                <input type="password" name="password">
                <h5>确认密码*：</h5>
                <input type="password" name="password-check">
                <button name="register" value="注册">注册</button>
            </form>
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