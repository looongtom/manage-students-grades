package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.ISubjectDao;
import com.example.quanlysv.servlet.dao.impl.SubjectDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.dto.request.subject.SubjectFilter;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.StudentEntity;
import com.example.quanlysv.servlet.entity.SubjectEntity;
import com.example.quanlysv.servlet.service.ISubjectService;
import com.example.quanlysv.servlet.util.Convert;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

public class SubjectServiceImpl implements ISubjectService {
    private ISubjectDao subjectDao;

    public SubjectServiceImpl(){
        this.subjectDao = new SubjectDaoImpl();
    }


    @Override
    public BaseResponse<?> findSubject(SubjectFilter request) {
        List<SubjectDTO> list = new ArrayList<>();
        try{
            if(request.getTenMonHoc() == null ||request.getTenMonHoc().isEmpty()){
                request.setTenMonHoc("");
            }

            if (request.getBaseRequest().getSortOrder().isEmpty()) {
                request.getBaseRequest().setSortOrder("asc");
            }
            if(request.getBaseRequest().getSortField().isEmpty()){
                request.getBaseRequest().setSortField("id_mh");
            }

            Integer totalRecords = subjectDao.countTotalRecords(request);
            int totalPages = totalRecords!= null?(int) Math.ceil((double)
                    totalRecords / request.getBaseRequest().getPageSize()): 0;


            List<SubjectEntity> list1 = subjectDao.findSubject(request);

            list = list1.stream().map(x ->{
                try {
                    return Convert.convertEntityToDTO(x, SubjectDTO.class);
                } catch (IllegalAccessException | InstantiationException e) {
                    return null;
                } catch (InvocationTargetException | NoSuchMethodException e) {
                    throw new RuntimeException(e);
                }
            }).filter(Objects::nonNull).collect(Collectors.toList());
            return new BaseResponse.Builder<>().setTotalPages(totalPages)
                    .setData(list).setMessage("success").setStatus(200).build();

        }catch (Exception e){
            System.out.println(e.getMessage());
            return new BaseResponse.Builder<List<StudentDTO>>().setMessage("failed => "+e.getMessage())
                    .setStatus(500).build();
        }
    }

    @Override
    public void createOrUpdateSubject(SubjectDTO subjectDTO) {
         try{
             SubjectEntity subjectEntity = Convert.convertDTOToEntity(subjectDTO, SubjectEntity.class);
             if(subjectEntity != null){
                 subjectDao.createOrUpdateSubject(subjectEntity);
             }

         }catch (Exception e){
             System.out.println(e.getMessage());
             throw new RuntimeException(e.getMessage());
         }
    }

    @Override
    public void deleteSubject(String id) {
        try {
            if(!id.trim().isEmpty()){
                subjectDao.deleteSubject(id.trim());
            }
        }catch (Exception e){
            System.out.println(e.getMessage());
            throw new RuntimeException(e.getMessage());
        }
    }
}
