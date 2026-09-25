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

@WebServlet("/driver/start-trip")
public class StartTripServlet extends HttpServlet {

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

        int bookingId = Integer.parseInt(bookingIdParameter);

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
            "UPDATE bookings "
          + "SET status = 'STARTED' "
          + "WHERE id = ? "
          + "AND driver_id = ? "
          + "AND status = 'CONFIRMED'";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, bookingId);
            statement.setInt(2, driverId);

            int result = statement.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/driver/my-bookings"
                );

            } else {

                response.getWriter().println(
                    "Trip cannot be started."
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Trip start failed: "
                + e.getMessage()
            );
        }
    }
}