package com.hireadriver.booking;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.hireadriver.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking/book")
public class BookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String tripIdParameter = request.getParameter("tripId");

        if (tripIdParameter == null) {
            response.getWriter().println("Trip ID is missing.");
            return;
        }

        int tripId = Integer.parseInt(tripIdParameter);

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("customerId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        int customerId =
            (Integer) session.getAttribute("customerId");

        String sql = "INSERT INTO bookings "
                   + "(customer_id, trip_id, status) "
                   + "VALUES (?, ?, 'BOOKED')";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                 connection.prepareStatement(
                     sql,
                     Statement.RETURN_GENERATED_KEYS)) {

            statement.setInt(1, customerId);
            statement.setInt(2, tripId);

            int result = statement.executeUpdate();

            if (result > 0) {

                ResultSet keys = statement.getGeneratedKeys();

                if (keys.next()) {

                    int bookingId = keys.getInt(1);

                    response.sendRedirect(
                        request.getContextPath()
                        + "/driver/available?bookingId="
                        + bookingId
                    );
                }

            } else {

                response.getWriter().println(
                    "Booking failed."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Booking failed: " + e.getMessage()
            );
        }
    }
}