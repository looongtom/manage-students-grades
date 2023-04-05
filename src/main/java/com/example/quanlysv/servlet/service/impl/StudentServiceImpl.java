package com.example.quanlysv.servlet.service.impl;

import com.example.quanlysv.servlet.dao.IStudentDao;
import com.example.quanlysv.servlet.dao.impl.StudentDaoImpl;
import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.entity.StudentEntity;
import com.example.quanlysv.servlet.service.IStudentService;
import com.example.quanlysv.servlet.util.Convert;
import org.apache.log4j.Logger;
import java.util.ArrayList;
import java.util.List;

public class StudentServiceImpl implements IStudentService {

    private static final org.apache.log4j.Logger log = Logger.getLogger(StudentServiceImpl.class.getName());
    private IStudentDao studentDao;

    public StudentServiceImpl(){
        studentDao = new StudentDaoImpl();
    }

    @Override
    public BaseResponse<?> findStudent(BaseRequest request) {
        List<StudentDTO> result = new ArrayList<>();
        try{

            if (request.getSortOrder().isEmpty()) {
                request.setSortOrder("asc");
            }
            if(request.getSortField().isEmpty()){
                request.setSortField("id_sv");
            }

            List<StudentEntity> list = studentDao.findStudent(request);
            for(int i=0; i< list.size(); i++){
                result.add(Convert.convertEntityToDTO(list.get(i), StudentDTO.class));
            }
            return new BaseResponse.Builder<List<StudentDTO>>().setMessage("success")
                    .setStatus(200).setData(result).build();
        }catch (Exception e){
            log.error("failed by => ", e.getCause());
            return new BaseResponse.Builder<List<StudentDTO>>().setMessage("failed => "+e.getMessage())
                    .setStatus(500).build();
        }
    }

    @Override
    public void createOrUpdateStudent(StudentDTO studentDTO) {
        try {
            StudentEntity studentEntity = Convert.convertDTOToEntity(studentDTO, StudentEntity.class);
            if(studentEntity != null){
                studentDao.createOrUpdateStudent(studentEntity);
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e.getMessage());
        } catch (InstantiationException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    @Override
    public void deleteStudentById(String id) {
        try{
            if(!id.trim().isEmpty()) {
                studentDao.deleteStudentById(id.trim());
            }
        }catch (Exception e){
            throw new RuntimeException("create student failed: "+ e.getMessage());
        }
    }
}
