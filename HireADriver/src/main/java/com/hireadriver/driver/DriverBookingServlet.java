package com.hireadriver.driver;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/driver-booking/book")
public class DriverBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Integer customerId =
                (Integer) session.getAttribute("customerId");

        if (customerId == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/login.jsp"
            );

            return;
        }

        String vehicleType =
                request.getParameter("vehicleType");

        String pickupLocation =
                request.getParameter("pickupLocation");

        String dropLocation =
                request.getParameter("dropLocation");

        String tripDate =
                request.getParameter("tripDate");

        String tripTime =
                request.getParameter("tripTime");

        String fare =
                request.getParameter("fare");


        // Save booking details in session

        session.setAttribute(
            "bookingVehicleType",
            vehicleType
        );

        session.setAttribute(
            "bookingPickup",
            pickupLocation
        );

        session.setAttribute(
            "bookingDrop",
            dropLocation
        );

        session.setAttribute(
            "bookingDate",
            tripDate
        );

        session.setAttribute(
            "bookingTime",
            tripTime
        );

        session.setAttribute(
            "bookingFare",
            fare
        );


        // Load registered drivers from MySQL

        response.sendRedirect(
            request.getContextPath()
            + "/driver/available"
        );
    }
}