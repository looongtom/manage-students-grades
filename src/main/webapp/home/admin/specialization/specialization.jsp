<%--
  Created by IntelliJ IDEA.
  User: Personal
  Date: 4/13/2023
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Môn học</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
    <link rel="stylesheet" href="./assets/themify-icons/themify-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,700;1,300;1,400&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/admin_menu.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="icon" type="image/x-icon" href="./assets/images/ptit.png">
    <link rel="stylesheet" href="./assets/css/specialization.css">
</head>

<body>
<div class="menu">
    <div class="menu-phanTren">
        <div class="tieuDe">
            <img class="logo" src="./assets/images/ptit.png" alt="Logo PTIT">
            <div class="tenTieuDe">Quản lý điểm sinh viên</div>
        </div>
        <div class="nganCach"></div>
        <div class="taiKhoan">
            <img src="./assets/images/avatar.png" alt="avatar" class="avatar">
            <div class="tenTaiKhoan">Admin</div>
        </div>
        <div class="nganCach"></div>
        <a class="menuMuc trangChuMuc" href="home.html">
            <img src="./assets/images/home.png" alt="Trang chủ" class="icon-Muc">
            <div class="menuMuc-tieuDe">Trang chủ</div>
        </a>
        <a class="menuMuc nhapDiemMuc" href="add_grade.html">
            <img src="./assets/images/score.png" alt="Điểm" class="icon-Muc">
            <div class="menuMuc-tieuDe">Nhập điểm</div>
        </a>
        <a class="menuMuc sinhVienMuc" href="student.html">
            <img src="./assets/images/student.svg" alt="Sinh viên" class="icon-Muc">
            <div class="menuMuc-tieuDe">Sinh viên</div>
        </a>
        <a class="menuMuc giangVienMuc" href="teacher.html">
            <img src="./assets/images/teacher.png" alt="Giảng vien" class="icon-Muc">
            <div class="menuMuc-tieuDe">Giảng viên</div>
        </a>
        <a class="menuMuc thongTinMuc" href="semester.html">
            <img src="./assets/images/general_info.png" alt="Thông tin chung" class="icon-Muc">
            <div class="menuMuc-tieuDe">Học kỳ</div>
        </a>
        <a class="menuMuc monHocMuc" href="subject.html">
            <img src="./assets/images/subject.jpg" alt="Thông tin mon hoc" class="icon-Muc">
            <div class="menuMuc-tieuDe">Thông tin môn học</div>
        </a>
        <a class="menuMuc khoaMuc" href="specialization.html">
            <img src="./assets/images/school.png" alt="Khoa" class="icon-Muc">
            <div class="menuMuc-tieuDe">Khoa chuyên môn</div>
        </a>
        <a class="menuMuc nguoiDungMuc" href="user.html">
            <img src="./assets/images/user.png" alt="Người dùng" class="icon-Muc">
            <div class="menuMuc-tieuDe">Người dùng</div>
        </a>
    </div>
    <div class="menu-phanDuoi">
        <div class="dongMenu">
            <img src="./assets/images/menu.png" alt="Đăng xuất" class="icon-DangXuat">
            <div class="dongMenu-tieuDe">Đóng menu</div>
        </div>
        <a href="#" class="dangXuat">
            <img src="./assets/images/log-out.png" alt="Đăng xuất" class="icon-DangXuat">
            <div class="dangXuat-tieuDe">Đăng xuất</div>
        </a>
    </div>
</div>
<div class="manHinhChinh">
    <h2 class="dau-noidung text-red">Cơ sở đào tạo tại Hà Nội</h2>
    <p class="dau-noidung1 text-red">Các khoa của học viện
    <div class="phanthan">

        <div class="noidung">
            <div class="hangngang">
                <div class="hop hop1">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="New York" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Cơ bản 1</h3>
                            <p class="diachi-khoa"> Tầng 10, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Cơ bản 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực khoa học cơ bản, Ngoại ngữ và Giáo dục thể chất – Quốc phòng.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop2">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Đa Phương tiện</h3>
                            <p class="diachi-khoa"> Tầng 1, nhà A1, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Đa Phương tiện có chức năng đào tạo và nghiên cứu khoa học các chuyên ngành Công nghệ Đa phương tiện và Truyền thông Đa phương tiện theo mục tiêu, chương trình, nội dung, phương pháp đào tạo do Giám đốc Học viện phê duyệt.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hangngang">
                <div class="hop hop3">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Viễn Thông 1</h3>
                            <p class="diachi-khoa">Tầng 10, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Viễn thông 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực điện tử truyền thông.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop4">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Kỹ thuật điện tử 1</h3>
                            <p class="diachi-khoa">Tầng 9, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Kỹ thuật Điện tử 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực Điện – Điện tử.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hangngang">
                <div class="hop hop5">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Quản trị kinh doanh 1</h3>
                            <p class="diachi-khoa">Tầng 9, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Quản trị kinh doanh 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực quản trị kinh doanh.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop6">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Tài chính kế toán</h3>
                            <p class="diachi-khoa"> Tầng 10, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Tài chính Kế toán 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực tài chính, kế toán, kiểm toán.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hangngang">
                <div class="hop hop7">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="Paris" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Công nghệ thông tin 1</h3>
                            <p class="diachi-khoa">Tầng 9, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Công nghệ thông tin 1 trực thuộc Học viện Công nghệ Bưu chính Viễn thông đào tạo và nghiên cứu khoa học thuộc lĩnh vực Công nghệ thông tin (Công nghệ thông tin, Công nghệ phần mềm, Hệ thống thông tin, Khoa học máy tính, Kỹ thuật máy tính và An toàn thông tin).</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop8">
                    <div class="cac-khoa">
                        <img src="./assets/images/sanfran.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa An toàn Thông tin</h3>
                            <p class="diachi-khoa">Sun 29 Nov 2016</p>
                            <p class="thongtin-khoa">Khoa An toàn thông tin là đơn vị đào tạo thuộc Học viện Công nghệ Bưu chính Viễn thông; có chức năng đào tạo và nghiên cứu khoa học trong lĩnh vực An toàn thông tin với nhiệm vụ quản lý, tổ chức giảng dạy các môn học, học phần do khoa quản lý cho các hệ đào tạo của Học viện.</p>
                            <button class="btn">Xem thêm</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
