<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.impl.client.HttpClientBuilder" %>
<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.entity.StringEntity" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="java.io.IOException" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
  <%@include file="../menu/admin_menu_header.jsp" %>
  <title>Danh sách lớp</title>
  <link rel="stylesheet" href="../../../assets/fonts/fontawesome-free-6.3.0-web/css/all.min.css">
  <link rel="stylesheet" href="../../../assets/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="../../../assets/css/admin/class.css">
  <link rel="stylesheet" href="../../../assets/css/admin/add_class_form.css">
  <link rel="stylesheet" href="../../../assets/css/pagination.css">
  <link rel="stylesheet" href="../../../assets/css/page_404.css">
  <link rel="stylesheet" href="../../../assets/css/admin/update_class_form.css">
  <link rel="stylesheet" href="../../../assets/css/admin/confirm_delete_form.css">
</head>

<body>
<%
  HttpClient httpClient = HttpClientBuilder.create().build();

  // get session id
  String value = "JSESSIONID=";
  HttpSession getSession = request.getSession();
  String cookieValue = (String) getSession.getAttribute("cookie_value");

  // variables in request body
  String khoa = request.getParameter("khoa");
  String tenLop = "";
  String sortField = "";
  String sortOrder = "";
  int pageSize = 10;
    System.out.println("khoa:"+ khoa);
  int pageIndex = 1;
  if(session.getAttribute("pageIndexLop")!=null) {
    pageIndex = (int) session.getAttribute("pageIndexLop");
  }

  System.out.println(session.getAttribute("pageIndexLop"));
  System.out.println("pageIndex in class.jsp: " + pageIndex);
  System.out.println("pageSize in class.jsp: " + pageSize);

  // request body for getAll, finding and sorting
  String requestBody ="{"+
          "\"idKhoa\":\"" + khoa + "\","+
          "\"tenLop\":\"" + tenLop + "\","+
          "\"baseRequest\":{"+
          "\"sortField\":\"" + sortField + "\","+
          "\"sortOrder\":\"" + sortOrder + "\","+
          "\"pageIndex\":" + pageIndex + ","+
          "\"pageSize\":" + pageSize +
          "}"+
          "}";

  // get baseUrl
  ServletContext context = request.getServletContext();
  String baseUrl = context.getInitParameter("apiUrl");

  //get all
  String uriGetAll = baseUrl + "/admin/class";

  HttpPost httpPost = new HttpPost(uriGetAll);
  StringEntity entity = new StringEntity(requestBody);
  httpPost.setEntity(entity);

  httpPost.setHeader("Cookie", value + cookieValue);

  // call function, return data
  JSONArray listResp;
%>

<%!
  int totalPages;

  // Hàm Refresh lại trang lấy lớp
  public JSONArray getAllLop(HttpClient httpClient, HttpPost httpPost) throws IOException {
    HttpResponse resp  = httpClient.execute(httpPost);
    String responseBody = EntityUtils.toString(resp.getEntity());
    JSONObject jsonResponse = new JSONObject(responseBody);
    if(jsonResponse.getInt("status")==200) {
      totalPages = jsonResponse.getInt("totalPages");
      return jsonResponse.getJSONArray("data");
    } else {
      return null;
    }
  }
%>
<%
    // add lop
    String uriAddLop = baseUrl + "/admin/home/class";
    String idlop = request.getParameter("ma");
    String namelop = request.getParameter("ten");
    String idHk = request.getParameter("ten-hk");
//    String idKhoa = request.getParameter("ma-khoa-gv");
    String requestBodyAddLop = "{"+
            "\"status\":\"" + 0 + "\","+
            "\"idLop\":\"" + idlop + "\","+
            "\"tenLop\":\"" + namelop + "\","+
            "\"idHk\":\"" + idHk + "\","+
            "\"idKhoa\":\"" + khoa + "\"" +
            "}";

    boolean exist = false;
