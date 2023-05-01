package com.example.quanlysv.servlet.entity;

public class SubjectEntity {
    private String idMh;
    private String tenMonHoc;
    private Integer tinChi;
    private String idKhoa;

    private String tenKhoa;

    private Long ngayTao;

    private Long ngaySua;

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

    public String getIdMh() {
        return idMh;
    }

    public void setIdMh(String idMh) {
        this.idMh = idMh;
    }

    public String getTenMonHoc() {
        return tenMonHoc;
    }

    public void setTenMonHoc(String tenMonHoc) {
        this.tenMonHoc = tenMonHoc;
    }

    public Integer getTinChi() {
        return tinChi;
    }

    public void setTinChi(Integer tinChi) {
        this.tinChi = tinChi;
    }

    public String getIdKhoa() {
        return idKhoa;
    }

    public void setIdKhoa(String idKhoa) {
        this.idKhoa = idKhoa;
    }

    public String getTenKhoa() {
        return tenKhoa;
    }

    public void setTenKhoa(String tenKhoa) {
        this.tenKhoa = tenKhoa;
    }
}
