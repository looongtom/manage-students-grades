<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 27/4/2023
  Time: 7:11 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      <div id="ma-error" class="error-message">Mã lớp không được để trống</div>

      <label for="" class="modal-label">Tên lớp</label>
      <input id="ten" type="text" class="modal-input" placeholder="Nhập tên ...">
      <div id="ten-error" class="error-message">Tên lớp không được để trống</div>

      <label for="" class="modal-label">Học kỳ</label>
      <input id="ten-hk" type="text" class="modal-input" placeholder="Nhập tên ...">
      <div id="ten-hk-error" class="error-message">Học kỳ không được để trống</div>

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
      <div id="ma-khoa-error" class="error-message">Hãy chọn khoa của lớp đó</div>

    </div>
    <!-- modal footer -->
    <div class="modal-footer">
      <button class="buy-btn" type="submit" onclick="validateForm()">
        Thêm
      </button>
    </div>
  </div>
</div>