package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;

public interface ILopService {
    BaseResponse<?>  createOrUpdateLop(LopDTO lopDTO);

    BaseResponse<?> findLop(BaseRequest request);

    BaseResponse<?>  deleteLopById(String id);
}