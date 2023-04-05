package com.example.quanlysv.servlet.entity;

public class LopEntity {
    private String idLop,tenLop,idKhoa;
    public LopEntity(){

    }

    public LopEntity(String idLop, String tenLop, String idKhoa) {
        this.idLop = idLop;
        this.tenLop = tenLop;
        this.idKhoa = idKhoa;
    }

    public String getIdLop() {
        return idLop;
    }

    public void setIdLop(String idLop) {
        this.idLop = idLop;
    }

    public String getTenLop() {
        return tenLop;
    }

    public void setTenLop(String tenLop) {
        this.tenLop = tenLop;
    }

    public String getIdKhoa() {
        return idKhoa;
    }

    public void setIdKhoa(String idKhoa) {
        this.idKhoa = idKhoa;
    }
}