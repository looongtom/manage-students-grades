package com.example.quanlysv.servlet.controller.giangvien.api;

import com.example.quanlysv.servlet.dto.request.BaseRequest;
import com.example.quanlysv.servlet.dto.request.teacher.TeacherDTO;
import com.example.quanlysv.servlet.dto.response.BaseResponse;
import com.example.quanlysv.servlet.service.ITeacherService;
import com.example.quanlysv.servlet.service.impl.TeacherServiceImpl;
import com.example.quanlysv.servlet.util.HttpUtil;
import com.example.quanlysv.servlet.util.ResponseUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/api/home/teacher")
public class TeacherController extends HttpServlet {
    private ITeacherService service;

    public TeacherController() {
        this.service = new TeacherServiceImpl();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        BaseRequest baseRequest = HttpUtil.of(req.getReader()).toModel(BaseRequest.class);
        BaseResponse<?> baseResponse = service.findTeacher(baseRequest);
        ResponseUtils.responseApi(req, resp, baseResponse);
    }

//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("UTF-8");
//        resp.setContentType("application/json");
//        TeacherDTO teacherDTO = HttpUtil.of(req.getReader()).toModel(TeacherDTO.class);
//        BaseResponse<?> baseResponse = service.createOrEditTeacher(teacherDTO);
//        ResponseUtils.responseApi(req,resp,baseResponse);
//    }
//
//    @Override
//    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        req.setCharacterEncoding("UTF-8");
//        resp.setContentType("application/json");
//        TeacherDTO teacherDTO = HttpUtil.of(req.getReader()).toModel(TeacherDTO.class);
//        BaseResponse<?> baseResponse = service.createOrEditTeacher(teacherDTO);
//        ResponseUtils.responseApi(req, resp, baseResponse);
//    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");
        String id = req.getParameter("id");
        BaseResponse<?> baseResponse = service.deleteTeacher(id);
        ResponseUtils.responseApi(req, resp, baseResponse);
    }
}
