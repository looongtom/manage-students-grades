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
<%@ page import="com.example.quanlysv.servlet.entity.ThanhPhanEntity" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.quanlysv.servlet.dto.request.thanhphan.ThanhPhanDTO" %>
<%@ page import="com.fasterxml.jackson.databind.JsonNode" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URI" %>
<%@ page import="org.apache.http.client.utils.URIBuilder" %>
<html>
<head>
  <link rel="stylesheet" href="../../../assets/css/admin/view_grade.css">
  <%@include file="../menu/admin_menu_header.jsp" %>
  <title>Danh sách điểm</title>
</head>
<%
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
<%@include file="../menu/menu_view_grade_after_add.jsp" %>
<div class="manHinhChinh">
  <%!
    // Hàm Refresh lại trang lấy sinh vien
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
    try{
      HttpPost httpPost = new HttpPost(uriGetAll);
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
  <%!
    public String ConvertTrangThai ( Double x ){
      if(Double.compare(1.0,x)>0)return "Trượt môn";
      return "Qua môn";
    }
  %>
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
  <h1 class="tieuDeTrang">Danh sách điểm lớp: <%=getIdLopFromClassJSP%></h1>
  <div class="themVaTimKiem">
    <!-- nut them sinh vien -->
<%--    <a class="nutTimKiem" href="/api/admin/home/info-to-add-grade">Quay lại</a>--%>

    <%--        <div class="timKiem">--%>
    <%--            <div class="tieuDeTimKiem">Tìm kiếm: </div>--%>
    <%--            <input type="search" class="nhapTimKiem" placeholder="Nhập mã sinh viên">--%>
    <%--            <input type="search" class="nhapTimKiem" placeholder="Nhập trạng thái">--%>
    <%--            <button class="nutTimKiem">--%>
    <%--                <span class="nutTimKiem_tieuDe">Tìm</span>--%>
    <%--                <i class="fa-solid fa-magnifying-glass"></i>--%>
    <%--            </button>--%>
    <%--        </div>--%>
  </div>
  <div class="boc-bang">
    <table class="danhSach" >
      <thead class="hang1">
      <th data-sort onclick="sortTable(0, this)" class="cot-maSV">Mã sinh viên</th>
      <th data-sort onclick="sortTable(1, this)" class="cot-tenSV">Tên sinh viên</th>
      <th data-sort onclick="sortName(2,this)" class="cot-Diem">Chuyên cần</th>
      <th data-sort onclick="sortTable(3, this)" class="cot-Diem">Bài tập</th>
      <th data-sort onclick="sortTable(4, this)" class="cot-Diem">Cuối kì</th>
      <th data-sort onclick="sortTable(5, this)" class="cot-Diem">Kiểm tra</th>
      <th data-sort onclick="sortTable(6, this)" class="cot-Diem">Tổng kết</th>
      <th data-sort onclick="sortTable(7, this)" class="cot-Diem">Điểm chữ</th>
      <th data-sort onclick="sortTable(8, this)" class="cot-Trangthai">Trạng thái</th>

      </thead>
      <tbody>
      <% DecimalFormat decimalFormat = new DecimalFormat("#0.0");%>
      <% if(listResp!=null){
        for (int i = 0; i < listResp.length(); i++) {%>
      <% JSONObject diemTungHang = listResp.getJSONObject(i);
        Double diemCc = diemTungHang.getDouble("diemCc");
        Double diemBt = diemTungHang.getDouble("diemBt");
        Double diemThi = diemTungHang.getDouble("diemThi");
        Double diemKt = diemTungHang.getDouble("diemKt");
        Double diemTb = ConvertDiemTB( (diemCc*hesoDiemCc+diemBt*hesoDiemBt+diemThi*hesoDiemThi+diemKt*hesoDiemKt)/100 ) ;
        System.out.println((diemCc*hesoDiemCc+diemBt*hesoDiemBt+diemThi*hesoDiemThi+diemKt*hesoDiemKt)/100+" "+diemTb);
        String diemChu = ConvertDiemChu(diemTb);
        String trangThai = ConvertTrangThai(diemTb);
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
        <td class="cot-Trangthai" id="<%= trangThai.equals("Qua môn") ? "ttQua" : "ttTruot" %>"><%=trangThai %></td>
      </tr>
      <% }
      }%>
      </tbody>
    </table>
  </div>

</div>

</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../../../assets/js/menu.js"></script>
<script src="https://unpkg.com/xlsx/dist/xlsx.full.min.js"></script>
<script src="https://unpkg.com/file-saver/dist/FileSaver.min.js"></script>
<script>
  $(document).ready(function() {
    $('#exportBtn').click(function() {
      var table = $('.danhSach').get(0);
      var workbook = XLSX.utils.table_to_book(table);
      var workbookOutput = XLSX.write(workbook, { bookType: 'xlsx', bookSST: true, type: 'array' });
      var file = new Blob([workbookOutput], { type: 'application/octet-stream' });
      saveAs(file, 'table.xlsx');
    });
  });
</script>

</html>
