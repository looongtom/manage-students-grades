package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.ILopDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.entity.KhoaEntity;
import com.example.quanlysv.servlet.entity.LopEntity;
import com.example.quanlysv.servlet.entity.StudentEntity;
import com.example.quanlysv.servlet.mapper.KhoaMapper;
import com.example.quanlysv.servlet.mapper.LopMapper;
import com.example.quanlysv.servlet.mapper.StudentMapper;

import java.util.List;

public class LopDaoImpl extends AbstractDao<LopEntity> implements ILopDao {
    @Override
    public List<LopEntity> findLop(BaseRequest request) {

        try {
            String sql = "select lop.id_lop as idLop, lop.ten_lop as tenLop, lop.id_khoa as idKhoa " +
                    "from lop as lop ORDER BY " +
                    request.getSortField() + " "+  request.getSortOrder() + " OFFSET ? LIMIT ?";

            List<LopEntity> list = findByProperties(sql, new LopMapper(),
                    request.getPageIndex() * request.getPageSize(), request.getPageSize());



            return list.isEmpty() ? null : list;
        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }

    }

    @Override
    public void deleteLopById(String id) {
        try {
            String sqlQuery="SELECT lop.id_lop as idLop, lop.ten_lop as tenLop, lop.id_khoa as idKhoa"+
                    " FROM lop where lop.id_lop=?";
            List<LopEntity> lopEntities = findByProperties(sqlQuery, new LopMapper(), id.trim());
            if(lopEntities!=null){
                String sql = "DELETE FROM lop where id_lop = ?";
                insertOrUpdateOrDelete(sql, id.trim());
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void createOrUpdateLop(LopEntity lopEntity) {
        String sqlQuery="SELECT lop.id_lop as idLop, lop.ten_lop as tenLop, lop.id_khoa as idKhoa"+
                " FROM lop where lop.id_lop=?";
        List<LopEntity>lopEntities=findByProperties(sqlQuery,new LopMapper(),lopEntity.getIdLop());
        try{
            StringBuilder sql = new StringBuilder("");
            if(lopEntities==null||lopEntities.isEmpty()){
                sql.append("INSERT INTO lop (id_lop, ten_lop, id_khoa) Values (?,?,?)");
                insertOrUpdateOrDelete(sql.toString(),lopEntity.getIdLop(),
                        lopEntity.getTenLop(),lopEntity.getIdKhoa());
            }
            else{
                sql.append("UPDATE lop SET ten_lop= ?,id_khoa= ? WHERE id_lop=?");
                insertOrUpdateOrDelete(sql.toString(),lopEntity.getTenLop(),
                        lopEntity.getIdKhoa(),lopEntity.getIdLop());
            }
        }catch (Exception e){
            throw new RuntimeException("update lop failed: "+ e.getMessage());
        }
    }
}