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

@WebServlet("/driver/toggle-availability")
public class DriverAvailabilityServlet extends HttpServlet {

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

        String availability =
                request.getParameter("available");

        boolean available =
                "true".equalsIgnoreCase(availability);

        String sql =
                "UPDATE drivers "
              + "SET available = ? "
              + "WHERE driver_id = ?";

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setBoolean(1, available);
            statement.setInt(2, driverId);

            int result =
                    statement.executeUpdate();

            if (result > 0) {

                // Update current session status
                session.setAttribute(
                    "driverAvailable",
                    available
                );

                response.sendRedirect(
                    request.getContextPath()
                    + "/driver/driver-dashboard.jsp"
                );

            } else {

                response.getWriter().println(
                    "Driver availability could not be updated."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to update availability: "
                + e.getMessage()
            );
        }
    }
}