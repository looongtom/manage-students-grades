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

@WebServlet("/Add_SV")
public class Add_SV extends HttpServlet {
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
    public int ConvertGender(String gender){
        if(gender.equals("Nam"))return 1;
        return 0;
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            String sql ="INSERT INTO sinhvien(id_sv, ten_sv, email_sv, dob_sv, gender_sv, phone_sv, lop_hanh_chinh_sv)VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement stmt=conn.prepareStatement(sql.toString());
            stmt.setString( 1, request.getParameter("id_sv") );
            stmt.setString(2,new String(request.getParameter("ten_sv").getBytes("ISO-8859-1"),"UTF-8"));
            stmt.setString(3, request.getParameter("email_sv") );
            stmt.setString(4, request.getParameter("dob_sv") );
            stmt.setInt(5, ConvertGender(request.getParameter("gender_sv" )));
            stmt.setString(6, request.getParameter("phone_sv") );
            stmt.setString(7, request.getParameter("lop_hanh_chinh_sv") );


//            stmt.setString( 1,jsonObject.get("first_name").getAsString() );
//            stmt.setString( 2,jsonObject.get("last_name").getAsString() );
//            stmt.setInt( 3,jsonObject.get("age").getAsInt() );
//            stmt.setString( 4,jsonObject.get("address").getAsString() );

            stmt.executeUpdate();


//            out.println("<html><body><b>Successfully Inserted"
//                    + "</b></body></html>");


            RequestDispatcher dispatcher = request.getRequestDispatcher("List_SV.jsp");
            dispatcher.forward(request, response);

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