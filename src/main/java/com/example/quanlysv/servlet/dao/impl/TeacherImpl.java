package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.ITeacherDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.HocKyEntity;
import com.example.quanlysv.servlet.entity.TeacherEntity;
import com.example.quanlysv.servlet.mapper.HocKyMapper;
import com.example.quanlysv.servlet.mapper.TeacherMapper;

import java.util.List;

public class TeacherImpl extends AbstractDao<TeacherEntity> implements ITeacherDao {
    @Override
    public void createOrEditTeacher(TeacherEntity teacherEntity) {
        String sqlQuery="select gv.id_gv as idGv,gv.ten_gv as tenGv,gv.sdt_gv as sdtGv," +
                " gv.email_gv as emailGv, gv.gender_gv as genderGv, gv.id_khoa as idKhoa," +
                " gv.ngay_tao as ngayTao, gv.ngay_sua as ngaySua from giangvien as gv" +
                " where gv.id_gv=?";
        try{
            if(teacherEntity != null){
                List<TeacherEntity>list=findByProperties(sqlQuery,new TeacherMapper(),teacherEntity.getIdGv());
                StringBuilder sql = new StringBuilder("");

                if(list == null || list.isEmpty()){
                    sql.append("insert into giangvien(id_gv,ten_gv,sdt_gv,email_gv," +
                            "gender_gv,id_khoa,ngay_tao,ngay_sua values(?,?,?,?,?,?,?,?)");
                    insertOrUpdateOrDelete(sql.toString(),teacherEntity.getIdGv(),teacherEntity.getTenGv(),
                            teacherEntity.getSdtGv(),teacherEntity.getEmailGv(),teacherEntity.getGenderGv(),
                            teacherEntity.getIdKhoa(),teacherEntity.getNgayTao(),teacherEntity.getNgaySua()
                    );
                }
                else{
                    sql.append("update teacher set ten_gv = ?,sdt_gv = ?,email_gv = ?,gender_gv = ?,id_khoa = ?" +
                            ",ngay_tao = ?,ngay_sua = ? " +
                            "where id_gv=?");
                    insertOrUpdateOrDelete(sql.toString(),teacherEntity.getTenGv(),
                            teacherEntity.getSdtGv(),teacherEntity.getEmailGv(),teacherEntity.getGenderGv(),
                            teacherEntity.getIdKhoa(),teacherEntity.getNgayTao(),teacherEntity.getNgaySua(),
                            teacherEntity.getIdGv()
                    );
                }
            }
        }catch (Exception e){
            throw new RuntimeException("failed: "+ e.getMessage());
        }
    }

    @Override
    public List<TeacherEntity> findTeacher(BaseRequest request) {

        try{
            String sql="select gv.id_gv as idGv,gv.ten_gv as tenGv,gv.sdt_gv as sdtGv," +
                    "gv.email_gv as emailGv, gv.gender_gv as genderGv, gv.id_khoa as idKhoa," +
                    "gv.ngay_tao as ngayTao, gv.ngay_sua as ngaySua from giangvien as gv ORDER BY " +
                    request.getSortField() + " "+  request.getSortOrder() + " OFFSET ? LIMIT ?";

            List<TeacherEntity> list = findByProperties(sql, new TeacherMapper(),
                    request.getPageIndex() * request.getPageSize(), request.getPageSize());


            System.out.println("=============TeacherImpl=============");
            System.out.println(list);
            System.out.println("==============TeacherImpl============");

            return list.isEmpty()?null:list;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public void deleteTeacher(String id) {

    }
}
