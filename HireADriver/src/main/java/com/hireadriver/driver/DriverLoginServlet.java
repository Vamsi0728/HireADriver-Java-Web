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

@WebServlet("/driver/login")
public class DriverLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Validate login fields
        if (email == null ||
            email.trim().isEmpty() ||
            phone == null ||
            phone.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/log/login-failed.jsp?type=driver"
            );

            return;
        }

        String sql =
                "SELECT driver_id, full_name, email, phone, "
              + "vehicle_type, vehicle_number, available "
              + "FROM drivers "
              + "WHERE email = ? AND phone = ?";

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(
                1,
                email.trim()
            );

            statement.setString(
                2,
                phone.trim()
            );

            try (ResultSet result =
                    statement.executeQuery()) {

                if (result.next()) {

                    HttpSession session =
                            request.getSession();

                    session.setAttribute(
                        "driverId",
                        result.getInt("driver_id")
                    );

                    session.setAttribute(
                        "driverName",
                        result.getString("full_name")
                    );

                    session.setAttribute(
                        "driverEmail",
                        result.getString("email")
                    );

                    session.setAttribute(
                        "driverPhone",
                        result.getString("phone")
                    );

                    session.setAttribute(
                        "driverVehicleType",
                        result.getString("vehicle_type")
                    );

                    session.setAttribute(
                        "driverVehicleNumber",
                        result.getString("vehicle_number")
                    );

                    session.setAttribute(
                        "driverAvailable",
                        result.getBoolean("available")
                    );

                    // Successful login
                    response.sendRedirect(
                        request.getContextPath()
                        + "/driver/driver-dashboard.jsp"
                    );

                } else {

                    // Wrong email or phone
                    response.sendRedirect(
                        request.getContextPath()
                        + "/log/login-failed.jsp?type=driver"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            // Database/server error
            response.sendRedirect(
                request.getContextPath()
                + "/log/login-failed.jsp?type=driver"
            );
        }
    }
}