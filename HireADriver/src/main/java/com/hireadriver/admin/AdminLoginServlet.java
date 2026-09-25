package com.hireadriver.admin;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");

        // Validate empty fields
        if (username == null ||
            username.trim().isEmpty() ||
            password == null ||
            password.trim().isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/log/login-failed.jsp?type=admin"
            );

            return;
        }

        // Admin credentials
        if ("admin".equals(username.trim()) &&
            "admin123".equals(password)) {

            HttpSession session =
                    request.getSession();

            session.setAttribute(
                "adminUsername",
                username.trim()
            );

            // Successful login
            response.sendRedirect(
                request.getContextPath()
                + "/admin/admin-dashboard.jsp"
            );

        } else {

            // Invalid login
            response.sendRedirect(
                request.getContextPath()
                + "/log/login-failed.jsp?type=admin"
            );
        }
    }
}