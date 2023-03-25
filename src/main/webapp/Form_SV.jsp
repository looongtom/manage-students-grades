<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 2/19/2023
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Sinh viên</title>
</head>
<body>
<h1>    Danh sách Sinh viên</h1>
<br>
<br>
<form action="Add_SV" method="post" style="display: inline;">
  <l>Mã sinh viên:</l>
  <input type="text" name="id_sv" >
  <br/>

  <l>Họ và tên:</l>
  <input type="text" name="ten_sv" lang="vi">
  <br/>

  <l>Email:</l>
  <input type="text" name="email_sv" >
  <br/>

  <l>Ngày sinh:</l>
  <input type="text" name="dob_sv" >

  <l>Giới tính:</l>
  <input type="text" name="gender_sv" lang="vi" >

  <l>Số điện thoại:</l>
  <input type="text" name="phone_sv" >

  <l>Lớp hành chính:</l>
  <input type="text" name="lop_hanh_chinh_sv" >

  <br/><br/><br/>
  <input type="submit" value="Save" />
</form>

<form action="List_SV.jsp" style="display: inline;">
  <input type="submit" value="Cancel" />
</form>
</body>
</html>