<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/teacher.css">
    <link rel="stylesheet" href="../../../assets/css/add_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <title>Giảng viên</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
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
            <input type="search" class="nhapTimKiem" placeholder="Nhập tên/mã giảng viên">
            <button class="nutTimKiem">
                <span class="nutTimKiem_tieuDe">Tìm</span>
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </div>

    <div class="boc-bang">
        <table id="myTable" class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable(0, this)" class="cot-maGV">Mã GV</th>
            <th data-sort onclick="sortName(this)" class="cot-tenGV">Họ và tên</th>
            <th class="cot-sdtGV">Số điện thoại</th>
            <th class="cot-emailGV">Email</th>
            <th data-sort onclick="sortTable(4, this)" class="cot-gioiTinhGV">Giới tính</th>
            <th data-sort onclick="sortName(this)" class="cot-khoaGV">Khoa</th>
            <th class="cot-ngayTao">Ngày tạo</th>
            <th class="cot-ngayTao">Ngày cập nhật</th>
            <th class="hanh-dong">Action</th>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <div class="phanTrang">
        <ul></ul>
    </div>
</div>

<%@include file="../teacher/teacher_form.jsp" %>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/teacher.js"></script>
<script src="../../../assets/js/pagination_teacher.js"></script>
<script src="../../../assets/js/text_error_teacher.js"></script>
<script src="../../../assets/js/add_teacher.js"></script>

</body>
</html>