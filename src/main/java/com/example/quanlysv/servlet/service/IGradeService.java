package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.diem.GradeDTO;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.GradeEntity;

public interface IGradeService {
    BaseResponse<?> nhapDiem(GradeEntity gradeEntity);
    void createOrUpdateGrade(GradeDTO gradeDTO);

    BaseResponse<?>getGrade(BaseRequest request);
}
