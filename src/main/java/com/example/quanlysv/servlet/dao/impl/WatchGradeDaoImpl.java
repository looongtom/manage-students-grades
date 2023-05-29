package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.IWatchGradeDAO;
import com.example.quanlysv.servlet.entity.GradeEntity;
import com.example.quanlysv.servlet.entity.WacthGradeEntity;
import java.sql.*;
import java.util.*;


public class WatchGradeDaoImpl  extends AbstractDao<GradeEntity>  implements IWatchGradeDAO {


    public Double LamTron2ChuSo(Double x)
    {
        return (double) Math.round(x *100)/100;
    }

    public Double LamTron1ChuSo(Double x)
    {
        return (double) Math.round(x * 10)/10;
    }

    public Boolean CheckDiem0(Double cc, Double bt, Double kt, Double thi){
        return cc == 0 || bt == 0 || kt == 0 || thi == 0;
    }
    public Double ConvertDiemTB( Double x) {
        if(Double.compare(4.0,x)>0)return 0.0;
        else if(Double.compare(5.0,x)>0)return 1.0;
        else if(Double.compare(5.5,x)>0)return 1.5;
        else if(Double.compare(6.5,x)>0)return 2.0;
        else if(Double.compare(7.0,x)>0)return 2.5;
        else if(Double.compare(8.0,x)>0)return 3.0;
        else if(Double.compare(8.5,x)>0)return 3.5;
        else if(Double.compare(9.0,x)>0)return 3.7;
        return 4.0;
    }

    public String ConvertTrangThai ( Double x ){
        if(Double.compare(1.0,x)>0)return "Trượt";
        return "Đạt";
    }
    public String ConvertDiemChu (Double x){
        Double tolerance = 0.001;
        if(Math.abs( 0.0 - x ) <= tolerance) return "F";
        else if(Math.abs( 1.0 - x ) <= tolerance)return "D";
        else if(Math.abs( 1.5 - x ) <= tolerance)return "D+";
        else if(Math.abs( 2.0 - x ) <= tolerance)return "C";
        else if(Math.abs( 2.5 - x ) <= tolerance)return "C+";
        else if(Math.abs( 3.0 - x ) <= tolerance)return "B";
        else if(Math.abs( 3.5 - x ) <= tolerance)return "B+";
        else if(Math.abs( 3.7 - x ) <= tolerance)return "A";
        return "A+";
    }
    ResourceBundle resourceBundle = ResourceBundle.getBundle("db");
    @Override
    public List<WacthGradeEntity> getGradeByStudentId(String studentId) {
        List<WacthGradeEntity> grades = new ArrayList<>();

        String url = resourceBundle.getString("url");
        String username = resourceBundle.getString("username");
        String password = resourceBundle.getString("password");
        String query = "SELECT DISTINCT  id_hk,ten_mon_hoc,tin_chi, diem_cc, diem_bt, diem_kt,diem_thi, chuyen_can, bai_tap,kiem_tra, thi  " +
                "FROM diem, monhoc, taikhoan , thanhphan " +
                "WHERE diem.id_sv =  ? and diem.id_mh = monhoc.id_mh and diem.id_diem = thanhphan.id_tp " +
                "ORDER BY id_hk ASC ";

        try (Connection con = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, studentId);
            ResultSet resultSet = statement.executeQuery();
            Integer stt = 1;
            double tongTinChi = 0;
            double tongDiemCacMon = 0;
            WacthGradeEntity Gpa = new WacthGradeEntity();
            while (resultSet.next()) {
                WacthGradeEntity grade = new WacthGradeEntity();
                String hocKy = resultSet.getString("id_hk");
                String tenMonHoc = resultSet.getString("ten_mon_hoc");
                Double diemBaiTap = resultSet.getDouble("diem_bt");
                Double diemChuyenCan = resultSet.getDouble("diem_cc");
                Double diemKiemTra = resultSet.getDouble("diem_kt");
                Double diemThi = resultSet.getDouble("diem_thi");

                Boolean checkZero = false;
                Integer soTinChi = resultSet.getInt("tin_chi");
                Integer ptChuyenCan = resultSet.getInt("chuyen_can");
                Integer ptBaiTap = resultSet.getInt("bai_tap");
                Integer ptKiemTra = resultSet.getInt("kiem_tra");
                Integer ptThi = resultSet.getInt("thi");
                Double diemTBthang10;
                Double diemTBthang4;
                String diemTBChu;
                String trangThai ;

                checkZero=CheckDiem0(diemChuyenCan,diemBaiTap,diemThi,diemKiemTra);
                if (checkZero) {
                    trangThai = "Trượt";
                    diemTBthang10 = 0.0;
                    diemTBthang4 = 0.0;
                    diemTBChu = ConvertDiemChu(diemTBthang4);
                }
                else {
                    diemTBthang10 = LamTron1ChuSo((diemChuyenCan*ptChuyenCan + diemBaiTap * ptBaiTap + diemThi * ptThi + diemKiemTra * ptKiemTra )/100);
                    diemTBthang4 = ConvertDiemTB(diemTBthang10);
                    trangThai = ConvertTrangThai(diemTBthang4);
                    diemTBChu = ConvertDiemChu(diemTBthang4);

                }

                tongTinChi += soTinChi;
                tongDiemCacMon += soTinChi * diemTBthang4;

                grade.setStt(stt);
                grade.setHocKy(hocKy);
                grade.setTenMonHoc(tenMonHoc);
                grade.setSoTinChi(soTinChi);
                grade.setPtCC(ptChuyenCan);
                grade.setPtBT(ptBaiTap);
                grade.setPtKT(ptKiemTra);
                grade.setPtThi(ptThi);
                grade.setDiemCC(diemChuyenCan);
                grade.setDiemBT(diemBaiTap);
                grade.setDiemKT(diemKiemTra);
                grade.setDiemThi(diemThi);
                grade.setDiemTBthang10(diemTBthang10);
                grade.setDiemTBdangChu(diemTBChu);
                grade.setDiemTBthang4(diemTBthang4);
                grade.setTrangThai(trangThai);
                stt++;
                grades.add(grade);
            }

            Gpa.setGpaTichLuy(LamTron2ChuSo(tongDiemCacMon/tongTinChi));
            grades.add(Gpa);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return grades;
    }

