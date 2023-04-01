package com.example.quanlysv.servlet.controller.student;

import com.example.quanlysv.servlet.service.IStudentService;
import com.example.quanlysv.servlet.service.impl.StudentServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@WebServlet("/home/student/delete")
public class DeleteStudentController extends HttpServlet {


    private IStudentService service;

    public DeleteStudentController(IStudentService service){
        this.service = new StudentServiceImpl();
    }

    public void deleteStudentById(){

        // test delete student ==> done ==> cho ghep front end
        String id = "SV001";
        service.deleteStudentById(id);

        System.out.println("xoa thanh cong");
    }


}
