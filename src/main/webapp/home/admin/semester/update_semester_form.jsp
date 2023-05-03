<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_hoc_ky_sua">
    <div class="chua-modal">
        <div class="dong-modal" onclick="hideModalSua('modal_hoc_ky_sua')">
            <i id ="dong-form-btn" class="ti-close"></i>
        </div>
        <!-- modal header -->
        <header class="dau-modal-sua">
            <i class="dau-modal-icon ti-view-list-alt"></i>
            Sửa học kỳ
        </header>
        <!-- modal body -->
        <div class="than-modal">
            <label for="" class="nhan-hieu-modal">Mã học kỳ</label>
            <input id="ma-hk-sua" type="text" class="nhap-modal" placeholder="Nhập mã học kỳ...">
            <div id="ma-hk-error-sua" class="tb-loi-nhap">Mã học kỳ không được để trống </div>

            <label for="" class="nhan-hieu-modal">Tên học kỳ</label>
            <input id="ten-hk-sua" type="text" class="nhap-modal" placeholder="Nhập tên học kỳ...">
            <div id="ten-hk-error-sua" class="tb-loi-nhap">Tên học kỳ không được để trống </div>

        </div>
        <!-- modal footer -->
        <div class="cuoi-modal">
            <button class="sua-btn" type="submit" onclick="validateFormSua()">
                Sửa
            </button>
        </div>
    </div>
</div>
