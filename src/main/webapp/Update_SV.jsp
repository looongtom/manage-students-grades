<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 3/18/2023
  Time: 10:35 PM
  To change this template use File | Settings | File Templates.
--%>
<meta charset="UTF-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cập nhật thông sinh viên</title>
</head>
<body>
<%
    String id_sv=request.getParameter("id_sv");
    String ten_sv=request.getParameter("ten_sv");
    String email_sv=request.getParameter("email_sv");
    String dob_sv=request.getParameter("dob_sv");
    String gender_sv=request.getParameter("gender_sv");
    String phone_sv=request.getParameter("phone_sv");
    String lop_hanh_chinh_sv=request.getParameter("lop_hanh_chinh_sv");
    // chuyển tên về tiếng việt
    byte[] bytes = ten_sv.getBytes("ISO-8859-1");
    String output = new String(bytes, "UTF-8");
%>
<tr>
    <td >
        <form method ="post" action="Update_SV" style="display: inline;" >
        <p>Tên sinh viên:</p>
        <input type="text" name="ten_sv" placeholder="<%=output%>" >
        <br>
        <p>Email sinh viên:</p>
        <input type="text" name="last_name"  placeholder=<%=email_sv%>>
        <br>
        <p>Ngày sinh sinh viên:</p>
        <input type="text" name="age"  placeholder=<%=dob_sv%>>
        <br>
        <p>Giới tính sinh viên:</p>
        <input type="text" name="address"  placeholder=<%=gender_sv%>>
        <br>
            <p>Số điện thoại sinh viên:</p>
            <input type="text" name="address"  placeholder=<%=phone_sv%>>
            <br>
            <p>Lớp hành chính của sinh viên:</p>
            <input type="text" name="address"  placeholder=<%=lop_hanh_chinh_sv%>>
            <br>

        <input type="hidden" name="staff_id"  placeholder=<%=id_sv%>>
        <br>
        <input type="submit" value="Edit"/>
    </form>
    </td>
    <form action="List_SV.jsp" style="display: inline;">
        <input type="submit" value="Cancel" />
    </form>

</tr>

</body>
</html>
