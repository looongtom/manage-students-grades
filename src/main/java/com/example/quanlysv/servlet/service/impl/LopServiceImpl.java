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
}
