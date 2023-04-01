package com.example.quanlysv.servlet.controller.student;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.student.StudentDTO;
import com.example.quanlysv.servlet.service.IStudentService;
import com.example.quanlysv.servlet.service.impl.StudentServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;

@WebServlet("/home/student/display")
public class DisplayStudentController extends HttpServlet {

    private IStudentService service;

    public DisplayStudentController(IStudentService service){
        this.service = new StudentServiceImpl();
    }

    public  List<StudentDTO> findStudent(){
        // test find student => done ==> cho front-end
        BaseRequest request = new BaseRequest();
        request.setPageIndex(0);
        request.setPageSize(7);
        request.setSortField("tenSv");
        request.setSortOrder("desc");
        return service.findStudent(request);
    }



}
