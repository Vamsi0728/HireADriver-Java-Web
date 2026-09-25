package com.hireadriver.driver;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.hireadriver.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/driver/profile")
public class DriverProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("driverId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/driver/driver-login.jsp"
            );

            return;
        }

        int driverId =
            (Integer) session.getAttribute("driverId");

        String sql =
            "SELECT driver_id, full_name, phone, email, "
          + "license_number, vehicle_type, vehicle_number, available "
          + "FROM drivers "
          + "WHERE driver_id = ?";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                 connection.prepareStatement(sql)) {

            statement.setInt(1, driverId);

            ResultSet result = statement.executeQuery();

            if (result.next()) {

                request.setAttribute(
                    "driverId",
                    result.getInt("driver_id")
                );

                request.setAttribute(
                    "fullName",
                    result.getString("full_name")
                );

                request.setAttribute(
                    "phone",
                    result.getString("phone")
                );

                request.setAttribute(
                    "email",
                    result.getString("email")
                );

                request.setAttribute(
                    "licenseNumber",
                    result.getString("license_number")
                );

                request.setAttribute(
                    "vehicleType",
                    result.getString("vehicle_type")
                );

                request.setAttribute(
                    "vehicleNumber",
                    result.getString("vehicle_number")
                );

                request.setAttribute(
                    "available",
                    result.getBoolean("available")
                );

                request.getRequestDispatcher(
                    "/driver/profile.jsp"
                ).forward(request, response);

            } else {

                response.getWriter().println(
                    "Driver profile not found."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to load driver profile: "
                + e.getMessage()
            );
        }
    }
}