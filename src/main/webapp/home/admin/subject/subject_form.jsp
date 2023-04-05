<%--
  Created by IntelliJ IDEA.
  User: NMQ
  Date: 4/5/2023
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_mon_hoc">
  <div class="modal-container js-modal-container">
    <div class="modal-close js-modal-close" onclick="hideModal('modal_mon_hoc')">
      <i id = "close-btn" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="modal-header">
      <i class="modal-heading-icon ti-user"></i>
      Thêm sinh viên
    </header>
    <!-- modal body -->
    <div class="modal-body">
      <label for="" class="modal-label">Mã sinh viên</label>
      <input id="ma" type="text" class="modal-input" placeholder="Nhập mã ...">
      <div id="ma-error" class="error-message">Làm ơn nhập vào </div>

      <label for="" class="modal-label">Tên sinh viên</label>
      <input id="ten" type="text" class="modal-input" placeholder="Nhập tên ...">
      <div id="ten-error" class="error-message">Làm ơn nhập vào </div>


      <label for="" class="modal-label">Email</label>
      <input id="email" type="email" class="modal-input" placeholder="Điền email .. ">
      <div id="email-error" class="error-message">Làm ơn nhập vào </div>


      <label for="" class="modal-label">Ngày sinh</label>
      <input id="dob" type="date" class="modal-input">
      <div id="dob-error" class="error-message">Làm ơn nhập vào </div>


      <label for="" class="modal-label">Giới tính</label>
      <select id="gioi-tinh" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Nam</option>
        <option value="Class B">Nữ</option>
      </select>
      <div id="gioi-tinh-error" class="error-message">Làm ơn chọn giới tính </div>


      <label for="" class="modal-label">Số điện thoại</label>
      <input id="sdt" type="text" class="modal-input" placeholder="Nhập số điện thoại ...">
      <div id="sdt-error" class="error-message">Làm ơn nhập vào</div>



      <label for="" class="modal-label">Lớp hành chính</label>
      <select id="ma-khoa" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Class A</option>
        <option value="Class B">Class B</option>
        <option value="Class C">Class C</option>
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
<script src="../../../assets/js/add_subject.js"></script>
<script src ="../../../assets/js/text_error.js"></script>
