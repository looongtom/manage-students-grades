package com.example.quanlysv.servlet.controller.lop.api;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
@WebServlet("/admin/class")

public class ClassSessionController extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String sortField = request.getParameter("sortFieldLop");
        if(sortField==null) sortField="";

        String sortOrder = request.getParameter("sortOrderLop");
        if(sortOrder==null) sortOrder="";

        String pageIndex = request.getParameter("pageIndexLop");
        if(pageIndex==null) pageIndex="1";

        String pageSize = request.getParameter("pageSizeLop");
        if(pageSize==null) pageSize="10";

        System.out.println("pageIndex in Session: " + pageIndex);
        System.out.println("pageSize in Session: " + pageSize);

        session.setAttribute("sortFieldLop", sortField);
        session.setAttribute("sortOrderLop", sortOrder);
        session.setAttribute("pageIndexLop", Integer.parseInt(pageIndex));
        session.setAttribute("pageSizeLop", Integer.parseInt(pageSize));
        request.getRequestDispatcher("/home/admin/class/class.jsp").forward(request, response);
    }
}


