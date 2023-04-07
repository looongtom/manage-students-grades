package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.ITeacherDao;
import com.example.quanlysv.servlet.dao.impl.TeacherDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.kyhoc.SemesterDTO;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.TeacherEntity;
import com.example.quanlysv.servlet.service.ITeacherService;
import com.example.quanlysv.servlet.util.Convert;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class TeacherServiceImpl implements ITeacherService {
    private ITeacherDao teacherDao;

    public TeacherServiceImpl(){
        this.teacherDao = new TeacherDaoImpl();
    }

    @Override
    public BaseResponse<?> createOrEditTeacher(TeacherDTO teacherDTO) {
        try {
            TeacherEntity teacherEntity = Convert.convertDTOToEntity(teacherDTO,TeacherEntity.class);
            teacherDao.createOrEditTeacher(teacherEntity);
            BaseResponse<TeacherEntity>baseResponse=
                    new BaseResponse.Builder<TeacherEntity>()
                            .setMessage("success")
                            .setStatus(200)
                            .build();
            System.out.println(baseResponse.getData());
            return baseResponse;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public BaseResponse<?> findTeacher(BaseRequest request) {
        try{
            if ((request.getSortOrder() == null || request.getSortOrder().isEmpty())) {
                request.setSortOrder("asc");
            }
            if(request.getSortField() == null || request.getSortField().isEmpty()){
                request.setSortField("id_gv");
            }

            List<TeacherDTO> dtoList=new ArrayList<>();
            List<TeacherEntity> list=teacherDao.findTeacher(request);
            dtoList=list.stream().map(x->{
                try{
                    return Convert.convertEntityToDTO(x,TeacherDTO.class);
                } catch (IllegalAccessException e) {
                    System.out.println(e.getCause());
                    return null;
                } catch (InstantiationException e) {
                    System.out.println(e.getCause());
                    return null;
                }
            }).filter(Objects::nonNull).collect(Collectors.toList());

            return new BaseResponse.Builder<List<TeacherDTO>>()
                    .setData(dtoList).setMessage("success").setStatus(200).build();
        } catch (Exception e) {
            return new BaseResponse.Builder<List<SemesterDTO>>()
                    .setMessage("failed"+ e.getMessage()).setStatus(500).build();
        }
    }

    @Override
    public BaseResponse<?> deleteTeacher(String id) {
        return null;
    }
}
