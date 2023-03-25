package com.example.quanlysv.servlet;

import com.example.quanlysv.Connection.ConnectPostgreSql;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/Login")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ConnectPostgreSql.ConnectDatabase();
        String username=req.getParameter("user");
        String password=req.getParameter("pass");
        try{
            String sql="select * from giangvien where sdt_gv=? and id_gv=?";
            PreparedStatement stmt=ConnectPostgreSql.Conn.prepareStatement(sql);
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
    }
    public void destroy() {

        // Close connection object.
        try {
            ConnectPostgreSql.Conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
