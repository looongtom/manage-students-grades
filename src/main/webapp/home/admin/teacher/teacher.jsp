<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.apache.http.client.HttpClient" %>
<%@ page import="org.apache.http.impl.client.HttpClients" %>
<%@ page import="org.apache.http.client.methods.HttpPost" %>
<%@ page import="org.apache.http.NameValuePair" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.apache.http.message.BasicNameValuePair" %>
<%@ page import="org.apache.http.client.entity.UrlEncodedFormEntity" %>
<%@ page import="org.apache.http.HttpResponse" %>
<%@ page import="org.apache.http.HttpEntity" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.http.client.methods.HttpGet" %>
<%@ page import="org.apache.http.client.utils.URIBuilder" %>
<%@ page import="java.net.URI" %>
<%@ page import="org.apache.http.Header" %>
<%@ page import="org.apache.http.util.EntityUtils" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="com.example.quanlysv.servlet.entity.TeacherEntity" %>
<%@ page import="com.fasterxml.jackson.core.type.TypeReference" %>
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
<%
    HttpClient httpclient = HttpClients.createDefault();
    String endpointUrl = "http://localhost:8080/api/home/teacher/";
    List<NameValuePair> params = new ArrayList<>();
    params.add(new BasicNameValuePair("tenGv", ""));
    params.add(new BasicNameValuePair("sortField", "id_gv"));
    params.add(new BasicNameValuePair("sortOrder", "asc"));
    params.add(new BasicNameValuePair("pageSize", "10"));
    params.add(new BasicNameValuePair("pageIndex", "1"));

    URI uri = new URIBuilder("http://localhost:8080/api/home/teacher")
            .setParameter("tenGv", "")
            .setParameter("sortField", "id_gv")
            .setParameter("sortOrder", "asc")
            .setParameter("pageSize", "2")
            .setParameter("pageIndex", "1")
            .build();
    //    uriBuilder.addParameters(params);
//    URI uri = uriBuilder.build();

    // create the HttpGet request with the specified URI
    HttpGet httpGet = new HttpGet(uri);
    String value="JSESSIONID=";
    // set request headers
    HttpSession getSession = request.getSession();
    String cookieName = (String) getSession.getAttribute("cookie_name");
    String cookieValue = (String) getSession.getAttribute("cookie_value");
    System.out.println("Cookie"+cookieName);
    System.out.println("cookieValue: "+cookieValue);

//    httpGet.setHeader("User-Agent", "Mozilla/5.0");
    httpGet.setHeader("Cookie",value+cookieValue);

    // send the request and retrieve the response
    HttpResponse resp = httpclient.execute(httpGet);

    int statusCode = resp.getStatusLine().getStatusCode();
    String responseBody = EntityUtils.toString(resp.getEntity());

//    ObjectMapper objectMapper = new ObjectMapper();
//    List<TeacherEntity> teacherEntities = objectMapper.readValue(responseBody, new TypeReference<List<TeacherEntity>>() {});
//    for (TeacherEntity teacher : teacherEntities) {
//        System.out.println(teacher.toString());
//    }
    System.out.println("Response status code: " + statusCode);
    System.out.println("Response body: " + responseBody);
%>
</body>
</html>