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

@WebServlet("/driver/my-bookings")
public class DriverBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

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
            "SELECT b.id AS booking_id, "
          + "c.full_name AS customer_name, "
          + "c.phone AS customer_phone, "
          + "t.pickup_location, "
          + "t.drop_location, "
          + "t.trip_date, "
          + "t.trip_time, "
          + "t.amount, "
          + "b.status "
          + "FROM bookings b "
          + "JOIN customer c ON b.customer_id = c.customer_id "
          + "JOIN trips t ON b.trip_id = t.id "
          + "WHERE b.driver_id = ? "
          + "ORDER BY b.booking_date DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setInt(1, driverId);

            ResultSet result = statement.executeQuery();

            request.setAttribute("bookings", result);

            request.getRequestDispatcher(
                "/driver/my-bookings.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to load driver bookings: "
                + e.getMessage()
            );
        }
    }
}