<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <%@include file="../menu/admin_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/admin/specialization.css">
    <title>Khoa chuyên môn</title>
</head>

<body>
<%@include file="../menu/admin_menu.jsp" %>
<div class="manHinhChinh">
    <h2 class="dau-noidung text-red">Cơ sở đào tạo tại Hà Nội</h2>
    <p class="dau-noidung1 text-red">Các khoa của học viện
    <div class="phanthan">

        <div class="noidung">
            <div class="hangngang">
                <div class="hop hop1">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/cb.png" alt="New York" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Cơ bản 1</h3>
                            <p class="diachi-khoa"> Tầng 10, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Cơ bản 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực khoa học cơ bản, Ngoại ngữ và Giáo dục thể chất – Quốc phòng.</p>
                            <a class="btn" href="../class/class.jsp?khoa=CB">Xem danh sách các lớp</a>
<%--                            <form action="class.jsp"  method ="post">--%>
<%--                                <input type="hidden" name="idKhoa" value=KCB>--%>
<%--                                <input type="submit" value=" Xem danh sách các lớp "/>--%>
<%--                            </form >--%>
                        </div>
                    </div>
                </div>
                <div class="hop hop2">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/dpt.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Đa Phương tiện</h3>
                            <p class="diachi-khoa"> Tầng 1, nhà A1, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Đa Phương tiện có chức năng đào tạo và nghiên cứu khoa học các chuyên ngành Công nghệ Đa phương tiện và Truyền thông Đa phương tiện theo mục tiêu, chương trình, nội dung, phương pháp đào tạo do Giám đốc Học viện phê duyệt.</p>
                            <a class="btn" href="../class/class.jsp?khoa=DPT">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hangngang">
                <div class="hop hop3">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/dtvt.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Viễn Thông 1</h3>
                            <p class="diachi-khoa">Tầng 10, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Viễn thông 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực điện tử truyền thông.</p>
                            <a class="btn" href="../class/class.jsp?khoa=VT">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop4">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/ktdt.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Kỹ thuật điện tử 1</h3>
                            <p class="diachi-khoa">Tầng 9, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Kỹ thuật Điện tử 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực Điện – Điện tử.</p>
                            <a class="btn" href="../class/class.jsp?khoa=KTDT">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hangngang">
                <div class="hop hop5">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/qtkd.png" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Quản trị kinh doanh 1</h3>
                            <p class="diachi-khoa">Tầng 9, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Quản trị kinh doanh 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông (dưới đây gọi tắt là Học viện) có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực quản trị kinh doanh.</p>
                            <a class="btn" href="../class/class.jsp?khoa=QTKD">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop6">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/tckt.png" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Tài chính kế toán</h3>
                            <p class="diachi-khoa"> Tầng 10, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Tài chính Kế toán 1 là đơn vị đào tạo trực thuộc Học viện Công nghệ Bưu chính Viễn thông có chức năng đào tạo và nghiên cứu khoa học thuộc lĩnh vực tài chính, kế toán, kiểm toán.</p>
                            <a class="btn" href="../class/class.jsp?khoa=TCKT">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hangngang">
                <div class="hop hop7">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/cntt.jpg" alt="Paris" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa Công nghệ thông tin 1</h3>
                            <p class="diachi-khoa">Tầng 9, nhà A2, Km10, Nguyễn Trãi, Hà Đông, Hà Nội</p>
                            <p class="thongtin-khoa">Khoa Công nghệ thông tin 1 trực thuộc Học viện Công nghệ Bưu chính Viễn thông đào tạo và nghiên cứu khoa học thuộc lĩnh vực Công nghệ thông tin (Công nghệ thông tin, Công nghệ phần mềm, Hệ thống thông tin, Khoa học máy tính, Kỹ thuật máy tính và An toàn thông tin).</p>
                            <a class="btn" href="../class/class.jsp?khoa=CNTT">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
                <div class="hop hop8">
                    <div class="cac-khoa">
                        <img src="../../../assets/images/attt.jpg" alt="San Francisco" class="khoa-img">
                        <div class="khoa">
                            <h3 class="phandau-khoa">Khoa An toàn Thông tin</h3>
                            <p class="diachi-khoa">Sun 29 Nov 2016</p>
                            <p class="thongtin-khoa">Khoa An toàn thông tin là đơn vị đào tạo thuộc Học viện Công nghệ Bưu chính Viễn thông; có chức năng đào tạo và nghiên cứu khoa học trong lĩnh vực An toàn thông tin với nhiệm vụ quản lý, tổ chức giảng dạy các môn học, học phần do khoa quản lý cho các hệ đào tạo của Học viện.</p>
                            <a class="btn" href="../class/class.jsp?khoa=ATTT">Xem danh sách các lớp</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/admin/specialization.js"></script>
</body>

</html>
