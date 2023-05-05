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
    HttpPost httppost = new HttpPost("http://www.a-domain.example/foo/");
    List<NameValuePair> params = new ArrayList<NameValuePair>(2);
    params.add(new BasicNameValuePair("tenGv", "12345"));
    params.add(new BasicNameValuePair("sortField", "id_gv"));
    params.add(new BasicNameValuePair("sortOrder", "asc"));
    params.add(new BasicNameValuePair("pageSize", "12345"));
    params.add(new BasicNameValuePair("pageIndex", "12345"));

%>
</body>
</html>