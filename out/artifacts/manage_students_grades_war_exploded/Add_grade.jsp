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
    <%@include file="assets/include/menu_header.jsp" %>
</head>
<body>
    <%@include file="assets/include/menu.jsp" %>
    <div class="manHinhChinh">
        <h1 class="tieuDeTrang">Danh sách sinh viên</h1>
        <div class="themVaTimKiem">
            <!-- nut them sinh vien -->
            <button id="nut_them_SV" class="nutThemSV js-nutThemSV" type="submit">
                <span class="nutThemSV_tieuDe">Thêm sinh viên</span>
                <i class="fa-solid fa-plus"></i>
            </button>
            <div class="timKiem">
                <div class="tieuDeTimKiem">Tìm kiếm sinh viên: </div>
                <input type="search" class="nhapTimKiem" placeholder="Nhập tên/mã sinh viên">
                <button class="nutTimKiem">
                    <span class="nutTimKiem_tieuDe">Tìm</span>
                    <i class="fa-solid fa-magnifying-glass"></i>
                </button>
            </div>
        </div>
        <table class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable(0, this)">Mã SV</th>
            <th data-sort onclick="sortTable(2, this)">Họ và tên</th>
            <th data-sort onclick="sortTable(2, this)">Email</th>
            <th data-sort onclick="sortTable(3, this)">Ngày sinh</th>
            <th data-sort onclick="sortTable(4, this)">Giới tính</th>
            <th>Số điện thoại</th>
            <th data-sort onclick="sortTable(6, this)">Lớp hành chính</th>
            <th>Action</th>
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
                <td class="chucNang">
                    <button class="sua" type="submit">
                        <span class="sua_tieuDe">Sửa</span>
                        <i class="fa-solid fa-pencil sua_icon"></i>
                    </button>
                    <button class="xoa" type="submit">
                        <span class="xoa_tieuDe">Xóa</span>
                        <i class="fa-solid fa-trash xoa_icon"></i>
                    </button>
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
                <td class="chucNang">
                    <button class="sua" type="submit">
                        <span class="sua_tieuDe">Sửa</span>
                        <i class="fa-solid fa-pencil sua_icon"></i>
                    </button>
                    <button class="xoa" type="submit">
                        <span class="xoa_tieuDe">Xóa</span>
                        <i class="fa-solid fa-trash xoa_icon"></i>
                    </button>
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
                <td class="chucNang">
                    <button class="sua" type="submit">
                        <span class="sua_tieuDe">Sửa</span>
                        <i class="fa-solid fa-pencil sua_icon"></i>
                    </button>
                    <button class="xoa" type="submit">
                        <span class="xoa_tieuDe">Xóa</span>
                        <i class="fa-solid fa-trash xoa_icon"></i>
                    </button>
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
                <td class="chucNang">
                    <button class="sua" type="submit">
                        <span class="sua_tieuDe">Sửa</span>
                        <i class="fa-solid fa-pencil sua_icon"></i>
                    </button>
                    <button class="xoa" type="submit">
                        <span class="xoa_tieuDe">Xóa</span>
                        <i class="fa-solid fa-trash xoa_icon"></i>
                    </button>
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
                <td class="chucNang">
                    <button class="sua" type="submit">
                        <span class="sua_tieuDe">Sửa</span>
                        <i class="fa-solid fa-pencil sua_icon"></i>
                    </button>
                    <button class="xoa" type="submit">
                        <span class="xoa_tieuDe">Xóa</span>
                        <i class="fa-solid fa-trash xoa_icon"></i>
                    </button>
                </td>
            </tr>
            </tbody>
        </table>

        <!-- Them sinh vien dialog -->
        <div class="modal js-modal">
            <div class="modal-container js-modal-container">
                <div class="modal-close js-modal-close">
                    <i class = "ti-close"></i>
                </div>
                <!-- modal header -->
                <header class="modal-header">
                    <i class="modal-heading-icon ti-user"></i>
                    Thêm sinh viên
                </header>
                <!-- modal body -->
                <div class="modal-body">
                    <label for="" class="modal-label">
                        Mã sinh viên
                    </label>
                    <input type="text" class="modal-input" placeholder="Nhập mã ...">

                    <label for="" class="modal-label">
                        Tên sinh viên
                    </label>
                    <input  type="text" class="modal-input" placeholder="Nhập tên ...">

                    <label for="" class="modal-label">
                        Email
                    </label>
                    <input type="email" class="modal-input" placeholder="Điền email .. ">


                    <label for="" class="modal-label">
                        Ngày sinh
                    </label>
                    <input  type="date" class="modal-input" >

                    <label for= "" class="modal-label">
                        Giới tính
                    </label>
                    <select  class="modal-input" required>
                        <option value="">Please select</option>
                        <option value="Class A">Nam</option>
                        <option value="Class B">Nữ</option>
                    </select>

                    <label for="" class="modal-label">
                        Số điện thoại
                    </label>
                    <input  type="text" class="modal-input" placeholder="Nhập số điện thoại ...">



                    <label for= "" class="modal-label">
                        Lớp hành chính
                    </label>
                    <select id="" class="modal-input" required>
                        <option value="">Please select</option>
                        <option value="Class A">Class A</option>
                        <option value="Class B">Class B</option>
                        <option value="Class C">Class C</option>
                    </select>
                </div>
                <!-- modal footer -->
                <div class="modal-footer">
                    <button class="buy-btn">
                        Thêm
                    </button>
                </div>
            </div>
        </div>



        <script src="./assets/js/menu.js"></script>
        <script src="./assets/js/listSV.js"></script>
        <script src="./assets/js/themSV.js"></script>
    </div>
</body>
</html>
