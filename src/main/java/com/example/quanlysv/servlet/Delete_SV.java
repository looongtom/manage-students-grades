package com.example.quanlysv.servlet;

import com.example.quanlysv.Connection.ConnectPostgreSql;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Delete_SV")
public class Delete_SV extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnectPostgreSql.ConnectDatabase();
        try {
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            String sql ="DELETE from sinhvien where id_sv =?";
            PreparedStatement stmt=ConnectPostgreSql.Conn.prepareStatement(sql.toString());
            stmt.setString( 1, request.getParameter("id_sv") );
            stmt.executeUpdate();

            RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("/List_SV.jsp");
            RequetsDispatcherObj.forward(request, response);
            stmt.close();
            out.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
//    public void destroy() {
//        // Close connection object.
//        try {
//            ConnectPostgreSql.Conn.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }
}