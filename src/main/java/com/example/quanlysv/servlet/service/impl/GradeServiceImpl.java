package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.IGradeDao;
import com.example.quanlysv.servlet.dao.impl.GradeDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.diem.GradeDTO;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.GradeEntity;
import com.example.quanlysv.servlet.entity.SubjectEntity;
import com.example.quanlysv.servlet.entity.TeacherEntity;
import com.example.quanlysv.servlet.service.IGradeService;
import com.example.quanlysv.servlet.util.Convert;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class GradeServiceImpl implements IGradeService {
    private IGradeDao gradeDao;
    public GradeServiceImpl(){gradeDao=new GradeDaoImpl();}

    @Override
    public void createOrUpdateGrade(GradeDTO gradeDTO) {
        try{
            GradeEntity gradeEntity = Convert.convertDTOToEntity(gradeDTO, GradeEntity.class);
            if(gradeEntity != null){
                gradeDao.createOrUpdateGrade(gradeEntity);
            }

        }catch (Exception e){
            System.out.println(e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public BaseResponse<?> nhapDiem(GradeEntity gradeEntity) {
        try{
            gradeDao.nhapDiem(gradeEntity);
            BaseResponse<GradeEntity>baseResponse=
                    new BaseResponse.Builder<GradeEntity>()
                            .setMessage("success")
                            .setStatus(200)
                            .build();
            return baseResponse;
        }catch (Exception e){
            return new BaseResponse.Builder<List<GradeDTO>>()
                    .setMessage("failed"+ e.getMessage()).setStatus(500).build();
        }
    }

    @Override
    public BaseResponse<?> getGrade(BaseRequest request) {
        try{
            if ((request.getSortOrder() == null || request.getSortOrder().isEmpty())) {
                request.setSortOrder("asc");
            }
            if(request.getSortField() == null || request.getSortField().isEmpty()){
                request.setSortField("id_diem");
            }
            List<GradeDTO> dtoList=new ArrayList<>();
            List<GradeEntity> list=gradeDao.findDiem(request);
            dtoList=list.stream().map(x->{
                try{
                    return Convert.convertEntityToDTO(x,GradeDTO.class);
                } catch (IllegalAccessException e) {
                    System.out.println(e.getCause());
                    return null;
                } catch (InstantiationException e) {
                    System.out.println(e.getCause());
                    return null;
                }
            }).filter(Objects::nonNull).collect(Collectors.toList());

            return new BaseResponse.Builder<List<GradeDTO>>()
                    .setData(dtoList).setMessage("success").setStatus(200).build();
        } catch (Exception e) {
            return new BaseResponse.Builder<List<GradeDTO>>()
                    .setMessage("failed"+ e.getMessage()).setStatus(500).build();
        }
    }

    //    @Override
//    public BaseResponse<?> nhapDiem(GradeDTO gradeDTO) {
//        try{
//            GradeEntity gradeEntity = Convert.convertDTOToEntity(gradeDTO,GradeEntity.class);
//            gradeDao.nhapDiem(gradeEntity);
//            BaseResponse<GradeEntity>baseResponse=
//                    new BaseResponse.Builder<GradeEntity>()
//                            .setMessage("success")
//                            .setStatus(200)
//                            .build();
//            return baseResponse;
//        } catch (IllegalAccessException e) {
//            throw new RuntimeException(e);
//        } catch (InstantiationException e) {
//            throw new RuntimeException(e);
//        }
//    }
}
