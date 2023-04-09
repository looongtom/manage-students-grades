package com.example.quanlysv.servlet.controller.subject;


import com.example.quanlysv.servlet.service.ISubjectService;
import com.example.quanlysv.servlet.service.impl.SubjectServiceImpl;

import javax.servlet.annotation.WebServlet;

@WebServlet("/home/subject/delete")
public class DeleteSubjectController {
    private ISubjectService service;

    public DeleteSubjectController(){
        this.service = new SubjectServiceImpl();
    }


    public void deleteSubject(){
        String id = "1";
        service.deleteSubject(id);
    }
}
