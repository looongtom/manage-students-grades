<%--
  Created by IntelliJ IDEA.
  User: NMQ
  Date: 4/12/2023
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_hoc_ky">
    <div class="chua-modal">
        <div class="dong-modal" onclick="hideModal('modal_hoc_ky')">
            <i id ="dong-form-btn" class="ti-close"></i>
        </div>
        <!-- modal header -->
        <header class="dau-modal">
            <i class="dau-modal-icon ti-view-list-alt"></i>
            Thêm học kỳ
        </header>
        <!-- modal body -->
        <div class="than-modal">
            <label for="" class="nhan-hieu-modal">Mã học kỳ</label>
            <input id="ma-hk" type="text" class="nhap-modal" placeholder="Nhập mã ...">
            <div id="ma-hk-error" class="tb-loi-nhap">Mã học kỳ không được để trống </div>

            <label for="" class="nhan-hieu-modal">Tên học kỳ</label>
            <input id="ten-hk" type="text" class="nhap-modal" placeholder="Nhập tên ...">
            <div id="ten-hk-error" class="tb-loi-nhap">Tên học kỳ không được để trống </div>

        </div>
        <!-- modal footer -->
        <div class="cuoi-modal">
            <button class="them-btn" type="submit" onclick="validateForm()">
                Thêm
            </button>
        </div>
    </div>
</div>
<script src="../../../assets/js/add_subject.js"></script>
<script src ="../../../assets/js/text_error_semester.js"></script>
