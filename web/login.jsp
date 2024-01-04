<%--
  Created by IntelliJ IDEA.
  User: ice
  Date: 2024/1/4
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>登录</title>
    <link href="./css/bootstrap.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html,
        body {
            width: 100%;
            height: 100%;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #9ec5fe;
        }
    </style>
</head>

<body>

<div class="card" style="width: 350px;">
    <div class="card-body">
        <h2 style="text-align: center;">登录</h2>
        <form action="/loginManager?method=login" method="post">
            <div class="mb-3" style="margin-top: 20px;">
                <label for="username" class="form-label">用户名</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">密码</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <%--用户名或密码错误--%>
            <%
                String msg = (String) request.getAttribute("msg");
                if (msg != null) {
            %>
            <div class="mb-3" style="color: red;">
                <p><%= msg %>
                </p>
            </div>
            <%
                }
            %>
            <div class="d-grid gap-2" style="margin-top: 50px;">
                <button type="submit" class="btn btn-primary">登录</button>
            </div>
        </form>
    </div>
</div>
<script src="./js/bootstrap.bundle.min.js"></script>
</body>

</html>
