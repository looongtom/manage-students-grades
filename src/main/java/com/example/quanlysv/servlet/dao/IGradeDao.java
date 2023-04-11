package com.example.quanlysv.servlet.dao;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.GradeEntity;

import java.util.List;

public interface IGradeDao extends IGenericDao<GradeEntity> {
    void nhapDiem(GradeEntity gradeEntity);

    List<GradeEntity> findDiem(BaseRequest request);
}
