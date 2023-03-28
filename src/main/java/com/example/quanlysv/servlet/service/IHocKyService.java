package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.kyhoc.SemesterDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

public interface IHocKyService {
     BaseResponse<?> createOrEdit(SemesterDTO semesterDTO);

     BaseResponse<?> findSemester(BaseRequest request);

     BaseResponse<?> deleteSemester(String id);
}
