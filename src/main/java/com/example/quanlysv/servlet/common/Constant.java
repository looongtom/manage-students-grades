package com.example.quanlysv.servlet.common;

public class Constant {
    public static final String ADMIN ="ADMIN";
    public static final String USER ="USER";

    public static final String columnCreatedDate ="ngayTao";

    public static final String columnUpdatedDate ="ngaySua";

    public static final String dateFormat ="dd/MM/yyyy HH:mm:ss";


    // response api
    public static final int httpStatusOk = 200;

    public static final int httpStatusErrorServer = 500;

    public static final String messageSuccess ="success";

    public static final String messageFailed ="failed";

    public static final String messageBadRequest ="bad request";

    // response api student
    public static final String messageStudentExist ="idSv, email or phone existed!";
    public static final String messageStudentNotFound="student not found!";


    // response api hoc ki
    public static final String messageSemesterExist ="idHk, tenHocKy existed!";
    public static final String messageSemesterNotFound="student not found!";


}
