package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.IHocKyDao;
import com.example.quanlysv.servlet.dao.impl.HocKyDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.kyhoc.SemesterDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.HocKyEntity;
import com.example.quanlysv.servlet.service.IHocKyService;
import com.example.quanlysv.servlet.util.Convert;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class HockYServiceImpl implements IHocKyService {

    private IHocKyDao hocKyDao;

    public HockYServiceImpl(){
        this.hocKyDao = new HocKyDaoImpl();
    }

    @Override
    public BaseResponse<?> findSemester(BaseRequest request) {
        try{
            if ((request.getSortOrder() == null || request.getSortOrder().isEmpty())) {
                request.setSortOrder("asc");
            }
            if(request.getSortField() == null || request.getSortField().isEmpty()){
                request.setSortField("id_hk");
            }

            List<SemesterDTO> dtoList = new ArrayList<>();
            List<HocKyEntity> list = hocKyDao.findSemester(request);

            dtoList = list.stream().map(x ->{
                try {
                    return Convert.convertEntityToDTO(x, SemesterDTO.class);
                } catch (IllegalAccessException e) {
                    System.out.println(e.getCause());
                    return null;
                } catch (InstantiationException e) {
                    System.out.println(e.getCause());
                    return null;
                }
            }).filter(Objects::nonNull).collect(Collectors.toList());

            return new BaseResponse.Builder<List<SemesterDTO>>()
                    .setData(dtoList).setMessage("success").setStatus(200).build();

        }catch (Exception e){
            return new BaseResponse.Builder<List<SemesterDTO>>()
                    .setMessage("failed"+ e.getMessage()).setStatus(500).build();
        }

    }

    @Override
    public BaseResponse<?> deleteSemester(String id) {
        try{
            hocKyDao.deleteHocKy(id);

            return new BaseResponse.Builder<List<SemesterDTO>>()
                    .setMessage("success").setStatus(200).build();
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new BaseResponse.Builder<List<SemesterDTO>>()
                    .setMessage("failed"+ e.getMessage()).setStatus(500).build();
        }
    }


    @Override
    public BaseResponse<?> createOrEdit(SemesterDTO semesterDTO) {
        try {
            HocKyEntity hocKyEntity = Convert.convertDTOToEntity(semesterDTO, HocKyEntity.class);
            hocKyDao.createOrEditHocKy(hocKyEntity);
            BaseResponse<HocKyEntity> baseResponse =
                    new BaseResponse.Builder<HocKyEntity>()
                            .setMessage("success").setStatus(200).build();
            return baseResponse;

        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        }
    }

}
