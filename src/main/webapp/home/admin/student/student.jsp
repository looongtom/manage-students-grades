<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/student.css">
    <link rel="stylesheet" href="../../../assets/css/add_student_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/css/confirm_delete_form.css">
    <title>Sinh viên</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
<div class="manHinhChinh">
    <div class="dauTrang">
        <h1 class="tieuDeTrang">Danh sách sinh viên</h1>
        <button id="nut_them_SV" onclick="showModal('modal_sinh_vien')" class="nutThemSV js-nutThemSV"
                type="button">
            <span class="nutThemSV_tieuDe">Thêm sinh viên</span>
            <i class="fa-solid fa-plus"></i>
        </button>
    </div>

    <div class="khuVucTimKiem">
        <div class="khuVucTimKiem-dau">
            <div class="tieuDeTimKiem">Tìm kiếm sinh viên</div>
        </div>
        <div class="khuVucTimKiem-phanThan">
            <div class="phanTimKiem">
                <input type="search" class="nhapTimKiem" placeholder="Nhập mã sinh viên">
                <input type="search" class="nhapTimKiem" placeholder="Nhập tên sinh viên">
            </div>
            <div class="timKiem-cacNut">
                <button class="nutTimKiem">
                    <span class="nutTimKiem_tieuDe">Tìm</span>
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <button class="nutReset">
                    <span class="nutReset_tieuDe">Reset</span>
                    <i class="fa-solid fa-arrow-rotate-back"></i>
                </button>
            </div>
        </div>
    </div>

    <div class="boc-bang">
        <table id="myTable" class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable(0, this)" class="cot-maSV">Mã SV</th>
            <th data-sort onclick="sortName(this)" class="cot-tenSV">Họ và tên</th>
            <th data-sort onclick="sortTable(2, this)" class="cot-emailSV">Email</th>
            <th class="cot-ngaySinhSV">Ngày sinh</th>
            <th data-sort onclick="sortTable(4, this)" class="cot-gioiTinhSV">Giới tính</th>
            <th class="cot-sdtSV">Số điện thoại</th>
            <th data-sort onclick="sortTable(6, this)" class="cot-lopSV">Lớp hành chính</th>
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
    <!-- Them sinh vien dialog -->
    <%@include file="../student/student_form.jsp" %>
    <%@include file="../student/confirm_delete_student.jsp"%>

    <script src="../../../assets/js/menu.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="../../../assets/js/student.js"></script>
    <script src="../../../assets/js/pagination_student.js"></script>
    <script src="../../../assets/js/add_student.js"></script>
    <script src="../../../assets/js/text_error_student.js"></script>
</div>
</body>
</html>
