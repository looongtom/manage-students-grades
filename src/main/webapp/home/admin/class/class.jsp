<%--
  Created by IntelliJ IDEA.
  User: Personal
  Date: 4/27/2023
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <%@include file="../menu/admin_menu_header.jsp" %>
  <title>Danh sách lớp</title>
  <link rel="stylesheet" href="../../../assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
  <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../../../assets/css/admin/class.css">
  <link rel="stylesheet" href="../../../assets/css/admin/add_class_form.css">
  <link rel="stylesheet" href="../../../assets/css/pagination.css">
  <link rel="stylesheet" href="../../../assets/css/page_404.css">
  <link rel="stylesheet" href="../../../assets/css/admin/update_class_form.css">
  <link rel="stylesheet" href="../../../assets/css/admin/confirm_delete_form.css">
</head>

<body>
<div class="lop">
  <header class="phanlop-header">
    <div class="lop-tieuDe">Danh sách các lớp
      <span id="lop-tieuDe-chiTiet"></span>
    </div>
    <div class="dauTrang">
      <button id="nut_them_lop" onclick="showModal('modal_lop')" class="nutThemlop js-nutThemlop"
              type="button">
        <span class="nutThemlop_tieuDe">Thêm lớp</span>
        <i class="fa-solid fa-plus"></i>
      </button>
    </div>
    <div class="phanlop-close js-phanlop-close" class="back" onclick="location.href='../specialization/specialization.jsp'">
      Khoa Chuyên Môn
    </div>
  </header>
  <div class="khuVucTimKiem">
    <div class="khuVucTimKiem-dau">
      <div class="tieuDeTimKiem">Tìm kiếm lớp</div>
    </div>
    <div class="khuVucTimKiem-phanThan">
      <div class="phanTimKiem">
        <input type="search" class="nhapTimKiem" placeholder="Nhập mã lớp">
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
    <table class="danhSach">
      <thead class="hang1">
      <th data-sort onclick="sortTable(0, this)" class="cot-malop">Mã lớp</th>
      <th data-sort onclick="sortName(this)" class="cot-tenlop">Tên lớp</th>
      <th data-sort onclick="sortTable(6, this)" class="cot-khoa">Khoa trực thuộc</th>
      <th class="cot-ngayTao">Ngày tạo</th>
      <th class="cot-ngayTao">Ngày cập nhật</th>
      <th class="hanh-dong">Action</th>
      </thead>
      <tbody>
      <tr>
        <td>D20CQCN11-B</td>
        <td>Công nghệ 11 khóa D20</td>
        <td>Công nghệ thông tin</td>
        <td>06/04/2023 10:20:00</td>
        <td>06/04/2023 10:20:00</td>
        <td class="chucNang">
          <div class="hop-hanh-dong">
            <a href="../student/student.jsp">
              <button class="xem hop-hanh-dong-nut" type="button">
                <span class="sua_tieuDe">Xem điểm</span>
                <i class="fa-solid fa-eye sua_icon"></i>
              </button>
            </a>
          </div>
          <div class="hop-hanh-dong">
            <button class="sua hop-hanh-dong-nut" type="button"
                    onclick="showModalSua('modal_giang_vien_sua', 'D20CQCN11-B', 'Công nghệ 11 khóa D20', 'Công nghệ thông tin')">
              <span class="sua_tieuDe">Sửa</span>
              <i class="fa-solid fa-pencil sua_icon"></i>
            </button>
            <button class="xoa hop-hanh-dong-nut" type="button" onclick="hienXacNhanXoa('modal_xac_nhan_xoa', 'D20CQCN11-B')">
              <span class="xoa_tieuDe">Xóa</span>
              <i class="fa-solid fa-trash xoa_icon"></i>
            </button>
          </div>
        </td>
      </tr>
      <tr>
        <td>D20CQCN12-B</td>
        <td>Công nghệ 12 khóa D20</td>
        <td>Công nghệ thông tin</td>
        <td>06/04/2023 10:20:00</td>
        <td>06/04/2023 10:20:00</td>
        <td class="chucNang">
          <div class="hop-hanh-dong">
            <a href="../student/student.jsp">
              <button class="xem hop-hanh-dong-nut" type="button">
                <span class="sua_tieuDe">Xem điểm</span>
                <i class="fa-solid fa-eye sua_icon"></i>
              </button>
            </a>
          </div>
          <div class="hop-hanh-dong">
            <button class="sua hop-hanh-dong-nut" type="button"
                    onclick="showModalSua('modal_giang_vien_sua', 'D20CQCN12-B', 'Công nghệ 12 khóa D20', 'Công nghệ thông tin')">
              <span class="sua_tieuDe">Sửa</span>
              <i class="fa-solid fa-pencil sua_icon"></i>
            </button>
            <button class="xoa hop-hanh-dong-nut" type="button" onclick="hienXacNhanXoa('modal_xac_nhan_xoa', 'D20CQCN12-B')">
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
</div>
<%@include file="../class/add_class_form.jsp" %>
<%@include file="confirm_delete_class.jsp" %>
<%@include file="update_class_form.jsp" %>
<script src="../../../assets/js/admin/pagination_class.js"></script>
<script src="../../../assets/js/admin/add_form.js"></script>
<script src="../../../assets/js/admin/class.js"></script>
<script src="../../../assets/js/admin/text_error_class.js"></script>
<script src="../../../assets/js/admin/update_class.js"></script>
<script src="../../../assets/js/admin/confirm_delete_form.js"></script>

</body>

</html>