// send the request and retrieve the response
    if(idlop!=null && namelop!=null && idHk!=null ) {
        System.out.println(requestBodyAddLop);

        HttpPost httpPostAddLop = new HttpPost(uriAddLop);
//      HttpPost httpPostAddGV = new HttpPost(uriAddGV);
        StringEntity entityAddLop = new StringEntity(requestBodyAddLop);
        httpPostAddLop.setEntity(entityAddLop);

        httpPostAddLop.setHeader("Cookie",value+cookieValue);

        HttpResponse respAddLop = httpClient.execute(httpPostAddLop);
        String responseBodyAddLop = EntityUtils.toString(respAddLop.getEntity());
        System.out.println(responseBodyAddLop);

        JSONObject jsonResponseAddLop = new JSONObject(responseBodyAddLop);

        // check if the data is existed or not
        if (jsonResponseAddLop.getInt("status") != 200) {
            exist = true;
        }

        // get all mon hoc
        if(!exist) {
            listResp = getAllLop(httpClient, httpPost);
        }
    }
%>
<%
    // update lop
    String uriUpdatelop = baseUrl + "/admin/home/class";
    String idlopU = request.getParameter("ma-lop-sua");
    String tenlopU = request.getParameter("ten-lop-sua");
    String idHkU = request.getParameter("hoc-ky-sua");

    String requestBodyUpdatelop ="{"+
            "\"status\":\"" + 1 + "\","+
            "\"idLop\":\"" + idlopU + "\","+
            "\"tenLop\":\"" + tenlopU + "\","+
            "\"idHk\":\"" + idHkU + "\","+
            "\"idKhoa\":\"" + khoa + "\"" +
            "}";
// send the request and retrieve the response
    if(idlopU!=null && tenlopU!=null && idHkU != null ) {
        System.out.println(requestBodyUpdatelop);

        HttpPost httpPostUpdatelop = new HttpPost(uriUpdatelop);
        StringEntity entityUpdatelop = new StringEntity(requestBodyUpdatelop);
        httpPostUpdatelop.setEntity(entityUpdatelop);

        httpPostUpdatelop.setHeader("Cookie",value+cookieValue);

        HttpResponse respUpdatelop = httpClient.execute(httpPostUpdatelop);
        String responseBodyUpdatelop = EntityUtils.toString(respUpdatelop.getEntity());
        System.out.println(responseBodyUpdatelop);

        JSONObject jsonResponseUpdatelop = new JSONObject(responseBodyUpdatelop);
        System.out.println(jsonResponseUpdatelop);

        // get all lop
        listResp = getAllLop(httpClient, httpPost);
    }
%>
<%
  // tìm kiếm
  tenLop = request.getParameter("nhapTimKiem");
  if(tenLop==null) tenLop = "";
  System.out.println("Ten Lop tim kiem: " + tenLop);
  requestBody = "{"+
          "\"idKhoa\":\"" + khoa + "\","+
          "\"tenLop\":\"" + tenLop + "\","+
          "\"baseRequest\":{"+
          "\"sortField\":\"" + sortField + "\","+
          "\"sortOrder\":\"" + sortOrder + "\","+
          "\"pageIndex\":" + pageIndex + ","+
          "\"pageSize\":" + pageSize +
          "}"+
          "}";
  entity = new StringEntity(requestBody);
  httpPost.setEntity(entity);
  listResp = getAllLop(httpClient, httpPost);

  // return UTF8
  byte[] bytes = tenLop.getBytes(StandardCharsets.ISO_8859_1);
  tenLop = new String(bytes, StandardCharsets.UTF_8);