    @Override
    public List<WacthGradeEntity> getGpaByStudentId(String studentId) {
        List<WacthGradeEntity> gpas = new ArrayList<>();
        List<WacthGradeEntity>GpaByStudentId= new ArrayList<>();

        String url = resourceBundle.getString("url");
        String username = resourceBundle.getString("username");
        String password = resourceBundle.getString("password");
        String query = "SELECT DISTINCT  diem.id_hk ,ten_hoc_ky ,tin_chi, diem_cc, diem_bt, diem_kt,diem_thi, chuyen_can, bai_tap,kiem_tra, thi FROM diem, monhoc, taikhoan , thanhphan, hocky WHERE diem.id_sv =  ? and diem.id_mh = monhoc.id_mh and diem.id_diem = thanhphan.id_tp and diem.id_hk = hocky.id_hk ORDER BY id_hk ASC";

        try (Connection con = DriverManager.getConnection(url, username, password);
             PreparedStatement statement = con.prepareStatement(query)) {
            statement.setString(1, studentId);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                WacthGradeEntity gpa = new WacthGradeEntity();
                String hocKy = resultSet.getString("id_hk");
                String tenHocKy = resultSet.getString("ten_hoc_ky");
                Double diemBaiTap = resultSet.getDouble("diem_bt");
                Double diemChuyenCan = resultSet.getDouble("diem_cc");
                Double diemKiemTra = resultSet.getDouble("diem_kt");
                Double diemThi = resultSet.getDouble("diem_thi");

                Boolean checkZero = false;
                Integer soTinChi = resultSet.getInt("tin_chi");
                Integer ptChuyenCan = resultSet.getInt("chuyen_can");
                Integer ptBaiTap = resultSet.getInt("bai_tap");
                Integer ptKiemTra = resultSet.getInt("kiem_tra");
                Integer ptThi = resultSet.getInt("thi");

                Double diemTBthang10;
                Double diemTBthang4;
                String diemTBChu;
                String trangThai ;

                checkZero=CheckDiem0(diemChuyenCan,diemBaiTap,diemThi,diemKiemTra);
                if (checkZero) {
                    trangThai = "Trượt";
                    diemTBthang10 = 0.0;
                    diemTBthang4 = 0.0;
                    diemTBChu = ConvertDiemChu(diemTBthang4);
                }
                else {
                    diemTBthang10 = LamTron1ChuSo((diemChuyenCan*ptChuyenCan + diemBaiTap * ptBaiTap + diemThi * ptThi + diemKiemTra * ptKiemTra )/100);
                    diemTBthang4 = ConvertDiemTB(diemTBthang10);
                    trangThai = ConvertTrangThai(diemTBthang4);
                    diemTBChu = ConvertDiemChu(diemTBthang4);
                }

                gpa.setHocKy(hocKy);
                gpa.setTenHocKy(tenHocKy);
                gpa.setSoTinChi(soTinChi);
                gpa.setDiemTBthang4(diemTBthang4);
                gpas.add(gpa);
            }

            Set<String> SemesterNames = new LinkedHashSet<>();
            for (int i = 0; i < gpas.size(); i++)
            {
                SemesterNames.add(gpas.get(i).getHocKy());
            }

            double tongTinChi = 0;
            double tongDiemCacMon = 0;
            for(String x : SemesterNames) {
                WacthGradeEntity gpaBySemester = new WacthGradeEntity();
                for (int i = 0; i < gpas.size(); i++) {
                    String HK = gpas.get(i).getHocKy();
                    if (HK.equals(x)) {
                        gpaBySemester.setTenHocKy(gpas.get(i).getTenHocKy());
                        tongTinChi += gpas.get(i).getSoTinChi();
                        tongDiemCacMon += gpas.get(i).getDiemTBthang4() * gpas.get(i).getSoTinChi();
                    }
                }
                gpaBySemester.setHocKy(x);
                gpaBySemester.setGpaTungKy(LamTron2ChuSo(tongDiemCacMon/tongTinChi));
                GpaByStudentId.add(gpaBySemester);
                tongTinChi = 0;
                tongDiemCacMon = 0;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return GpaByStudentId;
    }
}
