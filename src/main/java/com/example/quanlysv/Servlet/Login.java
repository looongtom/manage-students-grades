package com.example.quanlysv.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.logging.Logger;

@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String URL = "jdbc:postgresql://localhost:5432/quanlysinhvien";
    private static final String USER = "postgres";
    private static final String PASSWORD = "tr1nhtu@n";
    private static Connection conn = null;

    public void init() throws ServletException {

        // Database connection through Driver Manager
        try {
            Class.forName( "org.postgresql.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("user");
        String password=req.getParameter("pass");
        try{
            String sql="select * from giangvien where sdt_gv=? and id_gv=?";
            PreparedStatement stmt=conn.prepareStatement(sql);
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
    public void destroy() {

        // Close connection object.
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

