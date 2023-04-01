package com.example.quanlysv.servlet.service;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;

import java.util.List;

public interface ILopService {
    List<LopDTO> findLop(BaseRequest request);

    void deleteLopById(String id);

    void createOrUpdateLop(LopDTO lopDTO);
}