%>
<%
    // sort
    sortField = request.getParameter("sortFieldLop");
    sortOrder = request.getParameter("sortOrderLop");
    if(sortField!=null) {
        tenLop = request.getParameter("tenLop");
        if(tenLop==null) tenLop = "";
        System.out.println("Ten Lop sort: " + tenLop);

        requestBody = "{"+
                "\"idKhoa\":\"" + khoa + "\","+
                "\"tenLop\":\"" + tenLop + "\","+
                "\"baseRequest\":{"+
                "\"sortField\":\"" + sortField + "\","+
                "\"sortOrder\":\"" + sortOrder + "\","+
                "\"pageIndex\":" + pageIndex + ","+
                "\"pageSize\":" + pageSize +
                "}"+
                "}";
        entity = new StringEntity(requestBody);
        httpPost.setEntity(entity);

        System.out.println("Sort Field: " + sortField);
        System.out.println("Sort Order: " + sortOrder);
        System.out.println("Ten Lop sort: " + tenLop);
        listResp = getAllLop(httpClient, httpPost);

        // return UTF8
        bytes = tenLop.getBytes(StandardCharsets.ISO_8859_1);
        tenLop = new String(bytes, StandardCharsets.UTF_8);
    }
%>
<div class="lop">
  <header class="phanlop-header">
    <div class="lop-tieuDe">Danh sách các lớp khoa
        <% if(khoa.equals("CNTT")) { %>
        <span id="lop-tieuDe-chiTiet">Công nghệ thông tin</span>
        <% } else if(khoa.equals("ATTT")) { %>
        <span id="lop-tieuDe-chiTiet">An toàn thông tin</span>
        <% } else if(khoa.equals("VT")) { %>
        <span id="lop-tieuDe-chiTiet">Viễn thông 1</span>
        <% } else if(khoa.equals("TCKT")) { %>
        <span id="lop-tieuDe-chiTiet">Tài chính kế toán</span>
        <% } else if(khoa.equals("QTKD")) { %>
        <span id="lop-tieuDe-chiTiet">Quản trị kinh doanh</span>
        <% } else if(khoa.equals("KTDT")) { %>
        <span id="lop-tieuDe-chiTiet">Kỹ thuật điện tử 1</span>
        <% } else if(khoa.equals("DPT")) { %>
        <span id="lop-tieuDe-chiTiet">Đa phương tiện</span>
        <% } else if(khoa.equals("CB")) { %>
        <span id="lop-tieuDe-chiTiet">Cơ bản</span>
        <% } %>
    </div>

    <div class="phanlop-close js-phanlop-close" class="back" onclick="location.href='../specialization/specialization.jsp'">
      Khoa Chuyên Môn
    </div>
  </header>
  <div class="themVaTimKiem">
    <!-- nut them lop -->
    <button id="nut_them_lop" onclick="showModal('modal_lop')" class="nutThemlop js-nutThemlop" type="button">
      <span class="nutThemlop_tieuDe">Thêm lớp</span>
      <i class="fa-solid fa-plus"></i>
    </button>
    <form class="timKiem" method="post">
      <div class="tieuDeTimKiem">Tìm kiếm lớp: </div>
      <input type="search" id="nhapTimKiem" name="nhapTimKiem" placeholder="Nhập tên lớp" >
      <button class="nutTimKiem" type="submit">
        <span class="nutTimKiem_tieuDe">Tìm</span>
        <i class="fa-solid fa-magnifying-glass"></i>
      </button>
    </form>
  </div>

  <div class="boc-bang">
      <form id="formlop" method="post" action="/admin/class" accept-charset="UTF-8">
          <input type="hidden" name="tenLop" value="<%= tenLop %>">
          <input type="hidden" name="khoa" value="<%= khoa %>">
          <input type="hidden" name="sortFieldLop" value="<%= sortField %>">
          <input type="hidden" name="sortOrderLop" value="<%= sortOrder %>">
          <input type="hidden" name="pageIndexLop" value="<%= pageIndex %>">
          <input type="hidden" name="pageSizeLop" value="<%= pageSize %>">

          <table class="danhSach">
              <thead class="hang1">
              <th data-sort onclick="sortTable('idlop', this)" class="cot-malop idlop">Mã lớp</th>
              <th data-sort onclick="sortTable('tenlop',this)" class="cot-tenlop tenlop">Tên lớp</th>
              <th data-sort onclick="sortTable('idHk',this)" class="cot-tenHK idHk">Mã học kỳ</th>
