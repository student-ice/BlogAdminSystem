<%@ page import="fun.tarrow.entity.Blog" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2023/12/30
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>博客管理</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <script src="./js/jquery-3.7.1.min.js"></script>
</head>
<body style="padding: 10px;">
<!-- 博客管理模块， 使用bootstrap美化 -->
<!-- 搜索模块 -->
<div class="container-fluid">
    <form action="/blogManager?method=search" method="post" class="row g-3">
        <div class="col-auto">
            <select class="form-select" name="key">
                <option value="title">博客名</option>
                <option value="status">状态</option>
            </select>
        </div>
        <div class="col-auto">
            <input type="text" name="keyword" class="form-control" placeholder="搜索">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-3">搜索</button>
        </div>
    </form>
</div>
<!-- 数据展示模块 -->
<table class="table">
    <thead>
    <tr>
        <th scope="col">博客ID</th>
        <th scope="col">博客</th>
        <th scope="col">作者</th>
        <th scope="col">状态</th>
        <th scope="col">浏览量</th>
        <th scope="col">评论数量</th>
        <th scope="col">创建时间</th>
        <th scope="col">更新时间</th>
        <th scope="col">操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Blog> blogs = (List<Blog>) request.getAttribute("blogs");
        if (blogs != null) {
            for (int i = 0; i < blogs.size(); i++) {
    %>
    <tr>
        <th scope="row" style="vertical-align: middle;"><%= blogs.get(i).getId() %>
        </th>
        <td style="vertical-align: middle;"><%= blogs.get(i).getTitle() %>
        </td>
        <td style="vertical-align: middle;"><%= blogs.get(i).getAuthorName() %>
        </td>
        <td style="vertical-align: middle;"><%= blogs.get(i).getStatus() %>
        </td>
        <td style="vertical-align: middle;"><%= blogs.get(i).getViewCount()%>
        </td>
        <td style="vertical-align: middle;"><%= blogs.get(i).getCommentCount()%>
        </td>
        <td style="vertical-align: middle;"><%= blogs.get(i).getCreateTime()%>
        </td>
        <td style="vertical-align: middle;"><%= blogs.get(i).getUpdateTime()%>
        </td>
        <td>
            <button type="button" class="btn btn-danger" data-id="<%= blogs.get(i).getId()%>" data-bs-toggle="modal" data-bs-target="#delete">删除</button>
        </td>
    </tr>
    <% }
    }%>
    </tbody>
</table>

<%--删除对话框--%>
<form action="/blogManager?method=delete" method="post" class="row g-3">
    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">删除博客</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <label class="delete-label"></label>
                    <input type="hidden" name="id" placeholder="" class="form-control" id="deleteIdInput">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">删除</button>
                </div>
            </div>
        </div>
    </div>
</form>
<script src="./js/blog.js"></script>
<script src="./js/bootstrap.bundle.min.js"></script>
</body>
</html>
