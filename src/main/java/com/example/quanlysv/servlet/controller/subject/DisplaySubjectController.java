package com.example.quanlysv.servlet.controller.subject;


import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.service.ISubjectService;
import com.example.quanlysv.servlet.service.impl.SubjectServiceImpl;

import javax.servlet.annotation.WebServlet;
import java.util.List;

@WebServlet("/home/subject/display")
public class DisplaySubjectController {


    private ISubjectService service;

    public DisplaySubjectController(){
        this.service = new SubjectServiceImpl();
    }
    //test --> done --> ok cho front-end
    public List<SubjectDTO> findSubject(){
        BaseRequest request = new BaseRequest();
        request.setPageIndex(0);
        request.setPageSize(7);
        request.setSortField("tenMonHoc");
        request.setSortOrder("desc");
        return service.findSubject(request);

    }
}
