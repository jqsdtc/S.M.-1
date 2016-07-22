<%@ page import="JavaBean.CargoBean" %>
<%@ page import="JavaBean.IndentBean" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: michael
  Date: 16-7-21
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<jsp:useBean id="infoBean" scope="session" class="JavaBean.InfoBean"/>
<jsp:useBean id="userBean" scope="session" class="JavaBean.UserBean"/>
<jsp:useBean id="indentBean" scope="session" class="JavaBean.IndentBean"/>
<%
    if (indentBean == null || indentBean.getIndentUnitBeanList() == null) {
        indentBean = new IndentBean();
        request.getSession().setAttribute("indentBean", indentBean);
        indentBean.setIndentUnitBeanList(new ArrayList<CargoBean>());
        indentBean.setPriceAllCount(0);
        indentBean.setEmpty(true);
    } %>
<jsp:useBean id="cargoBean" scope="session" class="JavaBean.CargoBean" />
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link href="../CSS/bootstrap.min.css" rel="stylesheet">
    <script src="../js/jquery-3.1.0.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery.spinner.js"></script>
    <link rel="stylesheet" href="../CSS/jquery.spinner.css">
    <link href="../CSS/common.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../CSS/goodsCar.css">
    <title>goodsCar</title>
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

<div class="left">
    <div class="carContent">
        <p class="car-head">购物车</p>
        <p>您的就购物车中有<%= indentBean.getIndentUnitBeanList().size() %>件商品</p>
        <% for (int i = 0; i < indentBean.getIndentUnitBeanList().size(); i++) { cargoBean = indentBean.getIndentUnitBeanList().get(i); %>
        <div class="goodNo" id="NO<%= i %>">
            <img src="<%=request.getContextPath() %><jsp:getProperty name="cargoBean" property="image"/>/300px/1.jpg">
            <div class="delete">
                <a href="/HandleDelete?No.=<%= i %>">删除</a>
            </div>
            <div class="goodInfo">
                <p><jsp:getProperty name="cargoBean" property="cargoname"/></p>
                <p>数量：<jsp:getProperty name="cargoBean" property="quantity"/></p>
                <p>总价：￥<%= cargoBean.getQuantity()*cargoBean.getPrice() %>0</p>
            </div>
        </div>
        <% } %>
    </div>

    <% if(indentBean.getIndentUnitBeanList().size() != 0) {%>
    <div class="goodList">
        <div class="listTop">
            <p>购物车</p>
            <% for (int i = 0; i < indentBean.getIndentUnitBeanList().size(); i++) { cargoBean = indentBean.getIndentUnitBeanList().get(i); %>
            <div><p class="l"><jsp:getProperty name="cargoBean" property="cargoname"/></p><p class="r">￥<%= cargoBean.getQuantity()*cargoBean.getPrice() %>0</p></div>
            <% } %>
        </div>
        <div class="listBottom">
            <div><p class="l">总计:</p><p class="r">￥<jsp:getProperty name="indentBean" property="priceAllCount"/>0</p></div>
            <a href="/HandleIndentSettle">去结算</a>
        </div>
    </div>
    <% } %>
</div>

<div id="bottom" class="bottom">
    <ul>
        <li class="logo">S.M.</li>
        <li>客服服务</li>
        <li>联系我们</li>
        <li>网站声明</li>
    </ul>
</div>

<script type="text/javascript">
    $('.spinner').spinner();
</script>
</body>

</html>

