package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.LopEntity;

import java.util.List;

public interface ILopDao extends IGenericDao<LopEntity> {
    void createOrUpdateLop(LopEntity lopEntity);

    List<LopEntity>findLop(BaseRequest request);

    void deleteLopById(String id);

    List<LopEntity> getListLopByIdKhoa(String idKhoa);

}