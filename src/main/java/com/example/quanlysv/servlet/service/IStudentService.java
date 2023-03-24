package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;

import java.util.List;

public interface IStudentService {

    List<StudentDTO> findStudent(BaseRequest request);

    void createOrUpdateStudent(StudentDTO studentDTO);

    void deleteStudentById(String id);
}
