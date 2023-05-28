package com.example.quanlysv.servlet.dao.impl;

import com.example.quanlysv.servlet.dao.ILopDao;
import com.example.quanlysv.servlet.dto.request.lop.LopFilter;
import com.example.quanlysv.servlet.entity.LopEntity;
import com.example.quanlysv.servlet.mapper.LopMapper;

import java.time.Instant;
import java.util.ArrayList;
import java.util.List;

public class LopDaoImpl extends AbstractDao<LopEntity> implements ILopDao {
    @Override
    public List<LopEntity> getListLopByIdKhoa(String idKhoa) {
        String sql="SELECT lop.id_lop as idLop, lop.ten_lop as tenLop, lop.id_khoa as idKhoa, lop.id_hk as idHk,lop.ngay_tao as ngayTao, lop.ngay_sua as ngaySua " +
                "FROM lop where id_khoa=?";
        List<LopEntity>lopEntities=findByProperties(sql,new LopMapper(),idKhoa);
        return lopEntities.isEmpty() ? null : lopEntities;
    }

    @Override
    public void createOrUpdateLop(LopEntity lopEntity) {
        String sqlQuery="select lop.id_lop as idLop, lop.ten_lop as tenLop,lop.id_khoa as idKhoa,lop.id_hk as idHk," +
        "lop.ngay_tao as ngayTao, lop.ngay_sua as ngaySua " +
                " FROM lop where lop.id_lop=?";
        List<LopEntity>lopEntities=findByProperties(sqlQuery,new LopMapper(),lopEntity.getIdLop());
        try{
            StringBuilder sql = new StringBuilder("");
            if(lopEntities==null||lopEntities.isEmpty()){
                Instant instant = Instant.now();
                lopEntity.setNgayTao(instant);
                sql.append("INSERT INTO lop (id_lop, ten_lop, id_khoa,id_hk,ngay_tao,ngay_sua) Values (?,?,?,?,?,?)");
                insertOrUpdateOrDelete(sql.toString(),lopEntity.getIdLop(),
                        lopEntity.getTenLop(),lopEntity.getIdKhoa(),lopEntity.getIdHk(),lopEntity.getNgayTao(),lopEntity.getNgayTao()
                );
            }
            else{
                Instant instant = Instant.now();
                lopEntity.setNgaySua(instant);
                sql.append("UPDATE lop SET ten_lop= ?,id_khoa= ?,id_hk=?,ngay_sua=? WHERE id_lop=?");
                insertOrUpdateOrDelete(sql.toString(),lopEntity.getTenLop(),
                        lopEntity.getIdKhoa(),lopEntity.getIdHk(),lopEntity.getNgaySua(),lopEntity.getIdLop()
                );
            }
        }catch (Exception e){
            throw new RuntimeException("update lop failed: "+ e.getMessage());
        }
    }

    @Override
    public List<LopEntity> findLop(LopFilter request) {
        String sql="";
        List<LopEntity> list=new ArrayList<>();
        try {
            if(request.getIdKhoa()!=null ) {
                sql = "select lop.id_lop as idLop, lop.ten_lop as tenLop,lop.id_khoa as idKhoa,lop.id_hk as idHk," +
                        "lop.ngay_tao as ngayTao, lop.ngay_sua as ngaySua " +
                        "from lop as lop where lop.id_khoa =? and lop.ten_lop like concat('%',?, '%') ORDER BY " +
                        request.getBaseRequest().getSortField() + " " + request.getBaseRequest().getSortOrder() + " OFFSET ? LIMIT ?";
                 list = findByProperties(sql, new LopMapper(),
                        request.getIdKhoa(),request.getTenLop(),
                         (request.getBaseRequest().getPageIndex()-1) * request.getBaseRequest().getPageSize(), request.getBaseRequest().getPageSize());

                return list.isEmpty() ? null : list;
            }
            else if(request.getIdKhoa()==null ){
                sql = "select lop.id_lop as idLop, lop.ten_lop as tenLop,lop.id_khoa as idKhoa,lop.id_hk as idHk," +
                        "lop.ngay_tao as ngayTao, lop.ngay_sua as ngaySua " +
                        "from lop as lop where lop.ten_lop like concat('%',?, '%') ORDER BY " +
                        request.getBaseRequest().getSortField() + " " + request.getBaseRequest().getSortOrder() + " OFFSET ? LIMIT ?";
                 list = findByProperties(sql, new LopMapper(),
                        request.getTenLop(),
                         (request.getBaseRequest().getPageIndex()-1) * request.getBaseRequest().getPageSize(), request.getBaseRequest().getPageSize());

            }
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
    public List<LopEntity> getAllLop() {
        try{
            String query="SELECT lop.id_lop as idLop, lop.ten_lop as tenLop, " +
                    "lop.id_khoa as idKhoa, lop.id_hk as idHk," +
                    "lop.ngay_tao as ngayTao, lop.ngay_sua as ngaySua" +
                    " FROM lop where 1=? ORDER BY lop.ten_lop ASC";
            List<LopEntity> list = findByProperties(query, new LopMapper(),1);

            return list.isEmpty()? null: list;

        }catch (Exception e){
            System.out.println(e.getMessage());
            return null;
        }
    }

    @Override
    public Integer countTotalRecords(LopFilter request) {
        String countSql="";
        Integer totalRecords=0;
        if(request.getIdKhoa()!=null ) {
            countSql = "SELECT COUNT(*) FROM lop where lop.id_khoa =? and  lop.ten_lop like concat('%',?, '%')";
            totalRecords = countTotalRecords(countSql, request.getIdKhoa(),request.getTenLop());
        }
        else if(request.getIdKhoa()==null ) {
            countSql = "SELECT COUNT(*) FROM lop  where lop.ten_lop like concat('%',?, '%')";
            totalRecords = countTotalRecords(countSql, request.getIdKhoa(),request.getTenLop());
        }

        return totalRecords;
    }

    @Override
    public boolean existedByIdAndTenLop(String id, String tenLop) {
        try{
            String sqlQuery="select lop.id_lop as idLop, lop.ten_lop as tenLop,lop.id_khoa as idKhoa,lop.id_hk as idHk," +
                    "lop.ngay_tao as ngayTao, lop.ngay_sua as ngaySua " +
                    "from lop as lop where lop.id_lop=? or lop.ten_lop=?";
            LopEntity lop=findOne(sqlQuery,new LopMapper(),id,tenLop);
            if(lop!=null)return true;
            return false;
        }catch (Exception e){
            throw new RuntimeException("error: "+ e.getMessage());
        }
    }
}