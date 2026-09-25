package com.hireadriver.admin;

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

@WebServlet("/admin/customers")
public class AdminCustomersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("adminUsername") == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-login.jsp"
            );

            return;
        }

        String sql =
            "SELECT customer_id, full_name, email, phone, "
          + "registration_time "
          + "FROM customer "
          + "ORDER BY customer_id DESC";

        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement =
                 connection.prepareStatement(sql);
             ResultSet result = statement.executeQuery()) {

            request.setAttribute("customers", result);

            request.getRequestDispatcher(
                "/admin/customers.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Unable to load customers: "
                + e.getMessage()
            );
        }
    }
}