<%--              <th data-sort onclick="sortTable('idKhoa', this)" class="cot-khoa idKhoa">Khoa</th>--%>
              <th data-sort onclick="sortTable('ngayTao', this)" class="cot-ngayTao ngayTao">Ngày tạo</th>
              <th data-sort onclick="sortTable('ngaySua', this)" class="cot-ngayTao ngaySua">Ngày cập nhật</th>
              <th class="hanh-dong">Action</th>
              </thead>
              <tbody>
              <%--            hiển thị ra màn hình--%>
              <%  if(listResp!=null) {
                for(int i=0;i<listResp.length();i++) {%>
              <% JSONObject lop = listResp.getJSONObject(i); %>
              <tr>
                <td><%= lop.getString("idLop") %></td>
                <td><%= lop.getString("tenLop") %></td>
                <td><%= lop.getString("idHk") %></td>
                <td><%= lop.getString("ngayTao") %></td>
                <td><%= lop.getString("ngaySua") %></td>
                <td class="chucNang">
                  <div class="hop-hanh-dong">
                    <a href="../grade/view-grade.jsp?idLop=<%=lop.getString("idLop")%>&khoa=<%=khoa%>">
                      <button class="xem hop-hanh-dong-nut" type="button">
                        <span class="sua_tieuDe">Xem điểm</span>
                        <i class="fa-solid fa-eye sua_icon"></i>
                      </button>
                    </a>
                  </div>
                  <div class="hop-hanh-dong">
                    <button class="sua hop-hanh-dong-nut" type="button"
                            onclick="showModalSua('modal_lop_sua', '<%= lop.getString("idLop") %>', '<%= lop.getString("tenLop") %>', '<%= lop.getString("idHk") %>')">
                      <span class="sua_tieuDe">Sửa</span>
                      <i class="fa-solid fa-pencil sua_icon"></i>
                    </button>
                  </div>
                </td>
              </tr>
              <%
                  }
                }
              %>
              </tbody>
          </table>
      </form>
  </div>
  <div class="phanTrang">
    <ul>
        <li class="nutPaginate prev" style="color: white" onclick="nutPrev()">
            <span><i class="fas fa-angle-left"></i></span>
        </li>
        <span class="soTrang"></span>
        <li class="nutPaginate next" style="color: white" onclick="nutNext()">
            <span><i class="fas fa-angle-right"></i></span>
        </li>
    </ul>
  </div>
</div>
<%@include file="add_class_form.jsp" %>
<%@include file="confirm_delete_class.jsp" %>
<%@include file="update_class_form.jsp" %>


