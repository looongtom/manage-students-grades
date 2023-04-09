<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 1/4/2023
  Time: 9:44 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/teacher.css">
    <link rel="stylesheet" href="../../../assets/css/add-student-form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <title>Giảng viên</title>
</head>
<body>
    <%@include file="../menu/menu.jsp" %>
    <div class="manHinhChinh">
        <h1 class="tieuDeTrang">Danh sách giảng viên</h1>
        <div class="themVaTimKiem">
            <!-- nut them giang vien -->
            <button id="nut_them_GV" onclick="showModal('modal_giang_vien')" class="nutThemGV js-nutThemGV"
                    type="button">
                <span class="nutThemGV_tieuDe">Thêm giảng viên</span>
                <i class="fa-solid fa-plus"></i>
            </button>
            <div class="timKiem">
                <div class="tieuDeTimKiem">Tìm kiếm giảng viên: </div>
                <input type="search" class="nhapTimKiem" placeholder="Nhập tên/mã giảng viên">
                <button class="nutTimKiem">
                    <span class="nutTimKiem_tieuDe">Tìm</span>
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </div>
        <div class="boc-bang">
            <table class="danhSach">
                <thead class="hang1">
                <th data-sort onclick="sortTable(0, this)" class="cot-maGV">Mã GV</th>
                <th data-sort onclick="sortName(this)" class="cot-tenGV">Họ và tên</th>
                <th class="cot-sdtGV">Số điện thoại</th>
                <th class="cot-emailGV">Email</th>
                <th data-sort onclick="sortTable(4, this)" class="cot-gioiTinhGV">Giới tính</th>
                <th data-sort onclick="sortName(this)" class="cot-khoaGV">Khoa</th>
                <th class="cot-ngayTao">Ngày tạo</th>
                <th class="cot-ngayTao">Ngày cập nhật</th>
                <th class="hanh-dong">Action</th>
                </thead>
                <tbody>
                <tr>
                    <td>TRR1</td>
                    <td>Nguyễn Tất Thắng</td>
                    <td>0986153247</td>
                    <td>drnguyentt@ptit.edu.vn</td>
                    <td>Nam</td>
                    <td>Công nghệ thông tin</td>
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
                    <td>OOP1</td>
                    <td>Trịnh Thị Vân Anh</td>
                    <td>0986153247</td>
                    <td>vanhcodekoclean@ptit.edu.vn</td>
                    <td>Nữ</td>
                    <td>Công nghệ thông tin</td>
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
                    <td>DSA11</td>
                    <td>Nguyễn Mạnh Sơn</td>
                    <td>0986153247</td>
                    <td>sonowflake@ptit.edu.vn</td>
                    <td>Nam</td>
                    <td>Công nghệ thông tin</td>
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
                    <td>KNTT1</td>
                    <td>Lê Vũ Điệp</td>
                    <td>0986153247</td>
                    <td>dieplv@ptit.edu.vn</td>
                    <td>Nữ</td>
                    <td>Truyền thông đa phương tiện</td>
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
    </div>

<%--    Them modal o day nhe quan, co gi tao file rieng roi dung include cho clean code--%>
    <%@include file="../teacher/teacher_form.jsp" %>

    <script src="../../../assets/js/menu.js"></script>
    <script src="../../../assets/js/teacher.js"></script>
    <script src="../../../assets/js/pagination_teacher.js"></script>
    <script src="../../../assets/js/text_error_teacher.js"></script>
    <script src="../../../assets/js/add_teacher.js"></script>

</body>
</html>