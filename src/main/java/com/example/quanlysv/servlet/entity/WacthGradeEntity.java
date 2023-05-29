package com.example.quanlysv.servlet.entity;

public class WacthGradeEntity {
    private int stt;

    private  String hocKy;

    private  String tenHocKy;



    private String tenMonHoc;
    private int soTinChi;


    private  int ptCC;
    private  int ptBT;
    private  int ptKT;
    private  int ptThi;

    private double diemCC;
    private double diemBT;
    private double diemKT;
    private double diemThi;

    private double diemTBthang10;
    private double diemTBthang4;
    private String diemTBdangChu;
    private String trangThai;
    private double GpaTichLuy;

    private double GpaTungKy;

    public double getGpaTichLuy() {
        return GpaTichLuy;
    }

    public void setGpaTichLuy(double gpaTichLuy) {
        GpaTichLuy = gpaTichLuy;
    }

    public double getGpaTungKy() {
        return GpaTungKy;
    }

    public void setGpaTungKy(double gpaTungKy) {
        GpaTungKy = gpaTungKy;
    }

    public int getPtCC() {
        return ptCC;
    }

    public void setPtCC(int ptCC) {
        this.ptCC = ptCC;
    }

    public int getPtBT() {
        return ptBT;
    }

    public void setPtBT(int ptBT) {
        this.ptBT = ptBT;
    }

    public int getPtKT() {
        return ptKT;
    }

    public void setPtKT(int ptKT) {
        this.ptKT = ptKT;
    }

    public int getPtThi() {
        return ptThi;
    }

    public void setPtThi(int ptThi) {
        this.ptThi = ptThi;
    }

    public int getStt() {
        return stt;
    }

    public void setStt(int stt) {
        this.stt = stt;
    }

    public String getHocKy() {
        return hocKy;
    }

    public void setHocKy(String hocKy) {
        this.hocKy = hocKy;
    }

    public String getTenHocKy() {
        return tenHocKy;
    }

    public void setTenHocKy(String tenHocKy) {
        this.tenHocKy = tenHocKy;
    }
    public String getTenMonHoc() {
        return tenMonHoc;
    }

    public void setTenMonHoc(String tenMonHoc) {
        this.tenMonHoc = tenMonHoc;
    }

    public int getSoTinChi() {
        return soTinChi;
    }

    public void setSoTinChi(int soTinChi) {
        this.soTinChi = soTinChi;
    }

    public double getDiemCC() {
        return diemCC;
    }

    public void setDiemCC(double diemCC) {
        this.diemCC = diemCC;
    }

    public double getDiemBT() {
        return diemBT;
    }

    public void setDiemBT(double diemBT) {
        this.diemBT = diemBT;
    }

    public double getDiemKT() {
        return diemKT;
    }

    public void setDiemKT(double diemKT) {
        this.diemKT = diemKT;
    }

    public double getDiemThi() {
        return diemThi;
    }

    public void setDiemThi(double diemThi) {
        this.diemThi = diemThi;
    }

    public double getDiemTBthang10() {
        return diemTBthang10;
    }

    public void setDiemTBthang10(double diemTBthang10) {
        this.diemTBthang10 = diemTBthang10;
    }

    public double getDiemTBthang4() {
        return diemTBthang4;
    }

    public void setDiemTBthang4(double diemTBthang4) {
        this.diemTBthang4 = diemTBthang4;
    }

    public String getDiemTBdangChu() {
        return diemTBdangChu;
    }

    public void setDiemTBdangChu(String diemTBdangChu) {
        this.diemTBdangChu = diemTBdangChu;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public WacthGradeEntity() {
    }

    public WacthGradeEntity(int stt, String hocKy, String tenHocKy, String tenMonHoc, int soTinChi, int ptCC, int ptBT, int ptKT, int ptThi, double diemCC, double diemBT, double diemKT, double diemThi, double diemTBthang10, double diemTBthang4, String diemTBdangChu, String trangThai, double gpaTichLuy, double gpaTungKy) {
        this.stt = stt;
        this.hocKy = hocKy;
        this.tenHocKy = tenHocKy;
        this.tenMonHoc = tenMonHoc;
        this.soTinChi = soTinChi;
        this.ptCC = ptCC;
        this.ptBT = ptBT;
        this.ptKT = ptKT;
        this.ptThi = ptThi;
        this.diemCC = diemCC;
        this.diemBT = diemBT;
        this.diemKT = diemKT;
        this.diemThi = diemThi;
        this.diemTBthang10 = diemTBthang10;
        this.diemTBthang4 = diemTBthang4;
        this.diemTBdangChu = diemTBdangChu;
        this.trangThai = trangThai;
        GpaTichLuy = gpaTichLuy;
        GpaTungKy = gpaTungKy;
    }

    @Override
    public String toString() {
        return "WacthGradeEntity{" +
                "stt=" + stt +
                ", hocKy='" + hocKy + '\'' +
                ", tenHocKy='" + tenHocKy + '\'' +
                ", tenMonHoc='" + tenMonHoc + '\'' +
                ", soTinChi=" + soTinChi +
                ", ptCC=" + ptCC +
                ", ptBT=" + ptBT +
                ", ptKT=" + ptKT +
                ", ptThi=" + ptThi +
                ", diemCC=" + diemCC +
                ", diemBT=" + diemBT +
                ", diemKT=" + diemKT +
                ", diemThi=" + diemThi +
                ", diemTBthang10=" + diemTBthang10 +
                ", diemTBthang4=" + diemTBthang4 +
                ", diemTBdangChu='" + diemTBdangChu + '\'' +
                ", trangThai='" + trangThai + '\'' +
                ", GpaTichLuy=" + GpaTichLuy +
                ", GpaTungKy=" + GpaTungKy +
                '}';
    }
}
