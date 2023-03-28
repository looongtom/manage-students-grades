package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.IHocKyDao;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.HocKyEntity;
import com.example.quanlysv.servlet.mapper.HocKyMapper;

import java.util.List;

public class HocKyDaoImpl extends AbstractDao<HocKyEntity> implements IHocKyDao {




    @Override
    public List<HocKyEntity> findSemester(BaseRequest request) {

        try{
            String sql = "select hk.id_hk as idHk, hk.ten_hoc_ky as tenHocKy " +
                    "from hocky as hk ORDER BY " +
                    request.getSortField() + " "+  request.getSortOrder() + " OFFSET ? LIMIT ?";

            List<HocKyEntity> list = findByProperties(sql, new HocKyMapper(),
                    request.getPageIndex() * request.getPageSize(), request.getPageSize());

            return list.isEmpty()? null: list;

        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public void deleteHocKy(String id) {
        try {
            String sqlQuery = "select hk.id_hk as idHk, hk.ten_hoc_ky as tenHocKy " +
                    "from hocky as hk where hk.id_hk =?";
            List<HocKyEntity> list = findByProperties(sqlQuery, new HocKyMapper(), id.trim());
            if(list != null){
                String sql = "delete from hocky where id_hk = ?";
                insertOrUpdateOrDelete(sql, id.trim());
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
    }

    @Override
    public void createOrEditHocKy(HocKyEntity hocKyEntity) {
          String sqlQuery ="select hk.id_hk as idHk, hk.ten_hoc_ky as tenHocKy from hocky as hk where hk.id_hk = ?";
          try{
              if(hocKyEntity != null){
                  List<HocKyEntity> list = findByProperties(sqlQuery, new HocKyMapper(), hocKyEntity.getIdHk());
                  StringBuilder sql = new StringBuilder("");

                  if(list == null || list.isEmpty()){
                      sql.append("insert into hocky(id_hk, ten_hoc_ky) values(?, ?)");
                      insertOrUpdateOrDelete(sql.toString(), hocKyEntity.getIdHk(), hocKyEntity.getTenHocKy());
                  }
                  else{
                      sql.append("update hocky set ten_hoc_ky = ? where id_hk = ?");
                      insertOrUpdateOrDelete(sql.toString(), hocKyEntity.getTenHocKy(), hocKyEntity.getIdHk());
                  }
              }
          }catch (Exception e){
              throw new RuntimeException("failed: "+ e.getMessage());
          }
    }



}
