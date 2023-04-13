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
        <table class="danhSach">
            <thead class="hang1">
                <th data-sort onclick="sortTable(0, this)" class="cot-maHK">Mã học kỳ</th>
                <th data-sort onclick="sortName(this)" class="cot-tenHK">Tên học kỳ</th>
                <th class="cot-ngayTao">Ngày tạo</th>
                <th class="cot-ngayTao">Ngày cập nhật</th>
                <th class="hanh-dong">Action</th>
            </thead>
            <tbody>
                <tr>
                    <td>20231</td>
                    <td>Kỳ xuân 2023</td>
                    <td>06/04/2023 10:20:00</td>
                    <td>06/04/2023 10:20:00</td>
                    <td class="chucNang">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="phanTrang">
        <ul></ul>
    </div>
</div>
<%@include file="../semester/semester_form.jsp" %>

</body>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/semester.js"></script>
<script src="../../../assets/js/pagination_semester.js"></script>
<script src="../../../assets/js/add_semester.js"></script>
<script src ="../../../assets/js/text_error_semester.js"></script>


</html>
