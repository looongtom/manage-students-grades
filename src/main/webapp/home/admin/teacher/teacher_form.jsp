<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_giang_vien" >
    <div class="chua-modal js-modal-container">
        <div class="dong-modal js-modal-close" onclick="hideModal('modal_giang_vien')">
            <i id ="dong-form-btn" class="ti-close"></i>
        </div>
        <!-- modal header -->
        <header class="dau-modal">
            <i class="dau-modal-icon ti-user"></i>
            Thêm giảng viên
        </header>
        <!-- modal body -->
        <div class="than-modal">
            <label for="" class="nhan-hieu-modal">Mã giảng viên</label>
            <input id ="ma-gv" type="text" class="nhap-modal" placeholder="Nhập mã ...">
            <div id="ma-gv-error" class="tb-loi-nhap">Mã giảng viên không được để trống</div>



            <label for="" class="nhan-hieu-modal">Tên giảng viên</label>
            <input id = "ten-gv" type="text" class="nhap-modal" placeholder="Nhập tên ...">
            <div id="ten-gv-error" class="tb-loi-nhap">Tên giảng viên không được để trống</div>


            <label for="" class="nhan-hieu-modal">Email</label>
            <input id="email-gv" type="email" class="nhap-modal" placeholder="Điền email .. ">
            <div id="email-gv-error" class="tb-loi-nhap">Email không được để trống</div>


            <label for="" class="nhan-hieu-modal">Giới tính</label>
            <select id = "gioi-tinh-gv" class="nhap-modal" required>
                <option value="">Please select</option>
                <option value="Class A">Nam</option>
                <option value="Class B">Nữ</option>
            </select>
            <div id="gioi-tinh-gv-error" class="tb-loi-nhap">Chọn giới tính </div>


            <label for="" class="nhan-hieu-modal">Số điện thoại</label>
            <input id="sdt-gv" type="text" class="nhap-modal" placeholder="Nhập số điện thoại ...">
            <div id="sdt-gv-error" class="tb-loi-nhap">Số điện thoại không được để trống </div>




            <label for="" class="nhan-hieu-modal">Mã khoa </label>
            <select id="ma-khoa-gv" class="nhap-modal" required>
                <option value="">Please select</option>
                <option value="Class A">Class A</option>
                <option value="Class B">Class B</option>
                <option value="Class C">Class C</option>
            </select>
            <div id="ma-khoa-gv-error" class="tb-loi-nhap">Chọn mã khoa</div>

        </div>
        <!-- modal footer -->
        <div class="cuoi-modal">
            <button class="them-btn" type="submit" onclick="validateForm()">Thêm</button>
        </div>
    </div>
</div>

<script src="../../../assets/js/text_error_teacher.js"></script>
<script src="../../../assets/js/add_teacher.js"></script>

