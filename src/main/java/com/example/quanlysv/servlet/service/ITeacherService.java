package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.teacher.CreateOrEditTeacherDTO;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherFilter;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

public interface ITeacherService {
    BaseResponse<?> createOrEditTeacher(CreateOrEditTeacherDTO teacherDTO);

    BaseResponse<?> findTeacher(TeacherFilter request);
    BaseResponse<?> findTeacherV2(String tenGv,String sortField,String sortOrder,Integer pageSize,Integer pageIndex);


    BaseResponse<?> deleteTeacher(String id);

    BaseResponse<?> getTeacherById(String id);

}
