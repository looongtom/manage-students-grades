package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;

import java.util.List;

public interface ISubjectService {
    List<SubjectDTO> findSubject(BaseRequest baseRequest);

    void createOrUpdateSubject(SubjectDTO subjectDTO);

    void deleteSubject(String id);
}
