package com.example.quanlysv.Servlet;

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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            String sql ="DELETE from sinhvien where id_sv =?";
            PreparedStatement stmt=conn.prepareStatement(sql.toString());
            stmt.setString( 1, request.getParameter("id_sv") );
//            stmt.setString( 1,jsonObject.get("first_name").getAsString() );
//            stmt.setString( 2,jsonObject.get("last_name").getAsString() );
//            stmt.setInt( 3,jsonObject.get("age").getAsInt() );
//            stmt.setString( 4,jsonObject.get("address").getAsString() );
            stmt.executeUpdate();
//            out.println("<html><body><b>Successfully Inserted"
//                    + "</b></body></html>");

            RequestDispatcher RequetsDispatcherObj =request.getRequestDispatcher("/List_SV.jsp");
            RequetsDispatcherObj.forward(request, response);

            stmt.close();
            out.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
