package com.hireadriver.trip;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.hireadriver.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/trip/register")
public class TripRegistrationServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String pickupLocation = request.getParameter("pickupLocation");
        String dropLocation = request.getParameter("dropLocation");
        String tripDate = request.getParameter("tripDate");
        String tripTime = request.getParameter("tripTime");
        String amount = request.getParameter("amount");

        String sql = "INSERT INTO trips "
                   + "(pickup_location, drop_location, trip_date, "
                   + "trip_time, amount) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                     connection.prepareStatement(sql)) {

            statement.setString(1, pickupLocation);
            statement.setString(2, dropLocation);
            statement.setString(3, tripDate);
            statement.setString(4, tripTime);
            statement.setBigDecimal(5, new BigDecimal(amount));

            int result = statement.executeUpdate();

            if (result > 0) {

                response.sendRedirect(
                    request.getContextPath()
                    + "/trip/trip-success.jsp"
                );
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Trip registration failed: " + e.getMessage()
            );
        }
    }
}