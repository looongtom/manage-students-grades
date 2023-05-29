<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="../menu/user_menu_header.jsp" %>
    <link rel="stylesheet" href="../../../assets/css/user/home_user.css">
    <title>Trang chủ</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("../../../assets/images/student_study_user.jpg");
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }
        h1{
            font-size: 30px;
            text-align: center;
            padding: 10px;
        }
        .container {
            max-width: 100%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: row;
            font-size: larger;
            line-height: 2;
        }

        .cot_trai {
            flex: 30%;
            padding: 20px;
        }

        .cot_phai {
            flex: 70%;
            padding: 20px;
        }

        .thong_tin_sv {
            margin-bottom: 15px;
        }

        .label {
            font-weight: bold;
        }

        .value {
            margin-left: 10px;
        }

        .thong_tin_tk {
            margin-top: 20px;
        }

        .form-nhom {
            margin-bottom: 10px;
        }

        .form-nhom label {
            display: block;
            font-weight: bold;
        }

        .form-nhom input {
            width: 100%;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .cap-nhat-button button {
            position: relative;
            display: inline-block;
            text-align: center;
            cursor: pointer;
            border-radius: 8px;
            color: #fff;
            border-color: #cc0d00;
            background: #cc0d00;
            padding: 5px;
        }
    </style>
</head>
<body>
    <%@include file="../menu/user_menu.jsp" %>

    <div class="manHinhChinh">

        <h1 class = "tieuDeTrang">Quản lý thông tin tài khoản</h1>

        <div class="container">
            <div class="cot_trai">
                <h2>Thông tin tài khoản</h2>
                <div class="thong_tin_sv">
                    <span>
                        <i class ="ti-id-badge"></i>
                    </span>
                    <span class="label">Mã sinh viên:</span>
                    <span class="value">${student.idSv}</span>
                </div>

                <div class="thong_tin_sv">
                    <i class ="ti-user"></i>
                    <span class="label">Tên sinh viên:</span>
                    <span class="value">${student.tenSv}</span>
                </div>

                <div class="thong_tin_sv">
                    <i class ="ti-email"></i>
                    <span class="label">Email:</span>
                    <span class="value">${student.emailSv}</span>
                </div>

                <div class="thong_tin_sv">
                    <i class ="ti-calendar"></i>
                    <span class="label">Ngày sinh:</span>
                    <span class="value">${student.dobSv}</span>
                </div>

                <div class="thong_tin_sv">
                    <i class ="ti-infinite"></i>
                    <span class="label">Giới tính:</span>
                    <span class="value">${student.genderSv}</span>
                </div>

                <div class="thong_tin_sv">
                    <i class ="ti-mobile"></i>
                    <span class="label">Số điện thoại:</span>
                    <span class="value">${student.phoneSv}</span>
                </div>

                <div class="thong_tin_sv">
                    <i class ="ti-bag"></i>
                    <span class="label">Lớp hành chính:</span>
                    <span class="value">${student.lopHanhChinhSv}</span>
                </div>
            </div>
            <div class="cot_phai">
                <h2>Cập nhật thông tin</h2>
                <div class="thong_tin_tk">
                    <% String errorMessage = (String) request.getAttribute("error");
                        if (errorMessage != null) { %>
                    <div style="color: red"><%= errorMessage %></div>
                    <% } %>
                    <form action="/user/update-user" method="post" >
                        <div class="form-nhom">
                            <label for="username">Tên sinh viên</label>
                            <input type="text" id="username" value="${student.tenSv}" disabled>
                        </div>

                        <div class="form-nhom">
                            <label for="date">Ngày sinh: </label>
                            <input type="date" id="date" value="${student.dobSv}" disabled>
                        </div>

                        <div class="form-nhom">
                            <label for="phone">Số điện thoại:</label>
                            <input type="text" id="phone" name = "phone" value="${student.phoneSv}" required >
                        </div>

                        <div class="form-nhom">
                            <label for="email">Email:</label>
                            <input type="email" id="email"  name = "email" value="${student.emailSv}" required>
                        </div>

                        <div class="cap-nhat-button">
                            <button type = "submit">Cập nhật</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script src="../../../assets/js/menu.js"></script>
</html>
