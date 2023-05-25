<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form class="boc-modal" id="modal_sua_diem" method="post" onsubmit="return validateFormSua()">
    <div class="chua-modal">
        <div class="dong-modal" onclick="hideModalSua('modal_sua_diem')">
            <i id ="dong-form-btn-sua" class="ti-close"></i>
        </div>
        <!-- modal header -->
        <header class="dau-modal-sua">
            <i class="dau-modal-icon ti-user"></i>
            Sửa điểm
        </header>
        <!-- modal body -->
        <div class="than-modal">
<%--            id điểm--%>
            <input id="id-diem-sua" name="id-diem-sua" type="hidden" class="nhap-modal" readonly>
<%--                id giáo viên--%>
            <input id="id-gv-sua" name="id-gv-sua" type="hidden" class="nhap-modal" readonly>
<%--                    id môn học--%>
            <input id="id-mh-sua" name="id-mh-sua" type="hidden" class="nhap-modal" readonly>

            <label for="" class="nhan-hieu-modal">Mã sinh viên</label>
            <input id="id-sv-sua" name="id-sv-sua" type="text" class="nhap-modal" readonly>
<%--                    id học kỳ--%>
            <input id="id-hk-sua" name="id-hk-sua" type="hidden" class="nhap-modal" readonly>
<%--                    id lớp--%>
            <input id="id-lop-sua" name="id-lop-sua" type="hidden" class="nhap-modal" readonly>

            <label for="" class="nhan-hieu-modal">Điểm chuyên cần</label>
            <input id="diem-cc-sua" name="diem-cc-sua" type="text" class="nhap-modal" >
            <div id="ma-cc-error" class="tb-loi-nhap-sua">Không đúng định dạng điểm</div>

            <label for="" class="nhan-hieu-modal">Đểm bài tập</label>
            <input id="diem-bt-sua" name="diem-bt-sua" type="text" class="nhap-modal" >
            <div id="ma-bt-error" class="tb-loi-nhap-sua">Không đúng định dạng điểm </div>

            <label for="" class="nhan-hieu-modal">Điểm thi</label>
            <input id="diem-thi-sua" name="diem-thi-sua" type="text" class="nhap-modal" >
            <div id="ma-thi-error" class="tb-loi-nhap-sua">Không đúng định dạng điểm </div>

            <label for="" class="nhan-hieu-modal">Điểm kiểm tra</label>
            <input id="diem-kt-sua" name="diem-kt-sua" type="text" class="nhap-modal" >
            <div id="ma-kt-error" class="tb-loi-nhap-sua">Không đúng định dạng điểm </div>

        </div>
        <!-- modal footer -->
        <div class="cuoi-modal">
            <input class="sua-btn" type="submit" value="Sửa">
        </div>
    </div>
</form>