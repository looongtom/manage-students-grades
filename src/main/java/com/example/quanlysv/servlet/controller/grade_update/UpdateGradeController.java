package com.example.quanlysv.servlet.controller.grade_update;

import com.example.quanlysv.servlet.dto.request.diem.UpdateGradeDTO;
import com.example.quanlysv.servlet.dto.request.student.CreateOrEditStudentDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.service.IGradeService;
import com.example.quanlysv.servlet.service.impl.GradeServiceImpl;
import com.example.quanlysv.servlet.util.HttpUtil;
import com.example.quanlysv.servlet.util.ResponseUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/admin/grade/update")
public class UpdateGradeController extends HttpServlet {
    private IGradeService service;
    public UpdateGradeController(){
        this.service = new GradeServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        UpdateGradeDTO baseRequest = HttpUtil.of(req.getReader()).toModel(UpdateGradeDTO.class);
        BaseResponse<?> baseResponse = service.UpdateGrade(baseRequest);
        ResponseUtils.responseApi(req, resp, baseResponse);

    }
}
