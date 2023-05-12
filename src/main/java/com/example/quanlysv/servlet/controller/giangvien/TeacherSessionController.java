package com.example.quanlysv.servlet.controller.giangvien;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/admin/teacher")
public class TeacherSessionController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String tenGv = request.getParameter("tenGv");
        if(tenGv==null) tenGv="";

        String sortField = request.getParameter("sortField");
        if(sortField==null) sortField="";

        String sortOrder = request.getParameter("sortOrder");
        if(sortOrder==null) sortOrder="";

        String pageIndex = request.getParameter("pageIndex");
        if(pageIndex==null) pageIndex="1";

        String pageSize = request.getParameter("pageSize");
        if(pageSize==null) pageSize="10";

        System.out.println("pageIndex in Session: " + pageIndex);
        System.out.println("pageSize in Session: " + pageSize);

        session.setAttribute("tenGv", tenGv);
        session.setAttribute("sortField", sortField);
        session.setAttribute("sortOrder", sortOrder);
        session.setAttribute("pageIndex", Integer.parseInt(pageIndex));
        session.setAttribute("pageSize", Integer.parseInt(pageSize));
        request.getRequestDispatcher("/home/admin/teacher/teacher.jsp").forward(request, response);
    }
}
