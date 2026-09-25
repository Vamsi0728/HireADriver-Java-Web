package com.hireadriver.servlet;

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

@WebServlet("/customer/profile")
public class CustomerProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check login
        if (session == null ||
            session.getAttribute("customerId") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        // Get logged-in customer ID
        Integer customerId =
            (Integer) session.getAttribute("customerId");

        String sql =
            "SELECT customer_id, full_name, email, phone, "
            + "registration_time "
            + "FROM customer "
            + "WHERE customer_id = ?";

        try (
            Connection connection =
                DBConnection.getConnection();

            PreparedStatement statement =
                connection.prepareStatement(sql)
        ) {

            statement.setInt(1, customerId);

            try (ResultSet result = statement.executeQuery()) {

                if (result.next()) {

                    request.setAttribute(
                        "customerId",
                        result.getInt("customer_id")
                    );

                    request.setAttribute(
                        "fullName",
                        result.getString("full_name")
                    );

                    request.setAttribute(
                        "email",
                        result.getString("email")
                    );

                    request.setAttribute(
                        "phone",
                        result.getString("phone")
                    );

                    request.setAttribute(
                        "registrationTime",
                        result.getTimestamp("registration_time")
                    );

                    // Send data to profile.jsp
                    request.getRequestDispatcher(
                        "/customer/profile.jsp"
                    ).forward(request, response);

                } else {

                    response.getWriter().println(
                        "Customer profile not found."
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to load profile: "
                + e.getMessage()
            );
        }
    }
}