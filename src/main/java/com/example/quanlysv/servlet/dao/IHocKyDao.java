package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.HocKyEntity;

import java.util.List;

public interface IHocKyDao {

    void createOrEditHocKy(HocKyEntity hocKyEntity);

    List<HocKyEntity> findSemester(BaseRequest baseRequest);

    HocKyEntity findById(String id);

    boolean existByIdAndName(String id, String name);

    void deleteHocKy (String id);
}
