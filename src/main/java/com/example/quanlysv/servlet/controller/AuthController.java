package com.example.quanlysv.servlet.controller;

import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.service.IAuthService;
import com.example.quanlysv.servlet.service.impl.AuthServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/auth/login")
public class AuthController extends HttpServlet {

    private IAuthService authService;

    public AuthController(){
        authService = new AuthServiceImpl();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        AccountEntity accountEntity = new AccountEntity();
        accountEntity = authService.findAccountByUsernameAndPassword(username, password);

        if(accountEntity != null){
            // lưu đăng nhập vào session
            HttpSession session = req.getSession();
            session.setMaxInactiveInterval(60*60);

            session.setAttribute("username", username);
            session.setAttribute("role", accountEntity.getRoleId());

            resp.sendRedirect("/home/home.jsp");
        }
        else{
            String errorMessage = "Invalid username or password";
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
