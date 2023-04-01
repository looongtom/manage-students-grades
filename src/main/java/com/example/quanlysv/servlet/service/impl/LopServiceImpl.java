package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.ILopDao;
import com.example.quanlysv.servlet.dao.impl.LopDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.entity.LopEntity;
import com.example.quanlysv.servlet.service.ILopService;
import com.example.quanlysv.servlet.util.Convert;

import java.util.ArrayList;
import java.util.List;

public class LopServiceImpl implements ILopService {
    private ILopDao lopDao;

    public LopServiceImpl(){
        lopDao=new LopDaoImpl();
    }
    @Override
    public List<LopDTO> findLop(BaseRequest request) {
        List<LopDTO>result=new ArrayList<>();
        try{
            List<LopEntity>list=lopDao.findLop(request);
            for(int i=0;i< list.size();i++){
                result.add(Convert.convertEntityToDTO(list.get(i), LopDTO.class));
            }
            return result;
        }catch (Exception e){
            return result;
        }
    }

    @Override
    public void deleteLopById(String id) {
        try{
            if(!id.trim().isEmpty()){
                lopDao.deleteLopById(id.trim());
            }
        }catch (Exception e){
            throw new RuntimeException("delete lop failed: "+ e.getMessage());

        }
    }

    @Override
    public void createOrUpdateLop(LopDTO lopDTO) {
        try{
            LopEntity lopEntity = Convert.convertDTOToEntity(lopDTO, LopEntity.class);
            if(lopEntity!=null){
                lopDao.createOrUpdateLop(lopEntity);
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        }
    }
}