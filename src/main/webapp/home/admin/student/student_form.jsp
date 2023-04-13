<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_sinh_vien">
  <div class="chua-modal">
    <div class="dong-modal" onclick="hideModal('modal_sinh_vien')">
      <i id ="dong-form-btn" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="dau-modal">
      <i class="dau-modal-icon ti-user"></i>
      Thêm sinh viên
    </header>
    <!-- modal body -->
    <div class="than-modal">
      <label for="" class="nhan-hieu-modal">Mã sinh viên</label>
      <input id="ma-sv" type="text" class="nhap-modal" placeholder="Nhập mã ...">
      <div id="ma-sv-error" class="tb-loi-nhap">Mã sinh viên không được để trống </div>

      <label for="" class="nhan-hieu-modal">Tên sinh viên</label>
      <input id="ten-sv" type="text" class="nhap-modal" placeholder="Nhập tên ...">
      <div id="ten-sv-error" class="tb-loi-nhap">Tên sinh viên không được để trống </div>


      <label for="" class="nhan-hieu-modal">Email</label>
      <input id="email-sv" type="email" class="nhap-modal" placeholder="Điền email .. ">
      <div id="email-sv-error" class="tb-loi-nhap">Email không được để trống </div>


      <label for="" class="nhan-hieu-modal">Ngày sinh</label>
      <input id="dob-sv" type="date" class="nhap-modal">
      <div id="dob-sv-error" class="tb-loi-nhap"> Chọn ngày tháng năm sinh </div>


      <label for="" class="nhan-hieu-modal">Giới tính</label>
      <select id="gioi-tinh-sv" class="nhap-modal" required>
        <option value="">Please select</option>
        <option value="Class A">Nam</option>
        <option value="Class B">Nữ</option>
      </select>
      <div id="gioi-tinh-sv-error" class="tb-loi-nhap">Chọn giới tính </div>


      <label for="" class="nhan-hieu-modal">Số điện thoại</label>
      <input id="sdt-sv" type="text" class="nhap-modal" placeholder="Nhập số điện thoại ...">
      <div id="sdt-sv-error" class="tb-loi-nhap">Số điện thoại không được để trống</div>



      <label for="" class="nhan-hieu-modal">Lớp hành chính</label>
      <select id="ma-khoa-sv" class="nhap-modal" required>
        <option value="">Please select</option>
        <option value="Class A">Class A</option>
        <option value="Class B">Class B</option>
        <option value="Class C">Class C</option>
      </select>
      <div id="ma-khoa-sv-error" class="tb-loi-nhap">Chọn lớp hành chính</div>

    </div>
    <!-- modal footer -->
    <div class="cuoi-modal">
      <button class="them-btn" type="submit" onclick="validateForm()">
        Thêm
      </button>
    </div>
  </div>
</div>

<script src="../../../assets/js/add_student.js"></script>
<script src ="../../../assets/js/text_error_student.js"></script>