package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.ISubjectDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.dto.request.subject.SubjectFilter;
import com.example.quanlysv.servlet.entity.SubjectEntity;
import com.example.quanlysv.servlet.mapper.SubjectMapper;
import net.bytebuddy.implementation.bytecode.Throw;


import java.util.Collections;
import java.util.List;

public class SubjectDaoImpl extends AbstractDao<SubjectEntity> implements ISubjectDao {

    @Override
    public List<SubjectEntity> findSubject(SubjectFilter request) {
        String sql = "SELECT mh.id_mh as idMh, mh.ten_mon_hoc as tenMonHoc, mh.tin_chi as tinChi,\n" +
                "                mh.id_khoa as idKhoa, k.ten_khoa as tenKhoa FROM monhoc mh join khoa k on mh.id_khoa = k.id_khoa where lower(mh.ten_mon_hoc) like concat('%', lower(?), '%') ORDER BY " +
                request.getBaseRequest().getSortField() + " "+  request.getBaseRequest().getSortOrder() + " OFFSET ? LIMIT ?";
        List<SubjectEntity> list = findByProperties(sql, new SubjectMapper(), request.getTenMonHoc(),
                (request.getBaseRequest().getPageIndex()-1) * request.getBaseRequest().getPageSize(), request.getBaseRequest().getPageSize());
        return list.isEmpty() ? null : list;
    }

    @Override
    public Integer countTotalRecords(SubjectFilter baseRequest) {
        String sql ="SELECT count(*)\n" +
                "FROM monhoc as mh where lower(mh.ten_mon_hoc) like concat('%', lower(?), '%')";
        Integer total = countTotalRecords(sql, baseRequest.getTenMonHoc());
        return total;
    }


    @Override
    public void createOrUpdateSubject(SubjectEntity subjectEntity) {
        String sqlQuery = "SELECT mh.id_mh as idMh, mh.ten_mon_hoc as tenMonHoc, mh.tin_chi as tinChi," +
                "mh.id_khoa as idKhoa FROM monhoc mh where mh.id_mh =?";
        List<SubjectEntity> list = findByProperties(sqlQuery, new SubjectMapper(), subjectEntity.getIdMh());

        try{
            StringBuilder sql = new StringBuilder("");
            if(list == null || list.isEmpty()){
                sql.append("insert into monhoc(id_mh, ten_mon_hoc, tin_chi, id_khoa) " +
                        "values(?, ?, ?, ?)");
                insertOrUpdateOrDelete(sql.toString(), subjectEntity.getIdMh(), subjectEntity.getTenMonHoc(),
                        subjectEntity.getTinChi(), subjectEntity.getIdKhoa());
            }
            else{
                sql.append("update monhoc set ten_mon_hoc =?, tin_chi=?, id_khoa=? where id_mh=?");
                insertOrUpdateOrDelete(sql.toString(), subjectEntity.getTenMonHoc(), subjectEntity.getTinChi(),
                        subjectEntity.getIdKhoa(), subjectEntity.getIdMh());
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
            throw new RuntimeException("failed: "+ e.getMessage());
        }

    }

    @Override
    public void deleteSubject(String id) {
          try {
              String sqlQuery = "SELECT mh.id_mh as idMh, mh.ten_mon_hoc as tenMonHoc, mh.tin_chi as tinChi," +
                      "mh.id_khoa as idKhoa FROM monhoc mh where mh.id_mh =?";
              List<SubjectEntity> list = findByProperties(sqlQuery, new SubjectMapper(), id.trim());
              if(list != null && !list.isEmpty()){
                  String sql = "delete from monhoc where id_mh = ?";
                  insertOrUpdateOrDelete(sql, id.trim());
              }

          }catch (Exception e){
              System.out.println(e.getMessage());
              throw  new RuntimeException(e.getMessage());
          }
    }
}
