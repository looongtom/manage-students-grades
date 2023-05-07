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
            <div class="tenTaiKhoan">User</div>
        </div>
        <div class="nganCach"></div>
        <a class="menuMuc nhapDiemMuc" href="/../../home/user/home_user/home_user.jsp">
            <img src="../../../assets/images/score.png" alt="Điểm" class="icon-Muc">
            <div class="menuMuc-tieuDe">Trang chủ</div>
        </a>
        <a class="menuMuc nhapDiemMuc" href="/../../home/user/grade/watch_grade.jsp">
            <img src="../../../assets/images/score.png" alt="Điểm" class="icon-Muc">
            <div class="menuMuc-tieuDe">Xem điểm</div>
        </a>
        <a class="menuMuc nhapDiemMuc" href="/../../home/common/change_password.jsp">
            <img src="../../../assets/images/score.png" alt="Điểm" class="icon-Muc">
            <div class="menuMuc-tieuDe">Đổi mật khẩu</div>
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