package com.example.quanlysv.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String url = "jdbc:sqlserver://localhost:1433;databaseName=QuanLySV";
    private static final String userSql = "sb";
    private static final String passSql = "123456";
    private static final String DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    private static Connection con = null;

    public void init() throws ServletException {

        // Database connection through Driver Manager
        try {
            Class.forName( "com.microsoft.sqlserver.jdbc.SQLServerDriver");
            con = DriverManager.getConnection(url, userSql, passSql);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("user");
        String password=req.getParameter("pass");
        try{
//            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            Connection con = DriverManager.getConnection(url, userSql, passSql);
//            Statement stm=con.createStatement();
            String sql="select * from quantri where username=? and password=?";
            PreparedStatement stmt=con.prepareStatement(sql);
            stmt.setString( 1,username );
            stmt.setString( 2,password );
            ResultSet rs =stmt.executeQuery();
            if(rs.next()){
                System.out.println("connected");
                resp.sendRedirect("home.jsp");
            }
            else{
                System.out.println("unconnected");

                resp.sendRedirect("index.jsp");
            }
            con.close();
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

//        if(username.equals("admin") && password.equals("pass")){
//            resp.sendRedirect("home.jsp");
//        }
//        else{
//            resp.sendRedirect("index.jsp");
//        }
    }
}
