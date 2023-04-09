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
        if (url.startsWith("/home")) {
            AccountEntity model = (AccountEntity) SessionUtils.getInstance().getValue(request, "ACCOUNT");
            if (model == null) {
                response.sendRedirect("/");
                // chuyển hướng đến trang đăng nhập nếu chưa đăng nhập
                return;
            }
            RoleEntity role = service.findRoleWithId(model.getRoleId());
            if (role == null) {
                response.sendRedirect("/");
                // chuyển hướng đến trang đăng nhập nếu không tìm thấy role của user
                return;
            }
            if (role.getRoleName().equals(Constant.ADMIN)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else if (role.getRoleName().equals(Constant.USER)) {
                filterChain.doFilter(servletRequest, servletResponse);
            } else {
                response.sendRedirect("/");
                // chuyển hướng đến trang đăng nhập nếu role không phải admin hoặc user
            }
            return;
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
        Filter.super.destroy();
    }
}
