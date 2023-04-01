package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.IStudentDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.StudentEntity;
import com.example.quanlysv.servlet.mapper.StudentMapper;

import java.util.List;

public class StudentDaoImpl extends AbstractDao<StudentEntity> implements IStudentDao {
    @Override
    public List<StudentEntity> findStudent(BaseRequest request) {
        String sql = "SELECT sv.id_sv as idSv, sv.ten_sv as tenSv, sv.email_sv as emailSv," +
                "sv.dob_sv as dobSv, sv.gender_sv as genderSv," +
                "sv.phone_sv as phoneSv, sv.lop_hanh_chinh_sv as lopHanhChinhSv" +
                " FROM sinhvien as sv ORDER BY " + request.getSortField() + " "+  request.getSortOrder() + " OFFSET ? LIMIT ?";
        List<StudentEntity> studentEntities = findByProperties(sql, new StudentMapper(),
                request.getPageIndex() * request.getPageSize(), request.getPageSize());
        return studentEntities.isEmpty() ? null : studentEntities;
    }

    @Override
    public void createOrUpdateStudent(StudentEntity studentEntity) {
        String sqlQuery = "select sv.id_sv as idSv, sv.ten_sv as tenSv, sv.email_sv as emailSv, " +
                "sv.dob_sv as dobSv, sv.gender_sv as genderSv, " +
                "sv.phone_sv as phoneSv, sv.lop_hanh_chinh_sv as lopHanhChinhSv from sinhvien as sv where sv.id_sv = ?";
        List<StudentEntity> studentEntities = findByProperties(sqlQuery, new StudentMapper(), studentEntity.getIdSv());

        try {
            StringBuilder sql = new StringBuilder("");
            if(studentEntities == null || studentEntities.isEmpty()){
                sql.append("INSERT INTO sinhvien (id_sv, ten_sv, email_sv, dob_sv, gender_sv, phone_sv, lop_hanh_chinh_sv) " +
                        "Values(?, ?, ?, ?, ?, ?, ?)");
                insertOrUpdateOrDelete(sql.toString(), studentEntity.getIdSv(), studentEntity.getTenSv(), studentEntity.getEmailSv(),
                        studentEntity.getDobSv(), studentEntity.getGenderSv(), studentEntity.getPhoneSv(), studentEntity.getLopHanhChinhSv()
                        );
            }
            else{
                sql.append("UPDATE sinhvien SET ten_sv = ?, email_sv = ?, dob_sv =?, gender_sv =?, phone_sv =?, lop_hanh_chinh_sv =? " +
                        "WHERE id_sv = ?");
                insertOrUpdateOrDelete(sql.toString(),studentEntity.getTenSv(), studentEntity.getEmailSv(),
                        studentEntity.getDobSv(), studentEntity.getGenderSv(), studentEntity.getPhoneSv(), studentEntity.getLopHanhChinhSv(),
                        studentEntity.getIdSv());
            }


        } catch (Exception e) {
            throw new RuntimeException("create student failed: "+ e.getMessage());
        }
    }

    @Override
    public void deleteStudentById(String id) {
        try{
            String sqlQuery = "select sv.id_sv as idSv, sv.ten_sv as tenSv, sv.email_sv as emailSv, " +
                    "sv.dob_sv as dobSv, sv.gender_sv as genderSv, " +
                    "sv.phone_sv as phoneSv, sv.lop_hanh_chinh_sv as lopHanhChinhSv from sinhvien as sv where sv.id_sv = ?";
            List<StudentEntity> studentEntities = findByProperties(sqlQuery, new StudentMapper(), id.trim());

            if(!id.trim().isEmpty() && !studentEntities.isEmpty() && studentEntities != null){
                String sql = "DELETE FROM sinhvien where id_sv = ?";
                insertOrUpdateOrDelete(sql, id.trim());
            }

        }catch (Exception e){
            throw new RuntimeException("delete student failed: "+ e.getMessage());
        }
    }
}
