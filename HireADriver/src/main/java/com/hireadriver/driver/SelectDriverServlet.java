package com.hireadriver.driver;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/driver-booking/select")
public class SelectDriverServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // Check customer login
        Integer customerId =
                (Integer) session.getAttribute("customerId");

        if (customerId == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        // Get selected driver
        String driverId =
                request.getParameter("driverId");

        if (driverId == null || driverId.isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/driver-booking/available-drivers.jsp"
            );

            return;
        }

        // Save selected driver in session
        session.setAttribute(
            "selectedDriverId",
            driverId
        );

        // Go directly to Payment Page
        response.sendRedirect(
            request.getContextPath()
            + "/payment/payment.jsp"
        );
    }
}