<%--
  Created by IntelliJ IDEA.
  User: Personal
  Date: 5/14/2023
  Time: 1:08 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- sửa lớp -->
<div class="boc-modal" id="modal_giang_vien_sua">
  <div class="chua-modal js-modal-container">
    <div class="dong-modal js-modal-close" onclick="hideModalSua('modal_giang_vien_sua')">
      <i id="dong-form-btn-sua" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="dau-modal-sua">
      <i class="dau-modal-icon ti-user"></i>
      Sửa lớp
    </header>
    <!-- modal body -->
    <div class="than-modal">
      <label for="" class="nhan-hieu-modal">Mã lớp</label>
      <input id="ma-lop-sua" type="text" class="nhap-modal" placeholder="Nhập mã ...">
      <div id="ma-gv-error-sua" class="tb-loi-nhap-sua">Mã lớp không được để trống</div>

      <label for="" class="nhan-hieu-modal">Tên lớp</label>
      <input id="ten-lop-sua" type="text" class="nhap-modal" placeholder="Nhập tên ...">
      <div id="ten-gv-error-sua" class="tb-loi-nhap-sua">Tên lớp không được để trống</div>


      <label for="" class="modal-label">Học kỳ</label>
      <input id="ten" type="text" class="modal-input" placeholder="Nhập học kỳ ...">
      <div id="ten-error-sua" class="error-message">Làm ơn nhập vào </div>

      <label for="" class="nhan-hieu-modal">Khoa trực thuộc</label>
      <select id="ma-khoacm-sua" class="modal-input" required>
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
      <div id="ma-khoa-lop-error-sua" class="tb-loi-nhap-sua">Chọn mã khoa</div>

    </div>
    <!-- modal footer -->
    <div class="cuoi-modal">
      <button class="sua-btn" type="submit" onclick="validateFormSua()">Sửa</button>
    </div>
  </div>
</div>