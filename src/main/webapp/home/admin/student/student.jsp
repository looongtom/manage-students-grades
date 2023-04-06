<%--
  Created by IntelliJ IDEA.
  User: Admins
  Date: 2/19/2023
  Time: 4:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/student.css">
    <link rel="stylesheet" href="../../../assets/css/add-student-form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
    <title>Sinh viên</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
<div class="manHinhChinh">
    <div class="dauTrang">
        <h1 class="tieuDeTrang">Danh sách sinh viên</h1>
        <button id="nut_them_SV" onclick="showModal('modal_sinh_vien')" class="nutThemSV js-nutThemSV"
                type="button">
            <span class="nutThemSV_tieuDe">Thêm sinh viên</span>
            <i class="fa-solid fa-plus"></i>
        </button>
    </div>

    <div class="khuVucTimKiem">
        <div class="khuVucTimKiem-dau">
            <div class="tieuDeTimKiem">Tìm kiếm sinh viên</div>
        </div>
        <div class="khuVucTimKiem-phanThan">
            <div class="phanTimKiem">
                <input type="search" class="nhapTimKiem" placeholder="Nhập mã sinh viên">
                <input type="search" class="nhapTimKiem" placeholder="Nhập tên sinh viên">
            </div>
            <div class="timKiem-cacNut">
                <button class="nutTimKiem">
                    <span class="nutTimKiem_tieuDe">Tìm</span>
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
                <button class="nutReset">
                    <span class="nutReset_tieuDe">Reset</span>
                    <i class="fa-solid fa-arrow-rotate-back"></i>
                </button>
            </div>
        </div>
    </div>

    <div class="boc-bang">
        <table class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable(0, this)" class="cot-maSV">Mã SV</th>
            <th data-sort onclick="sortName(this)" class="cot-tenSV">Họ và tên</th>
            <th data-sort onclick="sortTable(2, this)" class="cot-emailSV">Email</th>
            <th data-sort onclick="sortTable(3, this)" class="cot-ngaySinhSV">Ngày sinh</th>
            <th data-sort onclick="sortTable(4, this)" class="cot-gioiTinhSV">Giới tính</th>
            <th class="cot-sdtSV">Số điện thoại</th>
            <th data-sort onclick="sortTable(6, this)" class="cot-lopSV">Lớp hành chính</th>
            <th class="cot-ngayTao">Ngày tạo</th>
            <th class="cot-ngayTao">Ngày cập nhật</th>
            <th class="hanh-dong">Action</th>
            </thead>
            <tbody>
            <tr>
                <td>B20DCCN443</td>
                <td>Trần Quang Minh</td>
                <td>minhtq.b20cn443@stu.ptit.edu.vn</td>
                <td>04/07/2002</td>
                <td>Nam</td>
                <td>0986153247</td>
                <td>D20CQCN11-B</td>
                <td>06/04/2023 10:20:00</td>
                <td>06/04/2023 10:20:00</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>B20DCCN037</td>
                <td>Trịnh Minh Tuấn</td>
                <td>tuantm.b20cn037@stu.ptit.edu.vn</td>
                <td>27/01/2002</td>
                <td>Nam</td>
                <td>0986153247</td>
                <td>D20CQCN11-B</td>
                <td>06/04/2023 10:20:00</td>
                <td>06/04/2023 10:20:00</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>B20DCCN551</td>
                <td>Nguyễn Minh Quân</td>
                <td>quannm.b20cn551@stu.ptit.edu.vn</td>
                <td>21/01/2002</td>
                <td>Nam</td>
                <td>0986153247</td>
                <td>D20CQCN11-B</td>
                <td>06/04/2023 10:20:00</td>
                <td>06/04/2023 10:20:00</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>B20DCCN575</td>
                <td>Lại Ngọc Sơn</td>
                <td>sonln.b20cn575@stu.ptit.edu.vn</td>
                <td>06/04/2001</td>
                <td>Nam</td>
                <td>0986153247</td>
                <td>D20CQCN11-B</td>
                <td>06/04/2023 10:20:00</td>
                <td>06/04/2023 10:20:00</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>B20DCCN192</td>
                <td>Đào Xuân Đồng</td>
                <td>dongdx.b20cn443@stu.ptit.edu.vn</td>
                <td>24/10/2002</td>
                <td>Nam</td>
                <td>0986153247</td>
                <td>D20CQCN12-B</td>
                <td>06/04/2023 10:20:00</td>
                <td>06/04/2023 10:20:00</td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button class="xoa hop-hanh-dong-nut" type="button">
                            <span class="xoa_tieuDe">Xóa</span>
                            <i class="fa-solid fa-trash xoa_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="phanTrang">
        <ul></ul>
    </div>
    <!-- Them sinh vien dialog -->
    <%@include file="../student/student_form.jsp" %>

    <script src="../../../assets/js/student.js"></script>
    <script src="../../../assets/js/pagination_student.js"></script>
    <script src="../../../assets/js/add_student.js"></script>
</div>
</body>
</html>
