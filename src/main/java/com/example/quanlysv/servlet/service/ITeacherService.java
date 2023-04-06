package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.kyhoc.SemesterDTO;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

public interface ITeacherService {
    BaseResponse<?> createOrEdit(TeacherDTO teacherDTO);

    BaseResponse<?> findTeacher(BaseRequest request);

    BaseResponse<?> deleteTeacher(String id);
}
