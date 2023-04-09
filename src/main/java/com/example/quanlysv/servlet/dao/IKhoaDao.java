package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.KhoaEntity;

import java.util.List;

public interface IKhoaDao extends IGenericDao<KhoaEntity> {
    List<KhoaEntity>findKhoa(BaseRequest request);
}
