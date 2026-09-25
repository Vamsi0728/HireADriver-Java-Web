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

@WebServlet("/customer/login")
public class CustomerLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check empty fields
        if (email == null || email.trim().isEmpty()
                || password == null || password.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/login-failed.jsp?type=customer"
            );

            return;
        }

        String sql =
                "SELECT customer_id, full_name "
              + "FROM customer "
              + "WHERE email = ? AND password = ?";

        try (
            Connection connection =
                    DBConnection.getConnection();

            PreparedStatement statement =
                    connection.prepareStatement(sql)
        ) {

            statement.setString(1, email);
            statement.setString(2, password);

            try (ResultSet result =
                    statement.executeQuery()) {

                if (result.next()) {

                    HttpSession session =
                            request.getSession();

                    session.setAttribute(
                        "customerId",
                        result.getInt("customer_id")
                    );

                    session.setAttribute(
                        "customerName",
                        result.getString("full_name")
                    );

                    response.sendRedirect(
                        request.getContextPath()
                        + "/customer/dashboard.jsp"
                    );

                } else {

                    // Invalid login → Beautiful failed-login UI
                    response.sendRedirect(
                        request.getContextPath()
                        + "/login-failed.jsp?type=customer"
                    );
                }
            }

        } catch (Exception e) {

            e.printStackTrace();

            // Database/server error → Same professional UI
            response.sendRedirect(
                request.getContextPath()
                + "/login-failed.jsp?type=customer"
            );
        }
    }
}