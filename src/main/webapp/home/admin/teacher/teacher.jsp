<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.*" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.json.*" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.apache.http.entity.StringEntity" %>
<%@ page import="org.apache.http.impl.client.HttpClientBuilder" %>
<%@ page import="org.apache.http.client.methods.HttpDelete" %>
<%@ page import="org.apache.http.client.utils.URIBuilder" %>
<%@ page import="java.net.URI" %>

<html>
<head>
    <%@include file="../menu/admin_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/admin/teacher.css">
    <link rel="stylesheet" href="../../../assets/css/admin/add_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/admin/update_teacher_form.css">
    <link rel="stylesheet" href="../../../assets/css/pagination.css">
    <link rel="stylesheet" href="../../../assets/css/admin/confirm_delete_form.css">
    <title>Giảng viên</title>
</head>
<%
    HttpClient httpClient = HttpClientBuilder.create().build();

    // get session id
    String value="JSESSIONID=";
    HttpSession getSession = request.getSession();
    String cookieValue = (String) getSession.getAttribute("cookie_value");

    // variables in request body
    String tenGv="";
    String sortField="";
    String sortOrder="";
    int pageIndex=1;
    int pageSize=10;
    int totalPages;

    // request body for getAll, finding and sorting
    String requestBody ="{"+
            "\"tenGv\":\"" + tenGv + "\","+
            "\"baseRequest\":{"+
            "\"sortField\":\"" + sortField + "\","+
            "\"sortOrder\":\"" + sortOrder + "\","+
            "\"pageIndex\":" + pageIndex + ","+
            "\"pageSize\":" + pageSize +
            "}"+
            "}";
