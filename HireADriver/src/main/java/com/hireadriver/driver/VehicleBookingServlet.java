package com.hireadriver.driver;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/vehicle/book")
public class VehicleBookingServlet extends HttpServlet {

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

        // Get vehicle booking details
        String vehicleType =
                request.getParameter("vehicleType");

        String pickup =
                request.getParameter("pickup");

        String drop =
                request.getParameter("drop");

        String date =
                request.getParameter("date");

        String time =
                request.getParameter("time");

        String fare =
                request.getParameter("fare");

        // Validate details
        if (vehicleType == null ||
            vehicleType.isEmpty() ||
            pickup == null ||
            pickup.isEmpty() ||
            drop == null ||
            drop.isEmpty() ||
            date == null ||
            date.isEmpty() ||
            time == null ||
            time.isEmpty() ||
            fare == null ||
            fare.isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/vehicle/book.jsp"
            );

            return;
        }

        // Store vehicle booking details in session
        session.setAttribute(
            "vehicleBookingType",
            vehicleType
        );

        session.setAttribute(
            "vehicleBookingPickup",
            pickup
        );

        session.setAttribute(
            "vehicleBookingDrop",
            drop
        );

        session.setAttribute(
            "vehicleBookingDate",
            date
        );

        session.setAttribute(
            "vehicleBookingTime",
            time
        );

        session.setAttribute(
            "vehicleBookingFare",
            fare
        );

        // Go directly to Payment Page
        response.sendRedirect(
            request.getContextPath()
            + "/payment/payment.jsp"
        );
    }
}