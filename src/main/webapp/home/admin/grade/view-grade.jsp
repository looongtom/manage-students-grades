<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.*" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.json.*" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.apache.http.entity.StringEntity" %>
<%@ page import="org.apache.http.impl.client.HttpClientBuilder" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URI" %>
<%@ page import="org.apache.http.client.utils.URIBuilder" %>
<html>
<head>
    <%@include file="../menu/admin_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/admin/view_grade.css">
    <link rel="stylesheet" href="../../../assets/css/admin/update_grade_form.css">
    <title>Danh sách điểm</title>
</head>
<%
    ServletContext context = request.getServletContext();
    String baseUrl = context.getInitParameter("apiUrl");
    String khoa = request.getParameter("khoa");
%>

<%
    HttpClient httpClient = HttpClientBuilder.create().build();

    // get session id
    String value = "JSESSIONID=";
    HttpSession getSession = request.getSession();
    String cookieValue = (String) getSession.getAttribute("cookie_value");

    String getIdLopFromClassJSP = request.getParameter("idLop");

    // variables in request body
    String idLop = getIdLopFromClassJSP;
    String sortField = "";
    String sortOrder = "";
    int pageSize = 80;

    int pageIndex = 1;
    if (session.getAttribute("pageIndexSV") != null) {
        pageIndex = (int) session.getAttribute("pageIndexSV");
    }

    // request body for getAll, finding and sorting
    String requestBodyDiem = "{" +
            "\"idLop\":\"" + idLop + "\"," +
            "\"baseRequest\":{" +
            "\"sortField\":\"" + sortField + "\"," +
            "\"sortOrder\":\"" + sortOrder + "\"," +
            "\"pageIndex\":" + pageIndex + "," +
            "\"pageSize\":" + pageSize +
            "}" +
            "}";

    String requestBodyThanhPhan ="";
