<%@ page import="JavaBean.ShowListBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="JavaBean.CargoBean" %><%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 16-7-21
  Time: 下午3:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="infoBean" scope="session" class="JavaBean.InfoBean"/>
<jsp:useBean id="showListBean" scope="session" class="JavaBean.ShowListBean"/>
<jsp:useBean id="userBean" scope="session" class="JavaBean.UserBean"/>
<jsp:useBean id="indentBean" scope="session" class="JavaBean.IndentBean"/>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link href="../CSS/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/tab.js" type="text/javascript"></script>
    <link href="../CSS/common.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../CSS/goods.css">
    <title>goods</title>
</head>

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

<div id="tool-content">
    <div class="tabbedpanels">
        <img src="../image/sm2.png">
        <p>ShoppingOnline</p>
        <ul class="tabs">
            <li class="on"><a href="/HandleShow?type=cargo&sign=7">服装</a></li>
            <li><a href="/HandleShow?type=cargo&sign=8">箱包</a></li>
            <li><a href="/HandleShow?type=cargo&sign=10">鞋履</a></li>
            <li><a href="/HandleShow?type=cargo&sign=9">玩物</a></li>
        </ul>
    </div>

    <div class="panelContainer">
        <div class="tool-head">
            排序根据：
            <input type="radio" name="sorttype" checked="checked">默认表单
            <input type="radio" name="sorttype">新品到货
            <input type="radio" name="sorttype">价格升序
            <input type="radio" name="sorttype">价格降序
        </div>

        <div class="panel">
            <div class="tools">
                <% for (Object cargoBean: showListBean.getBeanSet()) { %>
                <div>
                    <a href="HandleDetial?type=cargo&ID=<% out.print(((JavaBean.CargoBean)cargoBean).getId()); %>"><img src="<%=request.getContextPath() %><% out.print(((JavaBean.CargoBean)cargoBean).getImage().trim()); %>/300px/1.jpg"></a>
                    <P><% out.print(((JavaBean.CargoBean)cargoBean).getCargoname().trim()); %></p>
                    <p><% out.print(((JavaBean.CargoBean)cargoBean).getPrice()); %>0元</p>
                    <input type="hidden" id="getnum" value="<% out.print(((JavaBean.CargoBean)cargoBean).getSort()); %>">
                </div>
                <% } %>
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
