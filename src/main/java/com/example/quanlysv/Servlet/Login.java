package com.example.quanlysv.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name=req.getParameter("user");
        String pass=req.getParameter("pass");
        if(name.equals("admin") && pass.equals("pass")){
            resp.sendRedirect("home.jsp");
        }
        else{
            resp.sendRedirect("index.jsp");
        }
    }
}
