package com.example.quanlysv.servlet.security;

import com.example.quanlysv.servlet.common.Constant;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.util.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    private ServletContext context;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        String url = request.getRequestURI();
        if(url.startsWith("/home")){
            AccountEntity model = (AccountEntity) SessionUtils.getInstance().getValue(request, "ACCOUNT");
            if(model == null){
//                 if(model.getRoleId().equals(Constant.ADMIN)){
//                     filterChain.doFilter(servletRequest, servletResponse);
//                 }
//                 else if(model.getRoleId().equals(Constant.USER)){
//                     response.sendRedirect(request.getContextPath());
//                 }
                response.sendRedirect("/");
            }
            else{
//                response.sendRedirect(request.getContextPath());
                filterChain.doFilter(servletRequest, servletResponse);
            }
        }
        else if(url.startsWith("/user")){

        }
        else if(url.startsWith("/auth")){
            // bỏ qua nếu là đăng nhập
            filterChain.doFilter(servletRequest, servletResponse);
        }
        else{
            // đi tiếp không cần filter
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
