<%@ page import="fun.tarrow.entity.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.mysql.cj.Session" %><%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2023/12/28
  Time: 下午8:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理后台</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <style>
        html,
        body {
            height: 100%;
        }
    </style>
</head>

<body>
<!-- 顶部导航栏 -->
<nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">管理后台</a>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" href="javascript:void(0)" onclick="change('userManager')">用户管理</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="javascript:void(0)" onclick="change('blogManager')">博客管理</a>
                </li>
            </ul>
        </div>
        <%-- 最右侧显示用户名和退出登录 --%>
        <%
            // 检查用户是否已登录，这里假设已登录的条件是用户的登录状态存储在session中
            String username = null;
            if (session.getAttribute("username") != null) {
                username = session.getAttribute("username").toString();
            }
            if (username != null) {
        %>
        <div class="btn-group">
            <div class="dropdown" style="margin-right: 20px;">
                <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                    <%=username%>
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton"  style="min-width: 92px;">
                    <li  style="width: 92px;"><a class="dropdown-item" href="/loginManager?method=logout">退出登录</a></li>
                </ul>
            </div>
        </div>
        <%
            } else {
                // 如果未登录，重定向到登录页面
                response.sendRedirect("/login.jsp");
            }
        %>
    </div>
</nav>
<!-- 顶部导航栏结束 -->
<!-- 使用iframe ，以切换用户管理页面和博客管理页面 -->
<iframe src="/userManager?method=list" width="100%" height="100%" style="padding-top: 56px;"></iframe>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/index.js"></script>
</body>

</html>
