<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_sinh_vien">
  <div class="modal-container js-modal-container">
    <div class="modal-close js-modal-close" onclick="hideModal('modal_sinh_vien')">
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
      <input id="ma-sv" type="text" class="modal-input" placeholder="Nhập mã ...">
      <div id="ma-sv-error" class="error-message">Mã sinh viên không được để trống </div>

      <label for="" class="modal-label">Tên sinh viên</label>
      <input id="ten-sv" type="text" class="modal-input" placeholder="Nhập tên ...">
      <div id="ten-sv-error" class="error-message">Tên sinh viên không được để trống </div>


      <label for="" class="modal-label">Email</label>
      <input id="email-sv" type="email" class="modal-input" placeholder="Điền email .. ">
      <div id="email-sv-error" class="error-message">Email không được để trống </div>


      <label for="" class="modal-label">Ngày sinh</label>
      <input id="dob-sv" type="date" class="modal-input">
      <div id="dob-sv-error" class="error-message"> Chọn ngày tháng năm sinh </div>


      <label for="" class="modal-label">Giới tính</label>
      <select id="gioi-tinh-sv" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Nam</option>
        <option value="Class B">Nữ</option>
      </select>
      <div id="gioi-tinh-sv-error" class="error-message">Chọn giới tính </div>


      <label for="" class="modal-label">Số điện thoại</label>
      <input id="sdt-sv" type="text" class="modal-input" placeholder="Nhập số điện thoại ...">
      <div id="sdt-sv-error" class="error-message">Số điện thoại không được để trống</div>



      <label for="" class="modal-label">Lớp hành chính</label>
      <select id="ma-khoa-sv" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Class A</option>
        <option value="Class B">Class B</option>
        <option value="Class C">Class C</option>
      </select>
      <div id="ma-khoa-sv-error" class="error-message">Chọn lớp hành chính</div>

    </div>
    <!-- modal footer -->
    <div class="modal-footer">
      <button class="buy-btn" type="submit" onclick="validateForm()">
        Thêm
      </button>
    </div>
  </div>
</div>
<script src="../../../assets/js/add_student.js"></script>
<script src ="../../../assets/js/text_error.js"></script>