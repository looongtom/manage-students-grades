package com.example.quanlysv.servlet.dto.request.lop;

public class LopDTO {
    private String idLop,tenLop,idKhoa;
    private Long ngayTao,ngaySua;

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
