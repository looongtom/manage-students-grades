<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="boc-modal" id="modal_giang_vien" >
    <div class="modal-container js-modal-container">
        <div class="modal-close js-modal-close" onclick="hideModal('modal_giang_vien')">
            <i id ="close-btn" class="ti-close"></i>
        </div>
        <!-- modal header -->
        <header class="modal-header">
            <i class="modal-heading-icon ti-user"></i>
            Thêm giảng viên
        </header>
        <!-- modal body -->
        <div class="modal-body">
            <label for="" class="modal-label">Mã giảng viên</label>
            <input id ="ma" type="text" class="modal-input" placeholder="Nhập mã ...">
            <div id="ma-error" class="error-message">Làm ơn nhập vào </div>



            <label for="" class="modal-label">Tên giảng viên</label>
            <input id = "ten" type="text" class="modal-input" placeholder="Nhập tên ...">
            <div id="ten-error" class="error-message">Làm ơn nhập vào </div>


            <label for="" class="modal-label">Email</label>
            <input id="email" type="email" class="modal-input" placeholder="Điền email .. ">
            <div id="email-error" class="error-message">Làm ơn nhập vào </div>


            <label for="" class="modal-label">Giới tính</label>
            <select id = "gioi-tinh" class="modal-input" required>
                <option value="">Please select</option>
                <option value="Class A">Nam</option>
                <option value="Class B">Nữ</option>
            </select>
            <div id="gioi-tinh-error" class="error-message">Làm ơn chọn giới tính </div>


            <label for="" class="modal-label">Số điện thoại</label>
            <input id="sdt" type="text" class="modal-input" placeholder="Nhập số điện thoại ...">
            <div id="sdt-error" class="error-message">Làm ơn nhập vào</div>




            <label for="" class="modal-label">Mã khoa </label>
            <select id="ma-khoa" class="modal-input" required>
                <option value="">Please select</option>
                <option value="Class A">Class A</option>
                <option value="Class B">Class B</option>
                <option value="Class C">Class C</option>
            </select>
            <div id="ma-khoa-error" class="error-message">Làm ơn chọn mã khoa</div>

        </div>
        <!-- modal footer -->
        <div class="modal-footer">
            <button class="buy-btn" type="submit" onclick="validateForm()">Thêm</button>
        </div>
    </div>
</div>

<script src="../../../assets/js/text_error.js"></script>
<script src="../../../assets/js/add_teacher.js"></script>

