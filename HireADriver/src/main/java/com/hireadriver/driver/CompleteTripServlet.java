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

@WebServlet("/driver/complete-trip")
public class CompleteTripServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdParameter =
                request.getParameter("bookingId");

        if (bookingIdParameter == null) {

            response.getWriter().println(
                "Booking ID is missing."
            );

            return;
        }

        int bookingId =
                Integer.parseInt(bookingIdParameter);

        HttpSession session =
                request.getSession(false);

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


        // Change STARTED booking to COMPLETED
        String sql =
                "UPDATE bookings "
              + "SET status = 'COMPLETED' "
              + "WHERE id = ? "
              + "AND driver_id = ? "
              + "AND status = 'STARTED'";


        // Make driver available again
        String driverSql =
                "UPDATE drivers "
              + "SET available = TRUE "
              + "WHERE driver_id = ?";


        try (Connection connection =
                DBConnection.getConnection()) {

            connection.setAutoCommit(false);

            try (PreparedStatement bookingStatement =
                    connection.prepareStatement(sql);

                 PreparedStatement driverStatement =
                    connection.prepareStatement(driverSql)) {


                // Update booking
                bookingStatement.setInt(1, bookingId);
                bookingStatement.setInt(2, driverId);

                int bookingResult =
                        bookingStatement.executeUpdate();


                if (bookingResult == 0) {

                    connection.rollback();

                    response.getWriter().println(
                        "Trip cannot be completed."
                    );

                    return;
                }


                // Make driver available
                driverStatement.setInt(1, driverId);

                driverStatement.executeUpdate();


                // Save both changes
                connection.commit();


                response.sendRedirect(
                    request.getContextPath()
                    + "/driver/my-bookings"
                );

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Trip completion failed: "
                + e.getMessage()
            );
        }
    }
}