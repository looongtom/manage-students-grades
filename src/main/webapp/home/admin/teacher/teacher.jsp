<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="java.net.URI" %>
<%@ page import="org.apache.http.client.utils.URIBuilder" %>
<%@ page import="org.apache.http.impl.client.HttpClients" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.json.*" %>
<%@ page import="org.apache.http.util.EntityUtils" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/teacher.css">
    <link rel="stylesheet" href="../../../assets/css/add_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/update_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/css/confirm_delete_form.css">
    <title>Giảng viên</title>
</head>
<body>
<%@include file="../menu/menu.jsp" %>
<%
    //todo: mẫu url api
//    http://localhost:8080/api/home/teacher?tenGv=&sortField=id_gv&sortOrder=asc&pageSize=2&pageIndex=1
    HttpClient httpclient = HttpClients.createDefault();
    URI uri = new URIBuilder("http://localhost:8080/api/home/teacher")
            .setParameter("tenGv", "")
            .setParameter("sortField", "id_gv")
            .setParameter("sortOrder", "asc")
            .setParameter("pageSize", "3")
            .setParameter("pageIndex", "0")
            .build();
    //    uriBuilder.addParameters(params);
//    URI uri = uriBuilder.build();

    // create the HttpGet request with the specified URI
    HttpGet httpGet = new HttpGet(uri);
    String value="JSESSIONID=";
    // set request headers
    HttpSession getSession = request.getSession();
    String cookieValue = (String) getSession.getAttribute("cookie_value");
    httpGet.setHeader("Cookie",value+cookieValue);

    // send the request and retrieve the response
    HttpResponse resp = httpclient.execute(httpGet);
    String responseBody = EntityUtils.toString(resp.getEntity());

    System.out.println(responseBody);

    JSONObject jsonResponse = new JSONObject(responseBody);
    JSONArray listResp = jsonResponse.getJSONArray("data");

//    ObjectMapper objectMapper = new ObjectMapper();
//    List<TeacherEntityResponse> listTeacher=objectMapper.readValue("["+dataString+"]", new TypeReference<List<TeacherEntityResponse>>(){});
    System.out.println(listResp.length());
    for(int i=0;i<listResp.length();i++){
        JSONObject teacher = listResp.getJSONObject(i);
        System.out.println(teacher.toString());
    }
%>
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
            <input type="search" class="nhapTimKiem" placeholder="Nhập tên giảng viên">
            <button class="nutTimKiem" onclick="timKiemGV()">
                <span class="nutTimKiem_tieuDe">Tìm</span>
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </div>
    </div>

    <div class="boc-bang">
        <table id="myTable" class="danhSach">
            <thead class="hang1">
            <th data-sort onclick="sortTable('idGv', this)" class="cot-maGV">Mã GV</th>
            <th data-sort onclick="sortTable('tenGv', this)" class="cot-tenGV">Họ và tên</th>
            <th class="cot-sdtGV">Số điện thoại</th>
            <th class="cot-emailGV">Email</th>
            <th data-sort onclick="sortTable('genderGv', this)" class="cot-gioiTinhGV">Giới tính</th>
            <th data-sort onclick="sortTable('idKhoa', this)" class="cot-khoaGV">Khoa</th>
            <th data-sort onclick="sortTable('ngayTao', this)" class="cot-ngayTao">Ngày tạo</th>
            <th data-sort onclick="sortTable('ngaySua', this)" class="cot-ngayTao">Ngày cập nhật</th>
            <th class="hanh-dong">Action</th>
            </thead>
            <tbody>

            <%     for(int i=0;i<listResp.length();i++){%>
            <% JSONObject teacher = listResp.getJSONObject(i); %>
            <tr>
                <td><%= teacher.getString("idGv") %></td>
                <td><%= teacher.getString("tenGv") %></td>
                <td><%= teacher.getString("sdtGv") %></td>
                <td><%= teacher.getString("emailGv") %></td>
                <td><%= teacher.getString("genderGv") %></td>
                <td><%= teacher.getString("tenKhoa") %></td>
                <td><%= teacher.getString("ngayTao") %></td>
                <td><%= teacher.getString("ngaySua") %></td>
                </td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button" onclick="showModalSua('modal_giang_vien_sua', <%= teacher.getString("idGv") %> , <%= teacher.getString("tenGv") %>, <%= teacher.getString("sdtGv") %>,<%=  teacher.getString("emailGv") %>,<%= teacher.getString("genderGv") %>,<%= teacher.getString("idKhoa") %>)">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button onclick="hienXacNhanXoa('modal_xac_nhan_xoa', <%= teacher.getString("idGv") %>)" class="xoa hop-hanh-dong-nut" type="button">
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
</div>

<%@include file="../teacher/add_teacher_form.jsp" %>
<%@include file="../teacher/update_teacher_form.jsp" %>
<%@include file="../teacher/confirm_delete_teacher.jsp"%>

<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/teacher.js"></script>
<script src="../../../assets/js/text_error_teacher.js"></script>
<script src="../../../assets/js/add_teacher.js"></script>
<script src="../../../assets/js/update_teacher.js"></script>
<script src="../../../assets/js/confirm_delete_form.js"></script>

</body>
</html>