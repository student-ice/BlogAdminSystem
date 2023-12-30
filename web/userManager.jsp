<%@ page import="fun.tarrow.entity.User" %>
<%@ page import="java.util.ArrayList" %><%--
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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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
    </div>
</nav>
<!-- 顶部导航栏结束 -->
<!-- 使用iframe ，以切换用户管理页面和博客管理页面 -->
<iframe src="/userManager?method=list" width="100%" height="100%"></iframe>
<script src="./js/bootstrap.bundle.min.js"></script>
<script src="./js/index.js"></script>
</body>

</html>
