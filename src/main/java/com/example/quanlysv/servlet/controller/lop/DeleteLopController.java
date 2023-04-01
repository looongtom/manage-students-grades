package com.example.quanlysv.servlet.controller.lop;

import com.example.quanlysv.servlet.service.ILopService;
import com.example.quanlysv.servlet.service.impl.LopServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/home/lop/delete")
public class DeleteLopController extends HttpServlet {
    private ILopService service;

    public DeleteLopController(ILopService service){this.service=new LopServiceImpl();}
    public void deleteLopById(){
        String id ="LOP_001";
        service.deleteLopById(id);
        System.out.println("delete successfully");
    }
}


