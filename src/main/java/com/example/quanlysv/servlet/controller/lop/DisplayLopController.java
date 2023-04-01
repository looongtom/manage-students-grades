package com.example.quanlysv.servlet.controller.lop;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.lop.LopDTO;
import com.example.quanlysv.servlet.service.ILopService;
import com.example.quanlysv.servlet.service.impl.LopServiceImpl;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.util.List;

@WebServlet("/home/lop/display")
public class DisplayLopController extends HttpServlet {
    private ILopService service;

    public DisplayLopController(ILopService service) {
        this.service = new LopServiceImpl();
    }

    public List<LopDTO>findLop(){
        BaseRequest request=new BaseRequest();
        request.setPageIndex(0);
        request.setPageSize(7);
        request.setSortField("tenLop");
        request.setSortOrder("desc");
        return service.findLop(request);
    }
}
