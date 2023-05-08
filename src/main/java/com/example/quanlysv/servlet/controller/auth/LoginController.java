package com.example.quanlysv.servlet.controller.auth;


import com.example.quanlysv.servlet.common.Constant;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.service.IAuthService;
import com.example.quanlysv.servlet.service.impl.AuthServiceImpl;
import com.example.quanlysv.servlet.util.CookieUtils;
import com.example.quanlysv.servlet.util.SessionUtils;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/auth/login")
public class LoginController extends HttpServlet {
    private IAuthService authService;
    public LoginController(){
        authService = new AuthServiceImpl();
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        AccountEntity accountEntity = new AccountEntity();
        accountEntity = authService.findAccountByUsernameAndPassword(username);
        try {
            if(accountEntity != null
                    && accountEntity.getStatusPasswordDefault() == 0
                    && authService.checkPassDefault(username, password)){
                SessionUtils.getInstance().putValue(req, "ACCOUNT", accountEntity);
                resp.sendRedirect("/home/common/change_password_default.jsp");
                return;
            }
            else if(accountEntity != null && BCrypt.checkpw(password, accountEntity.getPassword())){
                // lưu đăng nhập vào session
                SessionUtils.getInstance().putValue(req, "ACCOUNT", accountEntity);
                CookieUtils.getInstance().addCookie(resp, req);

                if(accountEntity.getRoleId() == 1)
                    resp.sendRedirect("/home/admin/home_admin/home_admin.jsp");
                else if (accountEntity.getRoleId() == 2) {
                    resp.sendRedirect("/home/user/home_user/home_user.jsp");
                }
                else {
                    String errorMessage = "Người dùng chưa được phân quyền!";
                    req.setAttribute("errorMessage", errorMessage);
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                }
            }
            else{
                String errorMessage = Constant.ERROR_LOGIN;
                req.setAttribute("errorMessage", errorMessage);
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        }catch (Exception e){
            String errorMessage = Constant.ERROR_LOGIN;
            req.setAttribute("errorMessage", errorMessage);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
