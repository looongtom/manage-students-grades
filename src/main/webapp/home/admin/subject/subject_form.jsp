<%--
  Created by IntelliJ IDEA.
  User: NMQ
  Date: 4/5/2023
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="boc-modal" id="modal_mon_hoc" >
  <div class="chua-modal ">
    <div class="dong-modal" onclick="hideModal('modal_mon_hoc')">
      <i id ="dong-form-btn" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="dau-modal">
      <i class="dau-modal-icon ti-pencil-alt"></i>
      Thêm môn học
    </header>
    <!-- modal body -->
    <div class="than-modal">
      <label for="" class="nhan-hieu-modal">Mã môn học</label>
      <input id ="ma-mh" type="text" class="nhap-modal" placeholder="Nhập mã ...">
      <div id="ma-mh-error" class="tb-loi-nhap">Mã môn học không được để trống </div>



      <label for="" class="nhan-hieu-modal">Tên môn học</label>
      <input id = "ten-mh" type="text" class="nhap-modal" placeholder="Nhập tên ...">
      <div id="ten-mh-error" class="tb-loi-nhap">Tên môn học không được để trống  </div>

      <label for="" class="nhan-hieu-modal">Số tín chỉ </label>
      <select id="stc-mh" class="nhap-modal" required>
        <option value="">Please select</option>
        <option value="Class A">1</option>
        <option value="Class B">2</option>
        <option value="Class C">3</option>
      </select>
      <div id="stc-mh-error" class="tb-loi-nhap">Chọn số tín chỉ</div>

      <label for="" class="nhan-hieu-modal">Mã khoa</label>
      <select id="ma-khoa-mh" class="nhap-modal" required>
        <option value="">Please select</option>
        <option value="Class A">Class A</option>
        <option value="Class B">Class B</option>
        <option value="Class C">Class C</option>
      </select>
      <div id="ma-khoa-mh-error" class="tb-loi-nhap">Chọn mã khoa</div>

    </div>
    <!-- modal footer -->
    <div class="cuoi-modal">
      <button class="them-btn" type="submit" onclick="validateForm()">Thêm</button>
    </div>
  </div>
</div>
<script src="../../../assets/js/text_error_subject.js"></script>
<script src="../../../assets/js/add_subject.js"></script>

