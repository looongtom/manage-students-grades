<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang đăng nhập</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        form {
            background-color: white;
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-top: 0px;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        @media screen and (max-width: 600px) {
            form {
                margin-top: 15%;
                margin-bottom: 15%;
                width: 80%;
            }
        }
    </style>
</head>
<body>
<%--<form action="Login" method="post">--%>
<%--    Tên đăng nhập: <input type="text" name = "user"><br>--%>
<%--    Mật khẩu: <input type="password" name="pass"><br>--%>
<%--    <input type="submit" value="Đăng nhập">--%>
<%--</form>--%>

<form  action="Login" method="post">
    <h2>Đăng nhập</h2>
    <div class="container">
        <label ><b>Tên đăng nhập</b></label>
        <input type="text" placeholder="Nhập tên đăng nhập" name="user" required>

        <label><b>Mật khẩu</b></label>
        <input type="password" placeholder="Nhập mật khẩu" name="pass" required>

        <input type="submit" value="Đăng nhập">
    </div>
</form>
</body>
</html>