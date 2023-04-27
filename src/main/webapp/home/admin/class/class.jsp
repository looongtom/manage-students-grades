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
  <%@include file="../menu/menu_header.jsp" %>
  <link rel="stylesheet" href="../../../assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
  <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../../../assets/css/class.css">
  <link rel="stylesheet" href="../../../assets/css/add_class_form.css">
  <link rel="stylesheet" href="../../../assets/css/pagination.css">
  <link rel="stylesheet" href="../../../assets/css/page_404.css">
</head>

<body>
<div class="lop">
  <header class="phanlop-header">
    <div class="lop-tieuDe">Danh sách các lớp</div>
    <div class="dauTrang">
      <button id="nut_them_lop" onclick="showModal('modal_lop')" class="nutThemlop js-nutThemlop"
              type="button">
        <span class="nutThemlop_tieuDe">Thêm lớp</span>
        <i class="fa-solid fa-plus"></i>
      </button>
    </div>
    <div class="phanlop-close js-phanlop-close" class="back" onclick="location.href='specialization.html'">
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
        <input type="search" class="nhapTimKiem" placeholder="Nhập tên lớp">
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
                <span class="sua_tieuDe">Xem danh sách lớp</span>
                <i class="fa-solid fa-eye sua_icon"></i>
              </button>
            </a>
          </div>
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
        <td>D20CQCN12-B</td>
        <td>Công nghệ 12 khóa D20</td>
        <td>Công nghệ thông tin</td>
        <td>06/04/2023 10:20:00</td>
        <td>06/04/2023 10:20:00</td>
        <td class="chucNang">
          <div class="hop-hanh-dong">
            <a href="../student/student.jsp">
              <button class="xem hop-hanh-dong-nut" type="button">
                <span class="sua_tieuDe">Xem danh sách lớp</span>
                <i class="fa-solid fa-eye sua_icon"></i>
              </button>
            </a>
          </div>
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
</div>
<div class="boc-modal" id="modal_lop">
  <div class="modal-container js-modal-container">
    <div class="modal-close js-modal-close" onclick="hideModal('modal_lop')">
      <i id="close-btn" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="modal-header">
      <i class="modal-heading-icon ti-user"></i>
      Thêm lớp
    </header>
    <!-- modal body -->
    <div class="modal-body">
      <label for="" class="modal-label">Mã lớp</label>
      <input id="ma" type="text" class="modal-input" placeholder="Nhập mã ...">
      <div id="ma-error" class="error-message">Làm ơn nhập vào </div>

      <label for="" class="modal-label">Tên lớp</label>
      <input id="ten" type="text" class="modal-input" placeholder="Nhập tên ...">
      <div id="ten-error" class="error-message">Làm ơn nhập vào </div>

      <label for="" class="modal-label">Khoa trực thuộc</label>
      <select id="ma-khoa" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Khoa Công nghệ thông tin">Khoa Công nghệ thông tin</option>
        <option value="Khoa Cơ bản 1">Khoa Cơ bản 1</option>
        <option value="Khoa An toàn thông tin">Khoa An toàn thông tin</option>
        <option value="Khoa Đa phương tiện">Khoa Đa phương tiện</option>
        <option value="Khoa Viễn thông 1">Khoa Viễn thông 1</option>
        <option value="Khoa Kỹ thuật điện tử 1">Khoa Kỹ thuật điện tử 1</option>
        <option value="Khoa Quản trị kinh doanh 1">Khoa Quản trị kinh doanh 1</option>
        <option value="Khoa Tài chính kế toán">Khoa Tài chính kế toán</option>
      </select>
      <div id="ma-khoa-error" class="error-message">Làm ơn chọn mã lớp</div>

    </div>
    <!-- modal footer -->
    <div class="modal-footer">
      <button class="buy-btn" type="submit" onclick="validateForm()">
        Thêm
      </button>
    </div>
  </div>
</div>

<script src="../../../assets/js/pagination_class.js"></script>
<script src="../../../assets/js/add_class.js"></script>
<script src="../../../assets/js/class.js"></script>
<script src="../../../assets/js/text_error_class.js"></script>
</body>

</html>
