<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/4/2023
  Time: 9:44 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/student.css">
    <link rel="stylesheet" href="../../../assets/css/add-student-form.css">
    <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
</head>
<body>
    <%@include file="../menu/menu.jsp" %>
    <div class="manHinhChinh">
        <h2>Nhập điểm</h2>
        <h3>${sessionScope.cookie_name}</h3>
        <h4>${sessionScope.cookie_value}</h4>
        <form method="post" action="/home/grade/create-or-edit" enctype="multipart/form-data">
            Vui lòng chọn file:
            <input type="file" name="file" size="60" /><br /><br />
            <label>idDiem</label>
            <input type="text" name="idDiem">
            <label>idGv</label>
            <input type="text" name="idGv">
            <label>idMh</label>
            <input type="text" name="idMh">
            <label>idHk</label>
            <input type="text" name="idHk">

            <input type="submit" value="Upload" />
        </form>
        <script src="../../../assets/js/menu.js"></script>
    </div>


</body>
</html>
