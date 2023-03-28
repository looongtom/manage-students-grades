package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.SubjectEntity;
import java.util.List;

public interface ISubjectDao {

    List<SubjectEntity> findSubject(BaseRequest baseRequest);

    void createOrUpdateSubject(SubjectEntity subjectEntity);

    void deleteSubject(String id);
}
