<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.json.*" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.apache.http.entity.StringEntity" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.impl.client.HttpClientBuilder" %>
<%@ page import="java.io.IOException" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <%@include file="../menu/admin_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/student.css">
    <link rel="stylesheet" href="../../../assets/css/add_student_form.css">
    <link rel="stylesheet" href="../../../assets/css/update_student_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/css/confirm_delete_form.css">
    <title>Sinh viên</title>
</head>
<body>
<%@include file="../menu/admin_menu.jsp" %>

<%
    HttpClient httpClient = HttpClientBuilder.create().build();
    String uri = "http://localhost:8080/api/admin/home/student";
    String requestBody ="{"+
            "\"idSv\":\"\","+
            "\"tenSv\":\"\","+
            "\"baseRequest\":{"+
            "\"sortField\":\"\","+
            "\"sortOrder\":\"\","+
            "\"pageIndex\":1,"+
            "\"pageSize\":10"+
            "}"+
            "}";


    HttpPost httpPost = new HttpPost(uri);
    StringEntity entity = new StringEntity(requestBody);
    httpPost.setEntity(entity);

    String value="JSESSIONID=";
    HttpSession getSession = request.getSession();
    String cookieValue = (String) getSession.getAttribute("cookie_value");
    httpPost.setHeader("Cookie",value+cookieValue);

    JSONArray listResp = getAllSv(httpClient,httpPost);

%>

<%!
    // Hàm Refresh lại trang lấy sv
    public JSONArray getAllSv(HttpClient httpClient, HttpPost httpPost) throws IOException {
        HttpResponse resp  = httpClient.execute(httpPost);
        String responseBody = EntityUtils.toString(resp.getEntity());

        JSONObject jsonResponse = new JSONObject(responseBody);
         return jsonResponse.getJSONArray("data");
    }
%>

<%
    String uriUpdate = "http://localhost:8080/api/admin/home/student/create-or-edit";
    String idSvUpdate=request.getParameter("ma-sv-sua");
    String tenSvUpdate=request.getParameter("ten-sv-sua");
    String emailSvUpdate=request.getParameter("email-sv-sua");
    String dobUpdate=request.getParameter("dob-sv-sua");
    String genderSvUpdate=request.getParameter("gioi-tinh-sv-sua");
    String phoneSvUpdate=request.getParameter("sdt-sv-sua");
    String lopHanhChinhSvUpdate=request.getParameter("ma-lop-sv-sua");
    String requestBodyUpdate ="{"+
            "\"status\":1,"+
            "\"idSv\":\""+idSvUpdate+"\","+
            "\"tenSv\":\""+tenSvUpdate+"\","+
            "\"emailSv\":\""+emailSvUpdate+"\","+
            "\"dobSv\":\""+dobUpdate+"\","+
            "\"genderSv\":\""+genderSvUpdate+"\","+
            "\"phoneSv\":\""+phoneSvUpdate+"\","+
            "\"lopHanhChinhSv\":\""+lopHanhChinhSvUpdate+"\""+
            "}";

    if (idSvUpdate!=null && tenSvUpdate!=null && emailSvUpdate!=null && dobUpdate!=null && genderSvUpdate!=null && phoneSvUpdate!=null && lopHanhChinhSvUpdate!=null){
        HttpPost httpPostUpdate = new HttpPost(uriUpdate);
        StringEntity entityUpdate = new StringEntity(requestBodyUpdate);
        httpPostUpdate.setEntity(entityUpdate);

        httpPostUpdate.setHeader("Cookie",value+cookieValue);
        // send the request and retrieve the response
        HttpResponse respUpdate = httpClient.execute(httpPostUpdate);
        String responseBodyUpdate = EntityUtils.toString(respUpdate.getEntity());
        System.out.println(responseBodyUpdate);

        // get all sinh vien
         listResp = getAllSv(httpClient,httpPost);
    }
%>
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
        <table id="myTable" class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable('idSv', this)" class="cot-maSV">Mã SV</th>
            <th data-sort onclick="sortTable('tenSv', this)" class="cot-tenSV">Họ và tên</th>
            <th class="cot-emailSV">Email</th>
            <th class="cot-ngaySinhSV">Ngày sinh</th>
            <th data-sort onclick="sortTable('genderSv', this)" class="cot-gioiTinhSV">Giới tính</th>
            <th class="cot-sdtSV">Số điện thoại</th>
            <th data-sort onclick="sortTable('lopHanhChinhSv', this)" class="cot-lopSV">Lớp hành chính</th>
            <th data-sort onclick="sortTable('ngayTao', this)" class="cot-ngayTao">Ngày tạo</th>
            <th data-sort onclick="sortTable('ngaySua', this)" class="cot-ngayTao">Ngày cập nhật</th>
            <th class="hanh-dong">Action</th>
            </thead>
            <tbody>
                <%     for(int i=0;i<listResp.length();i++){%>
                <% JSONObject student = listResp.getJSONObject(i);
                    String idSv = student.getString("idSv");
                    String tenSv = student.getString("tenSv");
                    String emailSv = student.getString("emailSv");
                    String dobSv = student.getString("dobSv");
                    String genderSv = student.getString("genderSv");
                    String phoneSv = student.getString("phoneSv");
                    String lopHanhChinhSv = student.getString("lopHanhChinhSv");
                    String ngayTao = student.getString("ngayTao");
                    String ngaySua = student.getString("ngaySua");
                %>
                <tr>
                    <td><%= idSv %></td>
                    <td><%= tenSv %></td>
                    <td><%= emailSv %></td>
                    <td><%= dobSv %></td>
                    <td><%= genderSv %></td>
                    <td><%= phoneSv %></td>
                    <td><%= lopHanhChinhSv %></td>
                    <td><%= ngayTao %></td>
                    <td><%= ngaySua %></td>
                    <td class="chucNang">
                        <div class="hop-hanh-dong">
                            <button class="sua hop-hanh-dong-nut" type="button" onclick="showModalSua('modal_sinh_vien_sua',
                                    '<%= idSv %>',
                                    '<%= tenSv %>',
                                    '<%= emailSv %>',
                                    '<%= dobSv %>',
                                    '<%= genderSv %>',
                                    '<%= phoneSv %>',
                                    '<%= lopHanhChinhSv %>')">
                                <span class="sua_tieuDe">Sửa</span>
                                <i class="fa-solid fa-pencil sua_icon"></i>
                            </button>

                            <button onclick="hienXacNhanXoa('modal_xac_nhan_xoa', '<%= idSv %>')" class="xoa hop-hanh-dong-nut" type="button">
                                <span class="xoa_tieuDe">Xóa</span>
                                <i class="fa-solid fa-trash xoa_icon"></i>
                            </button>
                        </div>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
    <div class="phanTrang">
        <ul>
            <li class="nutPaginate prev" style="color: white">
                <span><i class="fas fa-angle-left"></i></span>
            </li>
            <span class="soTrang">

            </span>
            <li class="nutPaginate next" style="color: white">
                <span><i class="fas fa-angle-right"></i></span>
            </li>
        </ul>
    </div>
    <!-- Them sinh vien dialog -->
    <%@include file="add_student_form.jsp" %>
    <%@include file="update_student_form.jsp" %>
    <%@include file="confirm_delete_student.jsp"%>
</div>
</body>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/student.js"></script>
<script src="../../../assets/js/add_form.js"></script>
<script src="../../../assets/js/update_student.js"></script>
<script src="../../../assets/js/text_error_student.js"></script>
</html>
