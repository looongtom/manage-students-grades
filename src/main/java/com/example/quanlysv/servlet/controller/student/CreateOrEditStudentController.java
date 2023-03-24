package com.example.quanlysv.servlet.controller.student;

import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.service.IStudentService;
import com.example.quanlysv.servlet.service.impl.StudentServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/home/student/create-or-edit")
public class CreateOrEditStudentController extends HttpServlet {

    private IStudentService service;

    public CreateOrEditStudentController(IStudentService service){
        this.service = new StudentServiceImpl();
    }

    public void createStudent(){
        // test create student ==> done ==> chờ front-end

        StudentDTO studentDTO = new StudentDTO();
        studentDTO.setIdSv("B10DCCN575");
        studentDTO.setEmailSv("son@gmail.com");
        studentDTO.setDobSv("aaa");
        studentDTO.setPhoneSv("097782293");
        studentDTO.setLopHanhChinhSv("aaaaaaa");
        studentDTO.setGenderSv("nam");
        studentDTO.setTenSv("sonln1");

        service.createOrUpdateStudent(studentDTO);
        System.out.println("tao thanh cong");
    }
}
