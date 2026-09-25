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

        // Get existing customer session
        HttpSession session =
                request.getSession(false);

        // -----------------------------------------
        // CHECK CUSTOMER LOGIN
        // -----------------------------------------

        if (session == null ||
            session.getAttribute("customerId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        // -----------------------------------------
        // GET SELECTED VEHICLE
        // -----------------------------------------

        String vehicleType =
                (String) session.getAttribute(
                    "bookingVehicleType"
                );

        // If vehicle was not selected
        if (vehicleType == null ||
            vehicleType.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/driver-booking/book.jsp"
            );

            return;
        }

        // -----------------------------------------
        // SQL QUERY
        // -----------------------------------------
        //
        // Customer selects:
        //
        // Car
        //
        // Then we find drivers where:
        //
        // active_vehicle = Car
        // available = TRUE
        //
        // -----------------------------------------

        String sql =
                "SELECT "
              + "driver_id, "
              + "full_name, "
              + "phone, "
              + "email, "
              + "license_number, "
              + "vehicle_type, "
              + "vehicle_number, "
              + "driver_type, "
              + "active_vehicle, "
              + "available "
              + "FROM drivers "
              + "WHERE available = TRUE "
              + "AND LOWER(active_vehicle) = LOWER(?) "
              + "ORDER BY driver_id DESC";

        // -----------------------------------------
        // DATABASE CONNECTION
        // -----------------------------------------

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            // Set selected vehicle
            statement.setString(
                1,
                vehicleType.trim()
            );

            // -----------------------------------------
            // EXECUTE QUERY
            // -----------------------------------------

            try (
                ResultSet result =
                        statement.executeQuery()
            ) {

                // Send drivers to JSP
                request.setAttribute(
                    "drivers",
                    result
                );

                // Send selected vehicle to JSP
                request.setAttribute(
                    "vehicleType",
                    vehicleType
                );

                // -----------------------------------------
                // OPEN AVAILABLE DRIVERS PAGE
                // -----------------------------------------

                request.getRequestDispatcher(
                    "/driver/available-drivers.jsp"
                ).forward(
                    request,
                    response
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "<h2>Unable to load available drivers</h2>"
            );

            response.getWriter().println(
                "<p>"
                + e.getMessage()
                + "</p>"
            );
        }
    }
}