%>
<body>
<%@include file="../menu/admin_menu.jsp" %>
<div class="manHinhChinh">
    <%
        //get all
        String uriGetAll = "http://localhost:8080/api/admin/home/teacher";

        //
        HttpPost httpPost = new HttpPost(uriGetAll);
        StringEntity entity = new StringEntity(requestBody);
        httpPost.setEntity(entity);

        httpPost.setHeader("Cookie",value+cookieValue);

        // send the request and retrieve the response
        HttpResponse resp = httpClient.execute(httpPost);
        String responseBody = EntityUtils.toString(resp.getEntity());
        System.out.println(responseBody);

        JSONObject jsonResponse = new JSONObject(responseBody);
        JSONArray listResp = jsonResponse.getJSONArray("data");
        System.out.println(listResp.length());
        for(int i=0; i<listResp.length(); i++){
            JSONObject teacher = listResp.getJSONObject(i);
            System.out.println(teacher.toString());
        }
    %>
    <%
        // add GV
        String uriAddGV = "http://localhost:8080/api/admin/home/teacher/create-or-edit";
        String idGv = request.getParameter("ma-gv");
        String nameGv = request.getParameter("ten-gv");
        String emailGv = request.getParameter("email-gv");
        String genderGv = request.getParameter("gioi-tinh-gv");
        String sdtGv = request.getParameter("sdt-gv");
        String idKhoa = request.getParameter("ma-khoa-gv");
        String requestBodyAddGV ="{"+
                "\"idGv\":\"" + idGv + "\","+
                "\"tenGv\":\"" + nameGv + "\","+
                "\"sdtGv\":\"" + sdtGv + "\","+
                "\"emailGv\":\"" + emailGv + "\","+
                "\"genderGv\":\"" + genderGv + "\","+
                "\"idKhoa\":\"" + idKhoa + "\"" +
                "}";

        // send the request and retrieve the response
        if(idGv!=null && nameGv!=null && emailGv!=null && genderGv!=null && sdtGv!=null && idKhoa!=null) {
            System.out.println(requestBodyAddGV);

            HttpPost httpPostAddGV = new HttpPost(uriAddGV);
            StringEntity entityAddGV = new StringEntity(requestBodyAddGV);
            httpPostAddGV.setEntity(entityAddGV);

            httpPostAddGV.setHeader("Cookie",value+cookieValue);

            HttpResponse respAddGV = httpClient.execute(httpPostAddGV);
            String responseBodyAddGV = EntityUtils.toString(respAddGV.getEntity());
            System.out.println(responseBodyAddGV);

            JSONObject jsonResponseAddGV = new JSONObject(responseBodyAddGV);
            System.out.println(jsonResponseAddGV);

            // get all giang vien
            resp=httpClient.execute(httpPost);
            responseBody = EntityUtils.toString(resp.getEntity());
            jsonResponse = new JSONObject(responseBody);
            listResp = jsonResponse.getJSONArray("data");
            for(int i=0; i<listResp.length(); i++) {
                JSONObject teacher = listResp.getJSONObject(i);
                System.out.println(teacher.toString());
            }
        }
    %>
    <%
        // update GV
        String uriUpdateGV = "http://localhost:8080/api/admin/home/teacher/create-or-edit";
        String idGvU = request.getParameter("ma-gv-sua");
        String tenGvU = request.getParameter("ten-gv-sua");
        String emailGvU = request.getParameter("email-gv-sua");
        String genderGvU = request.getParameter("gioi-tinh-gv-sua");
        String sdtGvU = request.getParameter("sdt-gv-sua");
        String idKhoaU = request.getParameter("ma-khoa-gv-sua");
        String requestBodyUpdateGV ="{"+
                "\"idGv\":\"" + idGvU + "\","+
                "\"tenGv\":\"" + tenGvU + "\","+
                "\"sdtGv\":\"" + sdtGvU + "\","+
                "\"emailGv\":\"" + emailGvU + "\","+
                "\"genderGv\":\"" + genderGvU + "\","+
                "\"idKhoa\":\"" + idKhoaU + "\"" +
                "}";
        // send the request and retrieve the response
        if(idGvU!=null && tenGvU!=null && emailGvU!=null && genderGvU!=null && sdtGvU!=null && idKhoaU!=null) {
            System.out.println(requestBodyUpdateGV);

            HttpPost httpPostUpdateGV = new HttpPost(uriUpdateGV);
            StringEntity entityUpdateGV = new StringEntity(requestBodyUpdateGV);
            httpPostUpdateGV.setEntity(entityUpdateGV);

            httpPostUpdateGV.setHeader("Cookie",value+cookieValue);

            HttpResponse respUpdateGV = httpClient.execute(httpPostUpdateGV);
            String responseBodyUpdateGV = EntityUtils.toString(respUpdateGV.getEntity());
            System.out.println(responseBodyUpdateGV);

            JSONObject jsonResponseUpdateGV = new JSONObject(responseBodyUpdateGV);
            System.out.println(jsonResponseUpdateGV);

            // get all giang vien
            resp=httpClient.execute(httpPost);
            responseBody = EntityUtils.toString(resp.getEntity());
            jsonResponse = new JSONObject(responseBody);
            listResp = jsonResponse.getJSONArray("data");
            for(int i=0; i<listResp.length(); i++) {
                JSONObject teacher = listResp.getJSONObject(i);
                System.out.println(teacher.toString());
            }
        }
    %>
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
<%--            hiển thị ra màn hình--%>
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
                        <button class="sua hop-hanh-dong-nut" type="button" onclick="showModalSua('modal_giang_vien_sua', '<%= teacher.getString("idGv") %>' , '<%= teacher.getString("tenGv") %>', '<%= teacher.getString("sdtGv") %>','<%=  teacher.getString("emailGv") %>','<%= teacher.getString("genderGv") %>','<%= teacher.getString("idKhoa") %>')">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                        <button onclick="hienXacNhanXoa('modal_xac_nhan_xoa', '<%= teacher.getString("idGv") %>')" class="xoa hop-hanh-dong-nut" type="button">
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

</body>
    <script src="../../../assets/js/menu.js"></script>
    <script src="../../../assets/js/admin/add_form.js"></script>
    <script src="../../../assets/js/admin/update_teacher.js"></script>
    <script src="../../../assets/js/admin/text_error_teacher.js"></script>
    <script src="../../../assets/js/admin/confirm_delete_form.js"></script>
</html>