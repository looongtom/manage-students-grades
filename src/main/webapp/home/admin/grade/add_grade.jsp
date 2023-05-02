<%@ page import="java.util.Random" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/add_grade.css">
    <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
    <title>Nhập điểm</title>
</head>
<body>
    <%@include file="../menu/menu.jsp" %>
    <div class="manHinhChinh">

        <%
            String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            int length = 8; // Change this to set the length of the generated ID
            StringBuilder idBuilder = new StringBuilder();
            Random random = new Random();

            for (int i = 0; i < length; i++) {
                int index = random.nextInt(alphabet.length());
                char randomChar = alphabet.charAt(index);
                idBuilder.append(randomChar);
            }

            String randomID = "Diem_"+idBuilder.toString();
        %>

        <!-- Use the generated ID wherever you need it -->
        <input type="text" name="idDiem" value="<%= randomID %>" />

        <h1 class="tieuDeTrang">Nhập điểm</h1>
        <div class="khuVucNhapDiem">
            <div class="khuVucNhapDiem-dau">
                <div class="khuVucNhapDiem-dau-tieuDe">Thông tin nhập điểm</div>
            </div>
            <div class="khuVucNhapDiem-phanThan">
                <form method="post" action="/home/grade/create-or-edit" enctype="multipart/form-data">
                    <div class="phanThongTin">
                        <div class="cot">
                            <div class="hang">
                                <label for="" class="nhanModal">Học kỳ</label>
                                <select id="hoc-ky" class="nhapModal" required>
                                    <option value="">Please select</option>
<%--                                    <option value="Class A">Học kì 1 năm 2020-2021</option>--%>
<%--                                    <option value="Class B">Học kì 2 năm 2020-2021</option>--%>
                                    <%
                                        try{
                                            Class.forName("org.postgresql.Driver");
                                            Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/quanlysinhvien",
                                                    "postgres","tr1nhtu@n");
                                            Statement st=con.createStatement();
                                            String str="select * from hocky ";
                                            ResultSet rs=st.executeQuery(str);
                                            while(rs.next()){
                                    %>
                                    <option><%=rs.getString("ten_hoc_ky")%></option>
                                    <%--                                    <option value="Class A">Trần Quang Minh</option>--%>
                                    <%--                                    <option value="Class B">Trịnh Minh Tuấn</option>--%>
                                    <% }

                                    }catch (Exception e){

                                    }
                                    %>
                                </select>
                            </div>

                            <div class="hang">
                                <label for="" class="nhanModal">Giảng viên</label>

                                <select id="giang-vien" class="nhapModal" required>
                                    <option value="">Please select</option>
                                    <%
                                        try{
                                            Class.forName("org.postgresql.Driver");
                                            Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/quanlysinhvien",
                                                    "postgres","tr1nhtu@n");
                                            Statement st=con.createStatement();
                                            String str="select * from giangvien ";
                                            ResultSet rs=st.executeQuery(str);
                                            while(rs.next()){
                                    %>
                                    <option><%=rs.getString("ten_gv")%></option>
<%--                                    <option value="Class A">Trần Quang Minh</option>--%>
<%--                                    <option value="Class B">Trịnh Minh Tuấn</option>--%>
                                    <% }

                                    }catch (Exception e){

                                    }
                                    %>
                                </select>

                            </div>
                        </div>

                        <div class="cot">
                            <div class="hang">
                                <label for="" class="nhanModal">Môn học</label>
                                <select id="mon-hoc" class="nhapModal" required>
                                    <option value="">Please select</option>
<%--                                    <option value="Class A">Lập trình Web</option>--%>
<%--                                    <option value="Class B">Cơ sở dữ liệu phân tán</option>--%>
                                    <%
                                        try{
                                            Class.forName("org.postgresql.Driver");
                                            Connection con= DriverManager.getConnection("jdbc:postgresql://localhost:5432/quanlysinhvien",
                                                    "postgres","tr1nhtu@n");
                                            Statement st=con.createStatement();
                                            String str="select * from monhoc ";
                                            ResultSet rs=st.executeQuery(str);
                                            while(rs.next()){
                                    %>
                                    <option><%=rs.getString("ten_mon_hoc")%></option>
                                    <%--                                    <option value="Class A">Trần Quang Minh</option>--%>
                                    <%--                                    <option value="Class B">Trịnh Minh Tuấn</option>--%>
                                    <% }

                                    }catch (Exception e){

                                    }
                                    %>
                                </select>
                            </div>
                            <div class="hang" style="display: none;">
                                <label for="" class="nhanModal">Mã điểm</label>
                                <input type="text" name="idDiem" class="nhapModal">
                            </div>
                        </div>
                    </div>

                    <div class="cacNut">
                        <input class="nutChonFile" type="file" name="file" size="60" />
                        <input class="nutNhapDiem" type="submit" value="Nhập điểm" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/auto_generate_id.js"></script>
</html>
