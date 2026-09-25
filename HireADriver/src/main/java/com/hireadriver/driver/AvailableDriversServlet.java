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

@WebServlet("/driver/available")
public class AvailableDriversServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check customer login
        if (session == null ||
            session.getAttribute("customerId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        // Get selected vehicle from customer booking
        String vehicleType =
                (String) session.getAttribute(
                    "bookingVehicleType"
                );

        if (vehicleType == null ||
            vehicleType.isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/driver-booking/book.jsp"
            );

            return;
        }


        /*
         * Get only registered drivers who:
         *
         * 1. Are available
         * 2. Have the selected vehicle type
         */

        String sql =
                "SELECT driver_id, full_name, phone, "
              + "email, license_number, vehicle_type, "
              + "vehicle_number, available "
              + "FROM drivers "
              + "WHERE available = TRUE "
              + "AND LOWER(vehicle_type) = LOWER(?) "
              + "ORDER BY driver_id DESC";


        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(
                1,
                vehicleType
            );


            try (ResultSet result =
                    statement.executeQuery()) {

                request.setAttribute(
                    "drivers",
                    result
                );

                request.setAttribute(
                    "vehicleType",
                    vehicleType
                );


                request.getRequestDispatcher(
                    "/driver/available-drivers.jsp"
                ).forward(
                    request,
                    response
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to load drivers: "
                + e.getMessage()
            );
        }
    }
}