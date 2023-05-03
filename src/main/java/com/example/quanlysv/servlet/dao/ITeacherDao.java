package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherFilter;
import com.example.quanlysv.servlet.entity.TeacherEntity;

import java.util.List;

public interface ITeacherDao extends IGenericDao<TeacherEntity> {
    void createOrEditTeacher(TeacherEntity teacherEntity);
    List<TeacherEntity> findTeacher(TeacherFilter baseRequest);
    List<TeacherEntity> findTeacherV2(String tenGv,String sortField,String sortOrder,Integer pageSize,Integer pageIndex);

    Integer countTotalRecords(TeacherFilter request);
    Integer countTotalRecordsV2(String tenGv);

    void deleteTeacher(String id);
    TeacherEntity getById(String id);


}
