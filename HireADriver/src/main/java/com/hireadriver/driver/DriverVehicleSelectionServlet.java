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
import jakarta.servlet.http.HttpSession;

@WebServlet("/driver/select-vehicle")
public class DriverVehicleSelectionServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check driver login
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

        String driverType =
                request.getParameter("driverType");

        String vehicleType =
                request.getParameter("vehicleType");

        String availableValue =
                request.getParameter("available");

        // Validate
        if (driverType == null ||
            driverType.trim().isEmpty() ||
            vehicleType == null ||
            vehicleType.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/driver/driver-dashboard.jsp"
            );

            return;
        }

        boolean available =
                "true".equalsIgnoreCase(availableValue);

        String sql =
                "UPDATE drivers "
              + "SET driver_type = ?, "
              + "active_vehicle = ?, "
              + "available = ? "
              + "WHERE driver_id = ?";

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(
                1,
                driverType.trim()
            );

            statement.setString(
                2,
                vehicleType.trim()
            );

            statement.setBoolean(
                3,
                available
            );

            statement.setInt(
                4,
                driverId
            );

            int result =
                    statement.executeUpdate();

            if (result > 0) {

                // Update session
                session.setAttribute(
                    "driverAvailable",
                    available
                );

                session.setAttribute(
                    "driverType",
                    driverType.trim()
                );

                session.setAttribute(
                    "activeVehicle",
                    vehicleType.trim()
                );

                session.setAttribute(
                    "driverVehicleType",
                    vehicleType.trim()
                );

                response.sendRedirect(
                    request.getContextPath()
                    + "/driver/driver-dashboard.jsp"
                );

            } else {

                response.getWriter().println(
                    "Vehicle selection could not be updated."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to update vehicle selection: "
                + e.getMessage()
            );
        }
    }
}