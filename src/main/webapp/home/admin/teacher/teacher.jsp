<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="java.net.URI" %>
<%@ page import="org.apache.http.client.utils.URIBuilder" %>
<%@ page import="org.apache.http.impl.client.HttpClients" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.quanlysv.servlet.entity.TeacherEntityResponse" %>
<%@ page import="java.util.List" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/teacher.css">
    <link rel="stylesheet" href="../../../assets/css/add_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/update_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/css/confirm_delete_form.css">
    <title>Giảng viên</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
<%
    HttpClient httpclient = HttpClients.createDefault();
    URI uri = new URIBuilder("http://localhost:8080/api/home/teacher")
            .setParameter("tenGv", "")
            .setParameter("sortField", "id_gv")
            .setParameter("sortOrder", "asc")
            .setParameter("pageSize", "3")
            .setParameter("pageIndex", "0")
            .build();
    //    uriBuilder.addParameters(params);
//    URI uri = uriBuilder.build();

    // create the HttpGet request with the specified URI
    HttpGet httpGet = new HttpGet(uri);
    String value="JSESSIONID=";
    // set request headers
    HttpSession getSession = request.getSession();
    String cookieName = (String) getSession.getAttribute("cookie_name");
    String cookieValue = (String) getSession.getAttribute("cookie_value");
    System.out.println("Cookie"+cookieName);
    System.out.println("cookieValue: "+cookieValue);

//    httpGet.setHeader("User-Agent", "Mozilla/5.0");
    httpGet.setHeader("Cookie",value+cookieValue);

    // send the request and retrieve the response
    HttpResponse resp = httpclient.execute(httpGet);

    String responseBody = EntityUtils.toString(resp.getEntity());
    String dataString = responseBody.replaceAll("^.*?\\[", "").replaceAll("\\].*$", "");


    ObjectMapper objectMapper = new ObjectMapper();
    List<TeacherEntityResponse> listTeacher=objectMapper.readValue("["+dataString+"]", new TypeReference<List<TeacherEntityResponse>>(){});
    System.out.println(listTeacher.size());
    for (TeacherEntityResponse tmp:listTeacher){
        System.out.println(tmp.toString());
    }
%>
<div class="manHinhChinh">
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

            <% for (TeacherEntityResponse teacher : listTeacher) { %>
            <tr>
                <td><%= teacher.getIdGv() %></td>
                <td><%= teacher.getTenGv() %></td>
                <td><%= teacher.getEmailGv() %></td>
                <td><%= teacher.getSdtGv() %></td>
                <td><%= teacher.getGenderGv() %></td>
                <td><%= teacher.getTenKhoa() %></td>
                <td><%= teacher.getNgayTao() %></td>
                <td><%= teacher.getNgaySua() %></td>
            </tr>
            <% } %>
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
<script src="../../../assets/js/teacher.js"></script>
<script src="../../../assets/js/text_error_teacher.js"></script>
<script src="../../../assets/js/add_teacher.js"></script>
<script src="../../../assets/js/update_teacher.js"></script>
<script src="../../../assets/js/confirm_delete_form.js"></script>

</body>
</html>