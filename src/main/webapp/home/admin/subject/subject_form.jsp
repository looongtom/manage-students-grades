<%--
  Created by IntelliJ IDEA.
  User: NMQ
  Date: 4/5/2023
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="boc-modal" id="modal_mon_hoc" >
  <div class="modal-container ">
    <div class="modal-close js-modal-close" onclick="hideModal('modal_mon_hoc')">
      <i id ="close-btn" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="modal-header">
      <i class="modal-heading-icon ti-pencil-alt"></i>
      Thêm môn học
    </header>
    <!-- modal body -->
    <div class="modal-body">
      <label for="" class="modal-label">Mã môn học</label>
      <input id ="ma-mh" type="text" class="modal-input" placeholder="Nhập mã ...">
      <div id="ma-mh-error" class="error-message">Mã môn học không được để trống </div>



      <label for="" class="modal-label">Tên môn học</label>
      <input id = "ten-mh" type="text" class="modal-input" placeholder="Nhập tên ...">
      <div id="ten-mh-error" class="error-message">Tên môn học không được để trống  </div>

      <label for="" class="modal-label">Số tín chỉ </label>
      <select id="stc-mh" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">1</option>
        <option value="Class B">2</option>
        <option value="Class C">3</option>
      </select>
      <div id="stc-mh-error" class="error-message">Chọn số tín chỉ</div>

      <label for="" class="modal-label">Mã khoa</label>
      <select id="ma-khoa-mh" class="modal-input" required>
        <option value="">Please select</option>
        <option value="Class A">Class A</option>
        <option value="Class B">Class B</option>
        <option value="Class C">Class C</option>
      </select>
      <div id="ma-khoa-mh-error" class="error-message">Chọn mã khoa</div>

    </div>
    <!-- modal footer -->
    <div class="modal-footer">
      <button class="buy-btn" type="submit" onclick="validateForm()">Thêm</button>
    </div>
  </div>
</div>
<script src="../../../assets/js/text_error_subject.js"></script>
<script src="../../../assets/js/add_subject.js"></script>

