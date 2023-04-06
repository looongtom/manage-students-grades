package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

import java.util.List;

public interface IStudentService {

    BaseResponse<?> findStudent(BaseRequest request);


    void createOrUpdateStudent(StudentDTO studentDTO);

    void deleteStudentById(String id);
}
