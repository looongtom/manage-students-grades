package com.example.quanlysv.servlet.dto.request.teacher;

public class TeacherDTO {
    private String idGv,tenGv,sdtGv,emailGv,genderGv,idKhoa;
    private Long ngayTao,ngaySua;

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

    public void setNgayTao(Long ngayTao) {
        this.ngayTao = ngayTao;
    }

    public Long getNgaySua() {
        return ngaySua;
    }

    public void setNgaySua(Long ngaySua) {
        this.ngaySua = ngaySua;
    }
}