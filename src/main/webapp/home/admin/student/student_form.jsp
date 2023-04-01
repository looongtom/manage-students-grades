<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal js-modal">
  <div class="modal-container js-modal-container">
    <div class="modal-close js-modal-close">
      <i class = "ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="modal-header">
      <i class="modal-heading-icon ti-user"></i>
      Thêm sinh viên
    </header>
    <!-- modal body -->
    <div class="modal-body">
      <label for="" class="modal-label">
        Mã sinh viên
      </label>
      <input type="text" class="modal-input" placeholder="Nhập mã ...">

      <label for="" class="modal-label">
        Tên sinh viên
      </label>
      <input  type="text" class="modal-input" placeholder="Nhập tên ...">

      <label for="" class="modal-label">
        Email
      </label>
      <input type="email" class="modal-input" placeholder="Điền email .. ">


      <label for="" class="modal-label">
        Ngày sinh
      </label>
      <input  type="date" class="modal-input" >

      <label for= "" class="modal-label">
        Giới tính
      </label>
      <select  class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Nam</option>
        <option value="Class B">Nữ</option>
      </select>

      <label for="" class="modal-label">
        Số điện thoại
      </label>
      <input  type="text" class="modal-input" placeholder="Nhập số điện thoại ...">



      <label for= "" class="modal-label">
        Lớp hành chính
      </label>
      <select id="" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Class A</option>
        <option value="Class B">Class B</option>
        <option value="Class C">Class C</option>
      </select>
    </div>
    <!-- modal footer -->
    <div class="modal-footer">
      <button class="buy-btn">
        Thêm
      </button>
    </div>
  </div>
</div>
<script src="../../../assets/js/add_student.js"></script>