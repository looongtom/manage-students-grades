package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.ITeacherDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.TeacherEntity;
import com.example.quanlysv.servlet.mapper.TeacherMapper;

import java.util.List;

public class TeacherDaoImpl extends AbstractDao<TeacherEntity> implements ITeacherDao {
    @Override
    public void createOrEditTeacher(TeacherEntity teacherEntity) {
        String sqlQuery="select gv.id_gv as idGv,gv.ten_gv as tenGv,gv.sdt_gv as sdtGv," +
                " gv.email_gv as emailGv, gv.gender_gv as genderGv, gv.id_khoa as idKhoa," +
                " gv.ngay_tao as ngayTao, gv.ngay_sua as ngaySua from giangvien as gv" +
                " where gv.id_gv=?";
        List<TeacherEntity>teacherEntities=findByProperties(sqlQuery,new TeacherMapper(),teacherEntity.getIdGv());
        try{
            StringBuilder sql = new StringBuilder("");
            if(teacherEntities==null||teacherEntities.isEmpty()){
                sql.append("insert into giangvien (id_gv,ten_gv,sdt_gv,email_gv," +
                "gender_gv,id_khoa) values(?,?,?,?,?,?)");
                insertOrUpdateOrDelete(sql.toString(),teacherEntity.getIdGv(),teacherEntity.getTenGv(),
                teacherEntity.getSdtGv(),teacherEntity.getEmailGv(),teacherEntity.getGenderGv(),
                teacherEntity.getIdKhoa()
                );
            }
            else{
                sql.append("UPDATE giangvien SET ten_gv = ?,sdt_gv = ?,email_gv = ?,gender_gv = ?,id_khoa = ?" +
                "WHERE id_gv=?");
                insertOrUpdateOrDelete(sql.toString(),teacherEntity.getTenGv(),
                teacherEntity.getSdtGv(),teacherEntity.getEmailGv(),teacherEntity.getGenderGv(),
                teacherEntity.getIdKhoa(),
                teacherEntity.getIdGv()
                );
                System.out.println(
                        teacherEntity.getTenGv()+" "+
                        teacherEntity.getSdtGv()+" "+teacherEntity.getEmailGv()
                                +" "+teacherEntity.getGenderGv()+" "+
                        teacherEntity.getIdKhoa()+" "+
                        teacherEntity.getIdGv()
                );
            }
        }catch (Exception e){
            throw new RuntimeException("update teacher failed: "+ e.getMessage());
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
