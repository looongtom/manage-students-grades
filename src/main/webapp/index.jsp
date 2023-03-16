<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang đăng nhập</title>
    <link rel="stylesheet" href="./assets/css/login.css">
</head>
<body>
<!-- <%--<form action="Login" method="post">--%>
<%--    Tên đăng nhập: <input type="text" name = "user"><br>--%>
<%--    Mật khẩu: <input type="password" name="pass"><br>--%>
<%--    <input type="submit" value="Đăng nhập">--%>
<%--</form>--%> -->

<form action="Login" method="post">
    <h2>Đăng nhập</h2>
    <div class="container">
        <label><b>Tên đăng nhập</b></label>
        <input type="text" placeholder="Nhập tên đăng nhập" name="user" required>
        
        <label><b>Mật khẩu</b></label>
        <input type="password" placeholder="Nhập mật khẩu" name="pass" required>

        <button type="submit">Đăng nhập</button>
    </div>
</form>
</body>
</html>