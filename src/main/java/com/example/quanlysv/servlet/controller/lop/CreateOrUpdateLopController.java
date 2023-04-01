package com.example.quanlysv.servlet.controller.lop;

import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.service.ILopService;
import com.example.quanlysv.servlet.service.impl.LopServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("/home/lop/create-or-update")
public class CreateOrUpdateLopController extends HttpServlet {
    private ILopService service;

    public CreateOrUpdateLopController(ILopService service) {
        this.service = new LopServiceImpl();
    }

    public void createLop(){
        LopDTO lopDTO = new LopDTO();
        lopDTO.setIdLop("LOP_001");
        lopDTO.setTenLop("Vien Thong 11");
        lopDTO.setIdKhoa("KHOA_002");

        service.createOrUpdateLop(lopDTO);
        System.out.println("tao thanh cong");
    }
}
