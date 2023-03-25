package com.example.quanlysv.servlet.entity;

public class StudentEntity {
    private String idSv;
    private String tenSv;
    private String emailSv;
    private String dobSv;
    private String genderSv;
    private String phoneSv;
    private String lopHanhChinhSv;

    public StudentEntity() {
    }

    public StudentEntity(String idSv, String tenSv,
                         String emailSv, String dobSv, String genderSv,
                         String phoneSv, String lopHanhChinhSv) {
        this.idSv = idSv;
        this.tenSv = tenSv;
        this.emailSv = emailSv;
        this.dobSv = dobSv;
        this.genderSv = genderSv;
        this.phoneSv = phoneSv;
        this.lopHanhChinhSv = lopHanhChinhSv;
    }

    public String getIdSv() {
        return idSv;
    }

    public void setIdSv(String idSv) {
        this.idSv = idSv;
    }

    public String getTenSv() {
        return tenSv;
    }

    public void setTenSv(String tenSv) {
        this.tenSv = tenSv;
    }

    public String getEmailSv() {
        return emailSv;
    }

    public void setEmailSv(String emailSv) {
        this.emailSv = emailSv;
    }

    public String getDobSv() {
        return dobSv;
    }

    public void setDobSv(String dobSv) {
        this.dobSv = dobSv;
    }

    public String getGenderSv() {
        return genderSv;
    }

    public void setGenderSv(String genderSv) {
        this.genderSv = genderSv;
    }

    public String getPhoneSv() {
        return phoneSv;
    }

    public void setPhoneSv(String phoneSv) {
        this.phoneSv = phoneSv;
    }

    public String getLopHanhChinhSv() {
        return lopHanhChinhSv;
    }

    public void setLopHanhChinhSv(String lopHanhChinhSv) {
        this.lopHanhChinhSv = lopHanhChinhSv;
    }
}
