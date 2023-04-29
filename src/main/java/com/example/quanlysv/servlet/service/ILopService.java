package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.LopEntity;

import java.util.List;

public interface ILopService {
    BaseResponse<?>  createOrUpdateLop(LopDTO lopDTO);

    BaseResponse<?> findLop(BaseRequest request);

    BaseResponse<?>  deleteLopById(String id);

}