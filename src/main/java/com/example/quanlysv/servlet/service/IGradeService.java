package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.diem.GradeDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.GradeEntity;

public interface IGradeService {
    BaseResponse<?> nhapDiem(GradeEntity gradeEntity);

    BaseResponse<?>getGrade(BaseRequest request);
}
