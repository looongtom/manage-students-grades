package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.ISubjectDao;
import com.example.quanlysv.servlet.dao.impl.SubjectDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.entity.SubjectEntity;
import com.example.quanlysv.servlet.service.ISubjectService;
import com.example.quanlysv.servlet.util.Convert;

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
    public List<SubjectDTO> findSubject(BaseRequest baseRequest) {
        List<SubjectDTO> list = new ArrayList<>();
        try{
            List<SubjectEntity> list1 = subjectDao.findSubject(baseRequest);

            list = list1.stream().map(x ->{
                try {
                    return Convert.convertEntityToDTO(x, SubjectDTO.class);
                } catch (IllegalAccessException e) {
                    return null;
                } catch (InstantiationException e) {
                   return null;
                }
            }).filter(Objects::nonNull).collect(Collectors.toList());
            return list;

        }catch (Exception e){
            System.out.println(e.getMessage());
            return list;
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