%>
<body>
<%@include file="../menu/menu_view_grade.jsp" %>
<div class="manHinhChinh">
    <%--     Hàm Refresh lại trang lấy sinh vien--%>
    <%!
        public JSONArray getAllDiem(HttpClient httpClient, HttpPost httpPost) throws IOException {
            HttpResponse resp = httpClient.execute(httpPost);
            String responseBody = EntityUtils.toString(resp.getEntity());
            JSONObject jsonResponse = new JSONObject(responseBody);
            if (jsonResponse.getInt("status") == 200) {
                return jsonResponse.getJSONArray("data");
            } else {
                return null;
            }
        }
    %>
    <%--        Lấy tất cả điểm sv của lớp--%>
    <%
        String idDiem="";
        String uriGetAll = "http://localhost:8080/api/admin/grade/view";
        List<String>listTenSv = new ArrayList<>();
        JSONArray listResp = new JSONArray();
        HttpPost httpPost = new HttpPost();
        try{
            httpPost = new HttpPost(uriGetAll);
            StringEntity entity = new StringEntity(requestBodyDiem);
            httpPost.setEntity(entity);

            httpPost.setHeader("Cookie", value + cookieValue);

            listResp = getAllDiem(httpClient, httpPost);
            JSONObject diem = listResp.getJSONObject(1);
            idDiem = diem.getString("idDiem"); // set idDiem

            for (int i = 0; i < listResp.length(); i++) {
                JSONObject infoDiem = listResp.getJSONObject(i);
                String idSv= infoDiem.getString("idSv");
                URI uriGetInfoSV = new URIBuilder("http://localhost:8080/api/admin/home/student").setParameter("idSv",idSv).build();

                try{
                    HttpGet httpGet = new HttpGet(uriGetInfoSV);

                    httpGet.setHeader("Cookie", value + cookieValue);

                    HttpResponse resp = httpClient.execute(httpGet);
                    String responseData = EntityUtils.toString(resp.getEntity());
                    ObjectMapper objectMapper = new ObjectMapper();
                    JsonNode jsonNode = objectMapper.readTree(responseData);
                    JsonNode thongTinSv = jsonNode.get("data");
                    listTenSv.add( String.valueOf( thongTinSv.get("tenSv").asText() ) );
                }catch (Exception e){

                }

            }
        }catch (Exception e){

        }
    %>
    <%--    Lấy hệ số thành phần--%>
    <%
        URI uriGetHeSoTP = new URIBuilder("http://localhost:8080/api/admin/thanh-phan/get").setParameter("idDiem",idDiem).build();
        JsonNode heSoThanhPhan = null;
        Integer hesoDiemCc = null;
        Integer hesoDiemBt = null;
        Integer hesoDiemThi = null;
        Integer hesoDiemKt = null;
        try{
            HttpGet httpGet = new HttpGet(uriGetHeSoTP);
            httpGet.setHeader("Cookie", value + cookieValue);

            HttpResponse resp = httpClient.execute(httpGet);
            String responseData = EntityUtils.toString(resp.getEntity());

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(responseData);
            heSoThanhPhan = jsonNode.get("data");

            hesoDiemCc = Integer.valueOf(heSoThanhPhan.get("diemCc").asInt());
            hesoDiemBt = Integer.valueOf(heSoThanhPhan.get("diemBt").asInt());
            hesoDiemThi = Integer.valueOf(heSoThanhPhan.get("diemThi").asInt());
            hesoDiemKt = Integer.valueOf(heSoThanhPhan.get("diemKt").asInt());
        }catch (Exception e){

        }


    %>
    <%--    Chuyển sang điểm hệ 4--%>
    <%!
        public Double ConvertDiemTB( Double x) {
            if(Double.compare(4.0,x)>0)return 0.0;
            else if(Double.compare(5.0,x)>0)return 1.0;
            else if(Double.compare(5.5,x)>0)return 1.5;
            else if(Double.compare(6.5,x)>0)return 2.0;
            else if(Double.compare(7.0,x)>0)return 2.5;
            else if(Double.compare(8.0,x)>0)return 3.0;
            else if(Double.compare(8.5,x)>0)return 3.5;
            else if(Double.compare(9.0,x)>0)return 3.7;
            return 4.0;
        }
    %>
    <%--    Chuyển sang trạng thái--%>
    <%!
        public String ConvertTrangThai ( Double x ){
            if(Double.compare(1.0,x)>0)return "Trượt môn";
            return "Qua môn";
        }
    %>
    <%--    Chuyển sang điểm chữ--%>
    <%!
        public String ConvertDiemChu (Double x){
            Double tolerance = 0.001;
            if(Math.abs( 0.0 - x ) <= tolerance) return "F";
            else if(Math.abs( 1.0 - x ) <= tolerance)return "D";
            else if(Math.abs( 1.5 - x ) <= tolerance)return "D+";
            else if(Math.abs( 2.0 - x ) <= tolerance)return "C";
            else if(Math.abs( 2.5 - x ) <= tolerance)return "C+";
            else if(Math.abs( 3.0 - x ) <= tolerance)return "B";
            else if(Math.abs( 3.5 - x ) <= tolerance)return "B+";
            else if(Math.abs( 3.7 - x ) <= tolerance)return "A";
            return "A+";
        }
    %>

    <%!
        public Boolean CheckDiem0(Double cc, Double bt, Double kt, Double thi){
            return cc == 0 || bt == 0 || kt == 0 || thi == 0;
        }
    %>

    <%--    update diem--%>
    <%
        String uriUpdateDiem = baseUrl + "/admin/grade/update";
        String idDiemUpdate = request.getParameter("id-diem-sua");
        String idGvUpdate = request.getParameter("id-gv-sua");
        String idMhUpdate = request.getParameter("id-mh-sua");
        String idSvUpdate = request.getParameter("id-sv-sua");
        String idHkUpdate = request.getParameter("id-hk-sua");
        String idLopUpdate = request.getParameter("id-lop-sua");

        String diemCcUpdateString = (request.getParameter("diem-cc-sua"));
        String diemBtUpdateString = (request.getParameter("diem-bt-sua"));
        String diemThiUpdateString = (request.getParameter("diem-thi-sua"));
        String diemKtUpdateString = (request.getParameter("diem-kt-sua"));

        Double diemCcUpdate = -1.0;
        Double diemBtUpdate = -1.0;
        Double diemThiUpdate = -1.0;
        Double diemKtUpdate = -1.0;



        try {
            if(diemCcUpdateString!= null && Double.parseDouble(diemCcUpdateString)>=0)diemCcUpdate = Double.valueOf(diemCcUpdateString);
            if(diemBtUpdateString!= null && Double.parseDouble(diemBtUpdateString)>=0)diemBtUpdate = Double.valueOf(diemBtUpdateString);
            if(diemThiUpdateString!= null && Double.parseDouble(diemThiUpdateString)>=0)diemThiUpdate = Double.valueOf(diemThiUpdateString);
            if(diemKtUpdateString!= null && Double.parseDouble(diemKtUpdateString)>=0)diemKtUpdate = Double.valueOf(diemKtUpdateString);
        } catch (NumberFormatException e) {

        }

        if ( diemCcUpdate >=0 && diemBtUpdate >=0 && diemThiUpdate >=0 && diemKtUpdate >=0) {
//        if (idDiemUpdate != null && idGvUpdate != null && idMhUpdate != null
//                && idSvUpdate != null && idHkUpdate != null  && idLopUpdate != null) {
            String requestUpdateDiem ="{"+
                    "\"idDiem\":\"" + idDiemUpdate + "\"," +
                    "\"idGv\":\"" + idGvUpdate + "\"," +
                    "\"idMh\":\"" + idMhUpdate + "\"," +
                    "\"idSv\":\"" + idSvUpdate + "\"," +
                    "\"idHk\":\"" + idHkUpdate + "\"," +
                    "\"idLop\":\"" + idLopUpdate + "\"," +
                    "\"diemCc\":" + diemCcUpdate + "," +
                    "\"diemBt\":" +diemBtUpdate + "," +
                    "\"diemThi\":" +diemThiUpdate + "," +
                    "\"diemKt\":" +diemKtUpdate +
                    "}";


            HttpPost httpPostUpdateDiem = new HttpPost(uriUpdateDiem);
            StringEntity entityUpdateDiem = new StringEntity(requestUpdateDiem);
            httpPostUpdateDiem.setEntity(entityUpdateDiem);

            httpPostUpdateDiem.setHeader("Cookie", value + cookieValue);


            HttpResponse respUpdateSV = httpClient.execute(httpPostUpdateDiem);
            String responseBodyUpdateSV = EntityUtils.toString(respUpdateSV.getEntity());
            // get all sinh vien
            listResp = getAllDiem(httpClient, httpPost);
        }
    %>
    <h1 class="tieuDeTrang">Danh sách điểm lớp: <%=getIdLopFromClassJSP%></h1>

    <div class="boc-bang">
        <table class="danhSach" id="excelTable">
            <thead class="hang1">
            <th data-sort onclick="sortTable(0, this)" class="cot-maSV">Mã sinh viên</th>
            <th data-sort onclick="sortTable(1, this)" class="cot-tenSV">Tên sinh viên</th>
            <th data-sort onclick="sortName(2,this)" class="cot-Diem">Chuyên cần</th>
            <th data-sort onclick="sortTable(3, this)" class="cot-Diem">Bài tập</th>
            <th data-sort onclick="sortTable(4, this)" class="cot-Diem">Cuối kì</th>
            <th data-sort onclick="sortTable(5, this)" class="cot-Diem">Kiểm tra</th>
            <th data-sort onclick="sortTable(6, this)" class="cot-Diem">Tổng kết</th>
            <th data-sort onclick="sortTable(7, this)" class="cot-Diem">Điểm chữ</th>

            <th data-sort onclick="sortTable(8, this)" class="cot-Diem">Thời gian tạo</th>
            <th data-sort onclick="sortTable(9, this)" class="cot-Diem">Thời gian sửa</th>

            <th data-sort onclick="sortTable(10, this)" class="cot-Trangthai">Trạng thái</th>
            <th class="hanh-dong">Action</th>

            </thead>
            <tbody>
            <% DecimalFormat decimalFormat = new DecimalFormat("#0.0");%>
            <% if(listResp!=null){
                for (int i = 0; i < listResp.length(); i++) {%>
            <% JSONObject diemTungHang = listResp.getJSONObject(i);
                Boolean checkZero = false;
                Double diemCc = diemTungHang.getDouble("diemCc");
                Double diemBt = diemTungHang.getDouble("diemBt");
                Double diemThi = diemTungHang.getDouble("diemThi");
                Double diemKt = diemTungHang.getDouble("diemKt");
                Double diemTb = ConvertDiemTB( (diemCc*hesoDiemCc+diemBt*hesoDiemBt+diemThi*hesoDiemThi+diemKt*hesoDiemKt)/100 ) ;
//                System.out.println((diemCc*hesoDiemCc+diemBt*hesoDiemBt+diemThi*hesoDiemThi+diemKt*hesoDiemKt)/100+" "+diemTb);
                String diemChu = ConvertDiemChu(diemTb);
                checkZero=CheckDiem0(diemCc,diemBt,diemThi,diemKt);
                String trangThai ;
                if (checkZero) trangThai="Trượt môn";
                else trangThai = ConvertTrangThai(diemTb);
                String tenSv= listTenSv.get(i);
            %>
            <tr>
                <td class="cot-maSV"><%=diemTungHang.getString("idSv") %></td>
                <td class="cot-tenSV"> <%=tenSv%></td>
                <td class="cot-Diem"><%= decimalFormat.format(diemCc)%></td>
                <td class="cot-Diem"><%= decimalFormat.format(diemBt)%></td>
                <td class="cot-Diem"><%= decimalFormat.format(diemThi)%></td>
                <td class="cot-Diem"><%= decimalFormat.format(diemKt) %></td>
                <td class="cot-Diem"><%= decimalFormat.format(diemTb) %></td>
                <td class="cot-Diem"><%= diemChu %></td>
                <td class="cot-Diem"><%= diemTungHang.getString("ngayTao") %></td>
                <td class="cot-Diem"><%= diemTungHang.getString("ngaySua") %></td>
                <td class="cot-Trangthai" id="<%= trangThai.equals("Qua môn") ? "ttQua" : "ttTruot" %>"><%=trangThai %></td>
                <td class="chucNang">
                    <div class="hop-hanh-dong">
                        <button class="sua hop-hanh-dong-nut" type="button" onclick="showModalSua('modal_sua_diem', '<%=idDiem%>', '<%=diemTungHang.getString("idSv")%>', '<%=diemCc%>','<%=diemBt%>', '<%=diemThi%>', '<%=diemKt%>', '<%=diemTungHang.getString("idMh")%>','<%=diemTungHang.getString("idHk")%>','<%=diemTungHang.getString("idLop")%>','<%=diemTungHang.getString("idGv")%>')">
                            <span class="sua_tieuDe">Sửa</span>
                            <i class="fa-solid fa-pencil sua_icon"></i>
                        </button>
                    </div>
                </td>
            </tr>
            <% }
            }%>
            </tbody>
        </table>
    </div>
    <%@include file="update_grade_form.jsp" %>

</div>

</body>

<script>
    function exportToExcel() {
        var table = document.getElementById("excelTable");
        var sheetName = "Sheet1";

        // Clone the table and remove the last column
        var tableClone = table.cloneNode(true);
        var rows = tableClone.rows;
        for (var i = 0; i < rows.length; i++) {
            var cells = rows[i].cells;
            cells[cells.length - 1].remove();
        }

        var workbook = XLSX.utils.table_to_book(tableClone, { sheet: sheetName });
        var workbookOutput = XLSX.write(workbook, { bookType: 'xlsx', bookSST: true, type: 'array' });

        var blob = new Blob([workbookOutput], {
            type: "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
        });

        var url = URL.createObjectURL(blob);

        var a = document.createElement("a");
        a.href = url;
        a.download = "File điểm lớp <%=idLop%>.xlsx";
        a.click();
    }
</script>
<script src="../../../assets/js/menu.js"></script>
<script src="../../../assets/js/admin/update_grade.js"></script>
<script src="../../../assets/js/admin/text_error_grade.js"></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>


</html>
