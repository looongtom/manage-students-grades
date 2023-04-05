package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

import java.util.List;

public interface ILopService {
    BaseResponse<?> findLop(BaseRequest request);

    BaseResponse<?>  deleteLopById(String id);

    BaseResponse<?>  createOrUpdateLop(LopDTO lopDTO);
}