<%@ page import="fun.tarrow.entity.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2023/12/29
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>用户管理</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
</head>

<body style="padding: 10px;">
<!-- 用户管理模块， 使用bootstrap美化 -->
<!-- 搜索模块 -->
<div class="container-fluid">
    <form action="/userManager?method=search" method="post" class="row g-3">
        <div class="col-auto">
            <select class="form-select" name="key">
                <option value="username">用户名</option>
                <option value="telephone">手机号</option>
            </select>
        </div>
        <div class="col-auto">
            <input type="text" name="keyword" class="form-control" placeholder="搜索">
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-3">搜索</button>
        </div>
        <div class="col-auto">
            <button type="button" class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#add">添加用户
            </button>
        </div>
    </form>
</div>
<!-- 数据展示模块 -->
<table class="table">
    <thead>
    <tr>
        <th scope="col">用户ID</th>
        <th scope="col">用户名</th>
        <th scope="col">邮箱</th>
        <th scope="col">手机号</th>
        <th scope="col">性别</th>
        <th scope="col">操作</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<User> users = (List<User>) request.getAttribute("users");
        if (users != null) {
            for (int i = 0; i < users.size(); i++) {
    %>
    <tr>
        <th scope="row" style="vertical-align: middle;"><%= users.get(i).getId() %>
        </th>
        <td style="vertical-align: middle;"><%= users.get(i).getUsername() %>
        </td>
        <td style="vertical-align: middle;"><%= users.get(i).getEmail() %>
        </td>
        <td style="vertical-align: middle;"><%= users.get(i).getTelephone() %>
        </td>
        <td style="vertical-align: middle;"><%= users.get(i).getGender()%>
        </td>
        <td>
            <button type="button" class="btn btn-primary" data-id="" data-bs-toggle="modal" data-bs-target="#update">
                修改
            </button>
            <button type="button" class="btn btn-danger">删除</button>
        </td>
    </tr>
    <% }
    }%>
    </tbody>
</table>


<form method="post" action="/userManager?method=save" class="row g-3">
    <div class="modal fade" id="add" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addLabel">添加用户</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="inputID" class="form-label">ID</label>
                        <input type="text" name="id" class="form-control" id="inputID" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputUsername" class="form-label">用户名</label>
                        <input type="text" name="username" class="form-control" id="inputUsername" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputPassword" class="form-label">密码</label>
                        <input type="password" name="password" class="form-control" id="inputPassword" required>
                    </div>

                    <div class="col-md-12">
                        <label for="inputEmail" class="form-label">邮箱</label>
                        <input type="email" name="email" class="form-control" id="inputEmail" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputTelephone" class="form-label">手机号</label>
                        <input type="text" name="telephone" class="form-control" id="inputTelephone" required>
                    </div>
                    <div class="col-md-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio1"
                                   value="男" checked>
                            <label class="form-check-label" for="inlineRadio1">男</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2"
                                   value="女">
                            <label class="form-check-label" for="inlineRadio2">女</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                    <button type="submit" class="btn btn-primary">提交</button>
                </div>
            </div>
        </div>
    </div>

</form>
<%--修改对话框--%>
<div class="modal fade" id="update" tabindex="-1" aria-labelledby="addLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateLabel">修改用户信息</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form method="post" class="row g-3">
                    <div class="col-md-12">
                        <label for="inputID" class="form-label">ID</label>
                        <input type="text" name="id" class="form-control" id="updateInputID" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputUsername" class="form-label">用户名</label>
                        <input type="text" name="username" class="form-control" id="updateInputUsername" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputPassword" class="form-label">密码</label>
                        <input type="password" name="password" class="form-control" id="updateInputPassword" required>
                    </div>

                    <div class="col-md-12">
                        <label for="inputEmail" class="form-label">邮箱</label>
                        <input type="email" name="email" class="form-control" id="updateInputEmail" required>
                    </div>
                    <div class="col-md-12">
                        <label for="inputTelephone" class="form-label">手机号</label>
                        <input type="text" name="telephone" class="form-control" id="updateInputTelephone" required>
                    </div>
                    <div class="col-md-4">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="updateInlineRadio1"
                                   value="男" checked>
                            <label class="form-check-label" for="inlineRadio1">男</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="updateInlineRadio2"
                                   value="女">
                            <label class="form-check-label" for="inlineRadio2">女</label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                <button type="submit" class="btn btn-primary">提交</button>
            </div>
        </div>
    </div>
</div>

<script src="./js/bootstrap.bundle.min.js"></script>
</body>

</html>
</body>
</html>
