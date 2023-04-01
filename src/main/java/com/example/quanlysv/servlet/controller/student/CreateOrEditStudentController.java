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
        studentDTO.setIdSv("SV001");
        studentDTO.setEmailSv("tuan@gmail.com");
        studentDTO.setDobSv("27/01/2002");
        studentDTO.setPhoneSv("0123456789");
        studentDTO.setLopHanhChinhSv("CN11");
        studentDTO.setGenderSv("Nam");
        studentDTO.setTenSv("Trịnh Minh Tuấn");

        service.createOrUpdateStudent(studentDTO);
        System.out.println("tao thanh cong");
    }
}
