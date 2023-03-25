<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="com.example.quanlysv.Connection.ConnectPostgreSql" %>
<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 3/18/2023
  Time: 12:09 AM
  To change this template use File | Settings | File Templates.
--%>
<meta charset="UTF-8">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sinh viên</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Mã SV</th>
        <th>Họ và tên</th>
        <th>Email</th>
        <th>Ngày sinh</th>
        <th>Giới tính</th>
        <th>Số điện thoại</th>
        <th>Lớp hành chính</th>
        <th>Action</th>
    </tr>
    <%
        try{
            ConnectPostgreSql.ConnectDatabase();
            Statement st=ConnectPostgreSql.Conn.createStatement();
            String str="SELECT * FROM sinhvien ORDER BY id_sv ASC ";
            ResultSet rs=st.executeQuery(str);
            while(rs.next()){
    %>
        <tr>
        <td><%=rs.getString("id_sv")%></td>
        <td><%=rs.getString("ten_sv")%></td>
        <td><%=rs.getString("email_sv")%></td>
        <td><%=rs.getString("dob_sv")%></td>
        <td><%=rs.getString("gender_sv")%></td>
        <td><%=rs.getString("phone_sv")%></td>
        <td><%=rs.getString("lop_hanh_chinh_sv")%></td>
        <td >
            <form action="Delete_SV" method="post" style="display: inline;">
                <input type="hidden" name="id_sv" value=<%=rs.getString("id_sv")%>>
                <input  type="submit" value=" Delete " />
            </form>

            <form action="Update_SV.jsp"  method ="post"  style="display: inline;">
                <input type="hidden" name="id_sv" value=<%=rs.getString("id_sv")%>>
                <input type="hidden" name="ten_sv" value="<%=rs.getString("ten_sv")%>">
                <input type="hidden" name="email_sv" value=<%=rs.getString("email_sv")%>>
                <input type="hidden" name="dob_sv" value=<%=rs.getString("dob_sv")%>>
                <input type="hidden" name="gender_sv" value=<%=rs.getString("gender_sv")%>>
                <input type="hidden" name="phone_sv" value=<%=rs.getString("phone_sv")%>>
                <input type="hidden" name="lop_hanh_chinh_sv" value=<%=rs.getString("lop_hanh_chinh_sv")%>>
                <input type="submit" value=" Edit "/>
            </form>
        </td>
    </tr>

    <%
            }
    }catch (Exception e){

    }
    %>
</table>
<form action="Form_SV.jsp" style="display: inline;">
    <input type="submit" value="Thêm sinh viên">
</form>
</body>
</html>