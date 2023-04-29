package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.TeacherEntity;

import java.util.List;

public interface ITeacherDao extends IGenericDao<TeacherEntity> {
    void createOrEditTeacher(TeacherEntity teacherEntity);
    List<TeacherEntity> findTeacher(BaseRequest baseRequest);
    void deleteTeacher(String id);
    TeacherEntity getById(String id);


}
