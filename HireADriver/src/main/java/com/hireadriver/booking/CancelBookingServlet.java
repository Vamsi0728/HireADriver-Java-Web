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
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking/cancel")
public class CancelBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String bookingIdParameter =
                request.getParameter("bookingId");

        // Check booking ID
        if (bookingIdParameter == null ||
            bookingIdParameter.isEmpty()) {

            response.getWriter().println(
                "Booking ID is missing."
            );

            return;
        }

        int bookingId;

        try {

            bookingId =
                Integer.parseInt(bookingIdParameter);

        } catch (NumberFormatException e) {

            response.getWriter().println(
                "Invalid Booking ID."
            );

            return;
        }


        // Check customer login
        HttpSession session =
                request.getSession(false);

        if (session == null ||
            session.getAttribute("customerId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }


        int customerId =
                (Integer) session.getAttribute(
                    "customerId"
                );


        /*
         * Cancel only the customer's own booking.
         *
         * CONFIRMED bookings can also be cancelled.
         *
         * STARTED and COMPLETED bookings
         * cannot be cancelled.
         */

        String sql =
                "UPDATE bookings "
              + "SET status = 'CANCELLED' "
              + "WHERE id = ? "
              + "AND customer_id = ? "
              + "AND status IN ('BOOKED', 'CONFIRMED')";


        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setInt(1, bookingId);
            statement.setInt(2, customerId);

            int result =
                    statement.executeUpdate();


            if (result > 0) {

                // Successfully cancelled
                response.sendRedirect(
                    request.getContextPath()
                    + "/booking/my-bookings"
                );

            } else {

                response.getWriter().println(
                    "Booking cannot be cancelled. "
                    + "It may already be cancelled, "
                    + "started, completed, or does not belong to you."
                );
            }


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Cancellation failed: "
                + e.getMessage()
            );
        }
    }
}