<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="menu">
    <div class="menu-phanTren">
        <div class="tieuDe">
            <img class="logo" src="../../../assets/images/ptit.png" alt="Logo PTIT">
            <div class="tenTieuDe">Quản lý điểm sinh viên</div>
        </div>
        <div class="nganCach"></div>
        <div class="taiKhoan">
            <img src="../../../assets/images/avatar.png" alt="avatar" class="avatar">
            <div class="tenTaiKhoan">Admin</div>
        </div>
        <div class="nganCach"></div>

        <a class="menuMuc trangChuMuc" href="/api/admin/home/info-to-add-grade">
            <img src="../../../assets/images/back.png" alt="Quay lại" class="icon-Muc">
            <div class="menuMuc-tieuDe">Quay lại</div>
        </a>

        <a class="menuMuc trangChuMuc" href="/admin/home">
            <img src="../../../assets/images/home.png" alt="Trang chủ" class="icon-Muc">
            <div class="menuMuc-tieuDe">Trang chủ</div>
        </a>
        <a class="menuMuc nhapDiemMuc" href="" onclick="exportToExcel(); return false;">
            <img src="../../../assets/images/score.png" alt="Xuất file Excel" class="icon-Muc">
            <div class="menuMuc-tieuDe" id="exportBtn">Xuất file Excel</div>
        </a>
    </div>
    <div class="menu-phanDuoi">
        <div class="dongMenuMuc" onclick="closeMenu()">
            <img src="../../../assets/images/menu.png" alt="Đóng menu" class="icon-Muc">
            <div class="dongMenu-tieuDe">Đóng menu</div>
        </div>
        <a href="/auth/logout" class="dangXuat">
            <img src="../../../assets/images/log-out.png" alt="Đăng xuất" class="icon-DangXuat">
            <div class="dangXuat-tieuDe">Đăng xuất</div>
        </a>
    </div>
</div>


