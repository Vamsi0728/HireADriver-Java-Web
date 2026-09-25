package com.hireadriver.driver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hireadriver.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/driver/register")
public class DriverRegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String licenseNumber = request.getParameter("licenseNumber");
        String vehicleType = request.getParameter("vehicleType");
        String vehicleNumber = request.getParameter("vehicleNumber");

        String sql = "INSERT INTO drivers "
                   + "(full_name, phone, email, license_number, "
                   + "vehicle_type, vehicle_number) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, fullName);
            statement.setString(2, phone);
            statement.setString(3, email);
            statement.setString(4, licenseNumber);
            statement.setString(5, vehicleType);
            statement.setString(6, vehicleNumber);

            int result = statement.executeUpdate();

            if (result > 0) {
                response.sendRedirect(
                    request.getContextPath()
                    + "/driver/driver-success.jsp"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Driver registration failed: "
                + e.getMessage()
            );
        }
    }
}