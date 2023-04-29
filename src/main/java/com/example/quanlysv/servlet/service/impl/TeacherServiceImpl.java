package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.common.Constant;
import com.example.quanlysv.servlet.dao.IKhoaDao;
import com.example.quanlysv.servlet.dao.ITeacherDao;
import com.example.quanlysv.servlet.dao.impl.KhoaDaoImpl;
import com.example.quanlysv.servlet.dao.impl.TeacherDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.teacher.CreateOrEditTeacherDTO;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.KhoaEntity;
import com.example.quanlysv.servlet.entity.TeacherEntity;
import com.example.quanlysv.servlet.service.ITeacherService;
import com.example.quanlysv.servlet.util.Convert;
import org.apache.log4j.Logger;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class TeacherServiceImpl implements ITeacherService {
    private static final org.apache.log4j.Logger log = Logger.getLogger(StudentServiceImpl.class.getName());

    private ITeacherDao teacherDao;
    private IKhoaDao iKhoaDao;
    public TeacherServiceImpl(){
        teacherDao=new TeacherDaoImpl();
        iKhoaDao =  new KhoaDaoImpl();
    }

    @Override
    public BaseResponse<?> getTeacherById(String id) {
        try{
            TeacherEntity teacherEntity = teacherDao.getById(id);
            if(teacherEntity==null){
                return new BaseResponse.Builder<>()
                        .setStatus(Constant.httpStatusErrorServer)
                        .setMessage(Constant.messageStudentNotFound).build();
            }
//            KhoaEntity khoaEntity = iKhoaDao.getById( teacherEntity.getIdKhoa() );
//            if(khoaEntity==null){
//                return new BaseResponse.Builder<>()
//                        .setStatus(Constant.httpStatusErrorServer)
//                        .setMessage(Constant.messageStudentNotFound).build();
//            }
//            teacherEntity.setTenKhoa(khoaEntity.getTenKhoa());

            TeacherDTO teacherDTO = Convert.convertEntityToDTO(teacherEntity, TeacherDTO.class);
            return new BaseResponse.Builder<>()
                    .setStatus(Constant.httpStatusOk)
                    .setData(teacherDTO)
                    .setMessage(Constant.messageSuccess).build();
        }catch (Exception e){
            log.error(e.getMessage());
            return new BaseResponse.Builder<>()
                    .setStatus(Constant.httpStatusErrorServer)
                    .setMessage(Constant.messageStudentNotFound).build();
        }
    }

    @Override
    public BaseResponse<?> createOrEditTeacher(CreateOrEditTeacherDTO teacherDTO) {
        try {
            TeacherEntity teacherEntity = Convert.convertDTOToEntity(teacherDTO,TeacherEntity.class);
            teacherDao.createOrEditTeacher(teacherEntity);
            BaseResponse<TeacherEntity>baseResponse=
                    new BaseResponse.Builder<TeacherEntity>()
                            .setMessage("success")
                            .setStatus(200)
                            .build();
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
            for(TeacherEntity tmp:list){
                KhoaEntity khoaEntity = iKhoaDao.getById( tmp.getIdKhoa() );
                tmp.setTenKhoa(khoaEntity.getTenKhoa());
            }
            dtoList=list.stream().map(x->{
                try{
                    return Convert.convertEntityToDTO(x,TeacherDTO.class);
                } catch (IllegalAccessException e) {
                    System.out.println(e.getCause());
                    return null;
                } catch (InstantiationException e) {
                    System.out.println(e.getCause());
                    return null;
                } catch (InvocationTargetException e) {
                    throw new RuntimeException(e);
                } catch (NoSuchMethodException e) {
                    throw new RuntimeException(e);
                }
            }).filter(Objects::nonNull).collect(Collectors.toList());

            return new BaseResponse.Builder<List<TeacherDTO>>()
                    .setData(dtoList).setMessage("success").setStatus(200).build();
        } catch (Exception e) {
            return new BaseResponse.Builder<List<TeacherDTO>>()
                    .setMessage("failed"+ e.getMessage()).setStatus(500).build();
        }
    }

    @Override
    public BaseResponse<?> deleteTeacher(String id) {
        try{
            teacherDao.deleteTeacher(id);
            return new BaseResponse.Builder<List<TeacherDTO>>()
                    .setMessage("success")
                    .setStatus(200)
                    .build();
        }catch (Exception e){
            System.out.println(e.getMessage());
            return new BaseResponse.Builder<List<TeacherDTO>>()
                    .setMessage("failed"+e.getMessage()).setStatus(500).build();
        }    }
}