</body>
<script src="../../../assets/js/pagination.js"></script>
<script>
    // Kiểm tra xem lúc thêm lớp thì id, mã hay email đã tồn tại chưa?
    if(<%= exist %>) {
        alert("Mã lớp, Tên lớp đó đã tồn tại!");
    }

    // do lúc gửi đoạn sort nó hay load lại trang dẫn đến không kịp lưu lại class, hàm này dùng để lấy session đã lưu
    // trong TeacherSessionController, gán nó vào class để hiển thị giao diện mũi tên là đang sort theo cột nào, asc hay desc
    if('${sessionScope.sortFieldLop}'!=='null' && '${sessionScope.sortFieldLop}'!=='') {
        var getTd = document.querySelector('.${sessionScope.sortFieldLop}');
        const asc = '${sessionScope.sortOrderLop}'==='desc';
        getTd.classList[asc ? 'remove' : 'add']('asc');
        getTd.classList[asc ? 'add' : 'remove']('desc');
    }

    // hàm sort cột
    function sortTable(field, event) {
        const tenLopInput = document.querySelector('input[name="tenLop"]');
        const sortFieldInput = document.querySelector('input[name="sortFieldLop"]');
        const sortOrderInput = document.querySelector('input[name="sortOrderLop"]');
        const pageIndexInput = document.querySelector('input[name="pageIndexLop"]');

        const thead=document.querySelector('thead');
        const hData=[...thead.querySelectorAll('th')]

        hData.map((head) => {
            if(head!==event) {
                head.classList.remove('asc', 'desc')
            }
        });

        if (sortFieldInput.value === field) {
            const asc = sortOrderInput.value === "asc"
            event.classList[asc ? 'remove' : 'add']('asc');
            event.classList[asc ? 'add' : 'remove']('desc');
            sortOrderInput.value = sortOrderInput.value === "asc" ? "desc" : "asc";
        } else {
            event.classList.add('asc');
            sortFieldInput.value = field;
            sortOrderInput.value = "asc";
        }

        // sau khi sort, quay trở lại trang đầu tiên
        pageIndexInput.value = 1;

        // Lấy phần tên trong khu vực tìm kiếm (nếu có)
        console.log('Tên lớp trước khi gán giá trị: ' + tenLopInput.value);
        console.log('Nhập tìm kiếm: ' + document.querySelector('#nhapTimKiem').value);
        if(document.querySelector('#nhapTimKiem').value!==null) {
            tenLopInput.value = document.querySelector('#nhapTimKiem').value;
        }
        // Submit the form
        document.getElementById("formlop").submit();
    }

    // tạo UI phân trang
    createPaginationUI(<%= totalPages %>, <%= pageIndex %>);

    // nút chuyển sang trang trước đó
    function nutPrev() {
        const pageIndexInput = document.querySelector('input[name="pageIndexLop"]');
        console.log('Page Index Before: ' + pageIndexInput.value);

        // Kiểm tra xem hiện tại có đang ở trang đầu tiên k
        if(pageIndexInput.value>1) {
            pageIndexInput.value--;
            document.getElementById("formlop").submit();
        }
    }

    // nút chuyển sang trang tiếp theo
    function nutNext() {
        const sortFieldInput = document.querySelector('input[name="sortFieldLop"]');
        const sortOrderInput = document.querySelector('input[name="sortOrderLop"]');
        const pageIndexInput = document.querySelector('input[name="pageIndexLop"]');

        // Kiểm tra session xem có đang sort cột nào k
        if('${sessionScope.sortFieldLop}'!=='null' && '${sessionScope.sortFieldLop}'!=='') {
            sortFieldInput.value = '${sessionScope.sortFieldLop}';
            sortOrderInput.value = '${sessionScope.sortOrderLop}';
        } else {
            sortFieldInput.value = '';
            sortOrderInput.value = '';
        }

        // Kiểm tra xem hiện tại có đang ở trang cuối cùng k
        if(+pageIndexInput.value < <%= totalPages %>) {
            pageIndexInput.value = +pageIndexInput.value + 1;
            document.getElementById("formlop").submit();
        }
    }

    // nút chọn 1 trang
    function nutTrang(page) {
        const sortFieldInput = document.querySelector('input[name="sortFieldLop"]');
        const sortOrderInput = document.querySelector('input[name="sortOrderLop"]');
        const pageIndexInput = document.querySelector('input[name="pageIndexLop"]');

        // Kiểm tra session xem có đang sort cột nào k
        if('${sessionScope.sortFieldLop}'!=='null' && '${sessionScope.sortFieldLop}'!=='') {
            sortFieldInput.value = '${sessionScope.sortFieldLop}';
            sortOrderInput.value = '${sessionScope.sortOrderLop}';
        } else {
            sortFieldInput.value = '';
            sortOrderInput.value = '';
        }

        pageIndexInput.value = page;
        document.getElementById("formlop").submit();
    }

</script>
<%--    <script src="../../../assets/js/admin/pagination_class.js"></script>--%>
    <script src="../../../assets/js/admin/add_form.js"></script>
<%--    <script src="../../../assets/js/admin/class.js"></script>--%>
    <script src="../../../assets/js/admin/text_error_class.js"></script>
    <script src="../../../assets/js/admin/update_class.js"></script>
    <script src="../../../assets/js/admin/confirm_delete_form.js"></script>
</html>
