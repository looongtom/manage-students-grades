<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.net.*,java.sql.*" %>
<%@ page import="java.util.ResourceBundle" %>
<%@ page import="org.json.*" %>
<html>
<head>
    <%@include file="../menu/admin_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/teacher.css">
    <link rel="stylesheet" href="../../../assets/css/add_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/update_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/css/confirm_delete_form.css">
    <title>Giảng viên</title>
</head>
<body>
<%@include file="../menu/admin_menu.jsp" %>
<div class="manHinhChinh">
    <%
        ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
        String dBUrl = resourceBundle.getString("url");
        String username = resourceBundle.getString("username");
        String password = resourceBundle.getString("password");
        String driver=resourceBundle.getString("driverName");
    %>
    <h1 class="tieuDeTrang">Danh sách giảng viên</h1>
    <div class="themVaTimKiem">
        <!-- nut them giang vien -->
        <button id="nut_them_GV" onclick="showModal('modal_giang_vien')" class="nutThemGV js-nutThemGV"
                type="button">
            <span class="nutThemGV_tieuDe">Thêm giảng viên</span>
            <i class="fa-solid fa-plus"></i>
        </button>
        <div class="timKiem">
            <div class="tieuDeTimKiem">Tìm kiếm giảng viên: </div>
            <input type="search" class="nhapTimKiem" placeholder="Nhập tên giảng viên">
            <button class="nutTimKiem" onclick="timKiemGV()">
                <span class="nutTimKiem_tieuDe">Tìm</span>
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </div>

    <div class="boc-bang">
        <table id="myTable" class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable('idGv', this)" class="cot-maGV">Mã GV</th>
            <th data-sort onclick="sortTable('tenGv', this)" class="cot-tenGV">Họ và tên</th>
            <th class="cot-sdtGV">Số điện thoại</th>
            <th class="cot-emailGV">Email</th>
            <th data-sort onclick="sortTable('genderGv', this)" class="cot-gioiTinhGV">Giới tính</th>
            <th data-sort onclick="sortTable('idKhoa', this)" class="cot-khoaGV">Khoa</th>
            <th data-sort onclick="sortTable('ngayTao', this)" class="cot-ngayTao">Ngày tạo</th>
            <th data-sort onclick="sortTable('ngaySua', this)" class="cot-ngayTao">Ngày cập nhật</th>
            <th class="hanh-dong">Action</th>
            </thead>
            <tbody>
            <%
                // Register JDBC driver
                try {
                    Class.forName(driver);

                    // Open a connection to the database
                    Connection conn = DriverManager.getConnection(dBUrl, username, password);

                    // Create the HTTP request URL
                    String url = "http://localhost:8080/api/home/teacher";

                    // Create the HTTP connection
                    URL obj = new URL(url);
                    HttpURLConnection con = (HttpURLConnection) obj.openConnection();

                    // Set request method
                    con.setRequestMethod("POST");

                    // Set request headers
                    con.setRequestProperty("Content-Type", "application/json");
                    con.setRequestProperty("Accept", "application/json");
                    con.setRequestProperty("Cookie", "JSESSIONID=" + request.getSession().getId());

                    // Set request parameters
                    String jsonInputString = "{\"tenGv\":\"\",\"baseRequest\":{\"sortField\":\"\",\"sortOrder\":\"\",\"pageIndex\":0,\"pageSize\":10}}";
                    con.setDoOutput(true);
                    OutputStream os = con.getOutputStream();
                    byte[] input = jsonInputString.getBytes("utf-8");
                    os.write(input, 0, input.length);

                    // Send request
                    int responseCode = con.getResponseCode();

                    // Read response
                    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
                    String inputLine;
                    StringBuffer resp = new StringBuffer();
                    while ((inputLine = in.readLine()) != null) {
                        resp.append(inputLine);
                    }
                    in.close();

                    // Process the response
                    String responseJson = resp.toString();
                    JSONObject jsonResponse = new JSONObject(responseJson);

                    // Process the response
                    JSONArray items = jsonResponse.getJSONArray("data");
                    for (int i = 0; i < items.length(); i++) {
                        JSONObject item = items.getJSONObject(i);
                        String idGv = item.getString("idGv");
                        String tenGv = item.getString("tenGv");
                        String sdtGv = item.getString("sdtGv");
                        String emailGv = item.getString("emailGv");
                        String genderGv = item.getString("genderGv");
                        String tenKhoa = item.getString("tenKhoa");
                        String idKhoa = item.getString("idKhoa");
                        String ngayTao = item.getString("ngayTao");
                        String ngaySua = item.getString("ngaySua");
                        out.println("<tr>");
                        out.println("<td>" + idGv + "</td>");
                        out.println("<td>" + tenGv + "</td>");
                        out.println("<td>" + sdtGv + "</td>");
                        out.println("<td>" + emailGv + "</td>");
                        out.println("<td>" + genderGv + "</td>");
                        out.println("<td>" + tenKhoa + "</td>");
                        out.println("<td>" + ngayTao + "</td>");
                        out.println("<td>" + ngaySua + "</td>");
                        out.println("<td class=\"chucNang\">");
                        out.println("<div class=\"hop-hanh-dong\">");
                        out.println("<button class=\"sua hop-hanh-dong-nut\" type=\"button\" onclick=\"showModalSua('modal_giang_vien_sua'," + "'" + idGv + "','" + tenGv + "','" + sdtGv + "','" + emailGv + "','" + genderGv + "','" + idKhoa + "')\">");
                        out.println("<span class=\"sua_tieuDe\">Sửa</span>");
                        out.println("<i class=\"fa-solid fa-pencil sua_icon\"></i>");
                        out.println("</button>");
                        out.println("<button onclick=\"hienXacNhanXoa('modal_xac_nhan_xoa'," + "'" + idGv + "'" + ")\" class=\"xoa hop-hanh-dong-nut\" type=\"button\">");
                        out.println("<span class=\"xoa_tieuDe\">Xóa</span>");
                        out.println("<i class=\"fa-solid fa-trash xoa_icon\"></i>");
                        out.println("</button>");
                        out.println("</div>");
                        out.println("</td>");
                        out.println("</tr>");
                    }
                    // Close the database connection
                    conn.close();
                } catch (Exception e) {
                    System.out.println(e);
                }
            %>
            </tbody>
        </table>
    </div>
    <div class="phanTrang">
        <ul>
            <li class="nutPaginate prev" style="color: white">
                <span><i class="fas fa-angle-left"></i></span>
            </li>
            <span class="soTrang">

            </span>
            <li class="nutPaginate next" style="color: white">
                <span><i class="fas fa-angle-right"></i></span>
            </li>
        </ul>
    </div>
</div>

<%@include file="../teacher/add_teacher_form.jsp" %>
<%@include file="../teacher/update_teacher_form.jsp" %>
<%@include file="../teacher/confirm_delete_teacher.jsp"%>

<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/text_error_teacher.js"></script>
<script src="../../../assets/js/add_form.js"></script>
<script src="../../../assets/js/update_teacher.js"></script>
<script src="../../../assets/js/confirm_delete_form.js"></script>

</body>
</html>