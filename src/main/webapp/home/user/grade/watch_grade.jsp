<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%@include file="../menu/user_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/user/watch_grade.css">
    <title>Xem điểm</title>
</head>
<body>

<%@include file="../menu/user_menu.jsp" %>
    <div class="manHinhChinh">

        <h1 class = "tieuDeTrang">Bảng điểm học phần</h1>

        <div class="scrollable-table">

            <table>
                <thead class = 'hang1'>
                    <tr>
                        <th>STT</th>
                        <th>HK</th>
                        <th>Tên môn </th>
                        <th>TC</th>
                        <th>%CC</th>
                        <th>%BT</th>
                        <th>%KT</th>
                        <th>%Thi</th>
                        <th>Điểm CC</th>
                        <th>Điểm BT</th>
                        <th>Điểm KT</th>
                        <th>Thi</th>
                        <th>TB(10)</th>
                        <th>TB(Chữ)</th>
                        <th>TB(4)</th>
                        <th>Trạng thái</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach items="${grades}" var="grade" varStatus="loop">
                        <tr>
                            <c:if test="${loop.last}">
                            </c:if>
                            <c:if test="${!loop.last}">
                                <td>${grade.stt}</td>
                                <td>${grade.hocKy}</td>
                                <td>${grade.tenMonHoc}</td>
                                <td>${grade.soTinChi}</td>
                                <td>${grade.ptCC}</td>
                                <td>${grade.ptBT}</td>
                                <td>${grade.ptKT}</td>
                                <td>${grade.ptThi}</td>
                                <td>${grade.diemCC}</td>
                                <td>${grade.diemBT}</td>
                                <td>${grade.diemKT}</td>
                                <td>${grade.diemThi}</td>
                                <td>${grade.diemTBthang10}</td>
                                <td>${grade.diemTBdangChu}</td>
                                <td>${grade.diemTBthang4}</td>
                                <td>${grade.trangThai}</td>
                            </c:if>
                        </tr>
                    </c:forEach>

                    <c:forEach items="${GpaByStudentId}" var="gpaBySemester">
                        <tr>
                            <td colspan="16"> GPA ${gpaBySemester.tenHocKy} (${gpaBySemester.hocKy}) : ${gpaBySemester.gpaTungKy} </td>
                        </tr>
                    </c:forEach>

                    <c:forEach items="${grades}" var="Gpa" varStatus="loop1">
                        <tr>
                            <c:if test="${loop1.last}">
                                <td colspan="16">GPA tích lũy: ${Gpa.gpaTichLuy} </td>
                            </c:if>
                        </tr>
                    </c:forEach>


                </tbody>

            </table>

        </div>
    </div>
</body>
<script src="../../../assets/js/menu.js"></script>
</html>