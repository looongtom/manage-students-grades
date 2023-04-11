package com.example.quanlysv.servlet.security;

import com.example.quanlysv.servlet.common.Constant;
import com.example.quanlysv.servlet.entity.AccountEntity;
import com.example.quanlysv.servlet.entity.RoleEntity;
import com.example.quanlysv.servlet.service.IRoleService;
import com.example.quanlysv.servlet.service.impl.RoleServiceImpl;
import com.example.quanlysv.servlet.util.SessionUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AuthenticationFilter implements Filter {

    private IRoleService service;

    public AuthenticationFilter(){
        this.service = new RoleServiceImpl();
    }

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
        AccountEntity model = (AccountEntity) SessionUtils.getInstance().getValue(request, "ACCOUNT");

        if(model != null){
            if(url.equals("/") || url.contains("/auth/login.jsp")){
                response.sendRedirect("/home/home.jsp");
                return;
            }
        }

        if(url.equals("/") || url.contains("assets") ||url.startsWith("/auth")){
            filterChain.doFilter(servletRequest, servletResponse);
        }

        else if (url.startsWith("/home") && url.startsWith(".jsp", url.length()-4)) {
            if (model == null) {
                response.sendRedirect("/");
                return;
            }
            RoleEntity role = service.findRoleWithId(model.getRoleId());
            if (role == null) {
                response.sendRedirect("/");
                return;
            }

            if (role.getRoleName().equals(Constant.ADMIN)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else if (role.getRoleName().equals(Constant.USER)) {
                filterChain.doFilter(servletRequest, servletResponse);

            } else {
                response.sendRedirect("/");
            }
        }
        else{
            response.sendRedirect("/auth/page_404.jsp");
        }
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
