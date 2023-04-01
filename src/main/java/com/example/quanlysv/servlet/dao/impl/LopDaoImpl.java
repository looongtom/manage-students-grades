package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.ILopDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.KhoaEntity;
import com.example.quanlysv.servlet.entity.LopEntity;
import com.example.quanlysv.servlet.mapper.KhoaMapper;
import com.example.quanlysv.servlet.mapper.LopMapper;

import java.util.List;

public class LopDaoImpl extends AbstractDao<LopEntity> implements ILopDao {
    @Override
    public List<LopEntity> findLop(BaseRequest request) {
        String sql = "SELECT lop.id_lop as idLop, lop.ten_lop as tenLop, lop.id_khoa as idKhoa" +
                " FROM lop ORDER BY " + request.getSortField() + " " + request.getSortOrder() + " OFFSET ? LIMIT ?";
        List<LopEntity> lopEntities = findByProperties(sql, new LopMapper(),
                request.getPageIndex() * request.getPageSize(), request.getPageSize());
        return lopEntities.isEmpty() ? null : lopEntities;
    }
}
