package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.entity.StudentEntity;

import java.util.List;

public interface IStudentDao  extends IGenericDao<StudentEntity> {

   List<StudentEntity> findStudent(BaseRequest request);

   void createOrUpdateStudent (StudentEntity studentEntity);

   void deleteStudentById(String id);
}
