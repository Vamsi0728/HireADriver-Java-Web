package com.hireadriver.booking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hireadriver.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/booking/assign")
public class AssignDriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdParameter =
                request.getParameter("bookingId");

        String driverIdParameter =
                request.getParameter("driverId");

        if (bookingIdParameter == null ||
            driverIdParameter == null) {

            response.getWriter().println(
                "Booking ID or Driver ID is missing."
            );

            return;
        }

        int bookingId = Integer.parseInt(bookingIdParameter);
        int driverId = Integer.parseInt(driverIdParameter);

        String bookingSql =
                "UPDATE bookings "
              + "SET driver_id = ?, status = 'CONFIRMED' "
              + "WHERE id = ?";

        String driverSql =
                "UPDATE drivers "
              + "SET available = FALSE "
              + "WHERE driver_id = ?";

        try (Connection connection = DBConnection.getConnection()) {

            connection.setAutoCommit(false);

            try (PreparedStatement bookingStatement =
                    connection.prepareStatement(bookingSql);
                 PreparedStatement driverStatement =
                    connection.prepareStatement(driverSql)) {

                // Update booking
                bookingStatement.setInt(1, driverId);
                bookingStatement.setInt(2, bookingId);

                int bookingResult =
                        bookingStatement.executeUpdate();

                if (bookingResult == 0) {

                    connection.rollback();

                    response.getWriter().println(
                        "Driver assignment failed. Booking not found."
                    );

                    return;
                }

                // Make driver unavailable
                driverStatement.setInt(1, driverId);

                int driverResult =
                        driverStatement.executeUpdate();

                if (driverResult == 0) {

                    connection.rollback();

                    response.getWriter().println(
                        "Driver assignment failed. Driver not found."
                    );

                    return;
                }

                connection.commit();

                response.sendRedirect(
                    request.getContextPath()
                    + "/booking/booking-success.jsp"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Driver assignment failed: "
                + e.getMessage()
            );
        }
    }
}