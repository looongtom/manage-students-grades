package com.example.quanlysv.servlet.controller.subject;

import com.example.quanlysv.servlet.dto.request.subject.SubjectDTO;
import com.example.quanlysv.servlet.service.ISubjectService;
import com.example.quanlysv.servlet.service.impl.SubjectServiceImpl;

import javax.servlet.annotation.WebServlet;

@WebServlet("/home/subject/create-or-edit")
public class CreateOrEditSubjectController {

    private ISubjectService service;

    public CreateOrEditSubjectController(){
        this.service = new SubjectServiceImpl();
    }

    public void createOrEditSubject(){
        SubjectDTO subjectDTO = new SubjectDTO();
        subjectDTO.setIdMh("lns");
        subjectDTO.setTenMonHoc("mon tu hoc aaaaa");
        subjectDTO.setTinChi(3);
        subjectDTO.setIdKhoa("1");

        service.createOrUpdateSubject(subjectDTO);

        System.out.println("create success");
    }
}
