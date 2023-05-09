<%--
  Created by IntelliJ IDEA.
  User: NMQ
  Date: 4/13/2023
  Time: 12:19 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal-xoa" id="modal_xac_nhan_xoa">
  <div class="chua-modal-xoa">
    <div class="dong-modal-xoa" onclick="anXacNhanXoa('modal_xac_nhan_xoa')">
      <i id ="dong-form-btn" class="ti-close"></i>
    </div>
    <!-- modal header -->
    <header class="dau-modal-xoa">
      <i class="dau-modal-icon ti-trash"></i>

    </header>
    <!-- modal body -->
    <div class="than-modal-xoa">
      Bạn có chắc chắn muốn xóa môn học <span id="textMa"></span> không?
      <br>
      Sau khi xóa bạn không thể khôi phục dữ liệu này.
    </div>
    <!-- modal footer -->
    <div class="cuoi-modal-xoa">
      <button onclick="anXacNhanXoa('modal_xac_nhan_xoa')" class="huy-btn" type="submit" onclick="validateForm()">
        Hủy
      </button>
      <button class="xoa-btn" type="submit" onclick="validateForm()">
        Xóa
      </button>
    </div>
  </div>
</div>
