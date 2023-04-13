<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Nhập điểm</title>
</head>
<body>
<h2>Nhập điểm</h2>
<form method="post" action="/home/grade/create-or-edit" enctype="multipart/form-data">
    Vui lòng chọn file:
    <input type="file" name="file" size="60" /><br /><br />
    <label>idDiem</label>
    <input type="text" name="idDiem">
    <label>idGv</label>
    <input type="text" name="idGv">
    <label>idMh</label>
    <input type="text" name="idMh">
    <label>idHk</label>
    <input type="text" name="idHk">

    <input type="submit" value="Upload" />
</form>
</body>
</html>