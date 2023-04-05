<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 2/19/2023
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/subject.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
    <title>Môn học</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
<div class="manHinhChinh">
    <h1 class="tieuDeTrang">Danh sách môn học</h1>
    <div class="themVaTimKiem">
        <!-- nut them sinh vien -->
        <button id="nut_them_MH" onclick="showModal('modal_mon_hoc')" class="nutThemMH js-nutThemMH"
                type="button">
            <span class="nutThemMH_tieuDe">Thêm môn học</span>
            <i class="fa-solid fa-plus"></i>
        </button>
        <div class="timKiem">
            <div class="tieuDeTimKiem">Tìm kiếm môn học: </div>
            <input type="search" class="nhapTimKiem" placeholder="Nhập tên/mã môn học">
            <button class="nutTimKiem">
                <span class="nutTimKiem_tieuDe">Tìm</span>
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </div>
    <div class="boc-bang">
        <table class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable(0, this)" class="cot-maMH">Mã môn học</th>
            <th data-sort onclick="sortName(this)" class="cot-tenMH">Tên môn học</th>
            <th data-sort onclick="sortTable(2, this)" class="cot-TC">Số tín chỉ</th>
            <th data-sort onclick="sortTable(3, this)" class="cot-khoa">Khoa</th>
            <th class="hanh-dong">Action</th>
            </thead>
            <tbody>
            <tr>
                <td class="cot-maMH">INT1434</td>
                <td>Lập trình Web</td>
                <td class="cot-TC">3</td>
                <td>Công nghệ thông tin</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td class="cot-maMH">INT1303</td>
                <td>An toàn và bảo mật hệ thống thông tin</td>
                <td class="cot-TC">3</td>
                <td>An toàn thông tin</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="phanTrang">
        <ul></ul>
    </div>

    <script src="../../../assets/js/subject.js"></script>
    <script src="../../../assets/js/pagination_subject.js"></script>
</div>
</body>
</html>