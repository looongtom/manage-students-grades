package com.example.quanlysv.servlet.entity;

import java.time.Instant;

public class TeacherEntity {
    private String idGv,tenGv,sdtGv,emailGv,genderGv,idKhoa;
    private Long ngayTao,ngaySua;
    public Long GetCurrentTime(Instant instant){
        Long timestamp = instant.toEpochMilli();
        return timestamp;
    }
    public TeacherEntity(){

    }
    public TeacherEntity(String idGv, String tenGv, String sdtGv, String emailGv, String genderGv, String idKhoa, Long ngayTao, Long ngaySua) {
        this.idGv = idGv;
        this.tenGv = tenGv;
        this.sdtGv = sdtGv;
        this.emailGv = emailGv;
        this.genderGv = genderGv;
        this.idKhoa = idKhoa;
        this.ngayTao = ngayTao;
        this.ngaySua = ngaySua;
    }

    public String getIdGv() {
        return idGv;
    }

    public void setIdGv(String idGv) {
        this.idGv = idGv;
    }

    public String getTenGv() {
        return tenGv;
    }

    public void setTenGv(String tenGv) {
        this.tenGv = tenGv;
    }

    public String getSdtGv() {
        return sdtGv;
    }

    public void setSdtGv(String sdtGv) {
        this.sdtGv = sdtGv;
    }

    public String getEmailGv() {
        return emailGv;
    }

    public void setEmailGv(String emailGv) {
        this.emailGv = emailGv;
    }

    public String getGenderGv() {
        return genderGv;
    }

    public void setGenderGv(String genderGv) {
        this.genderGv = genderGv;
    }

    public String getIdKhoa() {
        return idKhoa;
    }

    public void setIdKhoa(String idKhoa) {
        this.idKhoa = idKhoa;
    }

    public Long getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Instant instant) {
        this.ngayTao = GetCurrentTime(instant);
    }

    public Long getNgaySua() {
        return ngaySua;
    }

    public void setNgaySua(Instant instant) {
        this.ngaySua = GetCurrentTime(instant);
    }
}
