<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Trang đăng nhập</title>
    <link rel="stylesheet" href=".././assets/css/login.css">
</head>
<body>
<form action="/auth/login" method="post">
    <h2>Đăng nhập</h2>
    <div class="container">
        <% String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) { %>
        <div class="error-message" style="color: red"><%= errorMessage %></div>
        <% } %>

        <label><b>Tên đăng nhập</b></label>
        <input type="text" placeholder="Nhập tên đăng nhập" name="username" required>

        <label><b>Mật khẩu</b></label>
        <input type="password" placeholder="Nhập mật khẩu" name="password" required>

        <button type="submit">Đăng nhập</button>
    </div>
</form>
</body>
</html>