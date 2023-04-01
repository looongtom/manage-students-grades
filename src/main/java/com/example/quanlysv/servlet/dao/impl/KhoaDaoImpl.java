package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.IKhoaDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.KhoaEntity;
import com.example.quanlysv.servlet.entity.StudentEntity;
import com.example.quanlysv.servlet.mapper.KhoaMapper;
import com.example.quanlysv.servlet.mapper.StudentMapper;

import java.util.List;

public class KhoaDaoImpl extends AbstractDao<KhoaEntity> implements IKhoaDao {
    @Override
    public List<KhoaEntity> findKhoa(BaseRequest request) {
        String sql = "SELECT khoa.id_khoa as idKhoa, khoa.ten_khoa as tenKhoa" +
                " FROM khoa ORDER BY " + request.getSortField() + " " + request.getSortOrder() + " OFFSET ? LIMIT ?";
        List<KhoaEntity> khoaEntities = findByProperties(sql, new KhoaMapper(),
                request.getPageIndex() * request.getPageSize(), request.getPageSize());
        return khoaEntities.isEmpty() ? null : khoaEntities;
    }
}