<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 4/4/2023
  Time: 11:04 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/semester.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet"  href="../../../assets/css/add_semester_form.css">
    <link rel="stylesheet"  href="../../../assets/css/update_semester_form.css">
    <title>Học kỳ</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
<div class="manHinhChinh">
    <div class="dauTrang">
        <h1 class="tieuDeTrang">Các học kỳ</h1>
        <button id="nut_them_HK" onclick="showModal('modal_hoc_ky')" class="nutThemHK js-nutThemHK"
                type="button">
            <span class="nutThemHK_tieuDe">Thêm học kỳ</span>
            <i class="fa-solid fa-plus"></i>
        </button>
    </div>

    <div class="boc-bang">
        <table class="danhSach" id="myTable">
            <thead class="hang1">
                <th data-sort onclick="sortTable('idHk', this)" class="cot-maHK">Mã học kỳ</th>
                <th data-sort onclick="sortTable('tenHocKy', this)" class="cot-tenHK">Tên học kỳ</th>
                <th data-sort onclick="sortTable('ngayTao', this)" class="cot-ngayTao">Ngày tạo</th>
                <th data-sort onclick="sortTable('ngaySua', this)" class="cot-ngayTao">Ngày cập nhật</th>
                <th class="hanh-dong">Action</th>
            </thead>
            <tbody>

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
<%@include file="add_semester_form.jsp" %>
<%@include file="update_semester_form.jsp" %>

</body>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/semester.js"></script>
<script src="../../../assets/js/add_semester.js"></script>
<script src="../../../assets/js/update_semester.js"></script>
<script src ="../../../assets/js/text_error_semester.js"></script>

</html>
