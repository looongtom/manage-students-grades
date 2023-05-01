package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.dto.request.subject.SubjectFilter;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

import java.util.List;

public interface ISubjectService {
    BaseResponse<?> findSubject(SubjectFilter baseRequest);

    void createOrUpdateSubject(SubjectDTO subjectDTO);

    void deleteSubject(String id);
}
