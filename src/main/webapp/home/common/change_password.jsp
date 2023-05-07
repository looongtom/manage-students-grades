<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <%@include file="../admin/menu/admin_menu_header.jsp" %>
    <link rel="stylesheet" href="../../assets/css/change_password.css">
    <link rel="stylesheet" href="../../assets/themify-icons/themify-icons.css">
    <title>Đổi mật khẩu</title>

</head>
<body>
<c:choose>
    <c:when test="${sessionScope.ACCOUNT.roleId == 1}">
        <%@include file="../admin/menu/admin_menu_header.jsp" %>
    </c:when>
    <c:when test="${sessionScope.ACCOUNT.roleId == 2}">
        <%@include file="../user/menu/user_menu_header.jsp" %>
    </c:when>
</c:choose>
<c:choose>
    <c:when test="${sessionScope.ACCOUNT.roleId == 1}">
        <%@include file="../admin/menu/admin_menu.jsp" %>
    </c:when>
    <c:when test="${sessionScope.ACCOUNT.roleId == 2}">
        <%@include file="../user/menu/user_menu.jsp" %>
    </c:when>
</c:choose>

<div class="manHinhChinh">
    <h1 class="tieuDeTrang">Đổi mật khẩu</h1>
    <div class="container">
        <form action="/action_page.php">
            <div class="row">
                <div class="col-25">
                    <label >Mật khẩu cũ</label>
                </div>
                <div class="col-75">
                    <input type="text"  placeholder="">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label >Mật khẩu mới</label>
                </div>
                <div class="col-75">
                    <input type="text"  placeholder="">
                </div>
            </div>
            <div class="row">
                <div class="col-25">
                    <label >Nhập lại mật khẩu</label>
                </div>
                <div class="col-75">
                    <input type="text"  placeholder="">
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-25">
                    <button class="btn" type="submit" value="Submit">Đổi mật khẩu</button>
                </div>
                <!-- <input class="btn" type="submit" value="Submit"> -->
            </div>

        </form>
    </div>

</div>
</body>
<script src="../../assets/js/menu.js"></script>
</html>
