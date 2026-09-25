package com.hireadriver.booking;

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

@WebServlet("/booking/my-bookings")
public class CustomerBookingsServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check customer login
        if (session == null ||
            session.getAttribute("customerId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        Integer customerId =
            (Integer) session.getAttribute("customerId");


        String sql =
            "SELECT " +
            "b.id AS booking_id, " +
            "b.status, " +
            "t.pickup_location, " +
            "t.drop_location, " +
            "t.trip_date, " +
            "t.trip_time, " +
            "t.amount, " +
            "d.full_name AS driver_name, " +
            "d.phone AS driver_phone, " +
            "d.vehicle_type, " +
            "d.vehicle_number " +
            "FROM bookings b " +
            "JOIN trips t ON b.trip_id = t.id " +
            "LEFT JOIN drivers d ON b.driver_id = d.driver_id " +
            "WHERE b.customer_id = ? " +
            "ORDER BY b.id DESC";


        try {

            Connection connection =
                DBConnection.getConnection();

            PreparedStatement statement =
                connection.prepareStatement(sql);

            statement.setInt(1, customerId);

            ResultSet bookings =
                statement.executeQuery();


            request.setAttribute(
                "bookings",
                bookings
            );


            request.getRequestDispatcher(
                "/booking/my-bookings.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to load bookings: "
                + e.getMessage()
            );
        }
    }
}