package com.hireadriver.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.hireadriver.dao.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/payment/process")
public class PaymentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(
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

        String paymentMethod =
                request.getParameter("paymentMethod");

        if (paymentMethod == null ||
            paymentMethod.isEmpty()) {

            response.sendRedirect(
                request.getContextPath()
                + "/payment/payment.jsp"
            );

            return;
        }

        /*
         * Check whether this is:
         * 1. Hire a Driver
         * 2. Book a Vehicle
         */

        String vehicleType =
                (String) session.getAttribute("bookingVehicleType");

        String pickup =
                (String) session.getAttribute("bookingPickup");

        String drop =
                (String) session.getAttribute("bookingDrop");

        String date =
                (String) session.getAttribute("bookingDate");

        String time =
                (String) session.getAttribute("bookingTime");

        String fare =
                (String) session.getAttribute("bookingFare");

        String driverId =
                (String) session.getAttribute("selectedDriverId");


        /*
         * If Hire a Driver details are not available,
         * check Book a Vehicle details.
         */

        if (vehicleType == null) {

            vehicleType =
                    (String) session.getAttribute(
                        "vehicleBookingType"
                    );

            pickup =
                    (String) session.getAttribute(
                        "vehicleBookingPickup"
                    );

            drop =
                    (String) session.getAttribute(
                        "vehicleBookingDrop"
                    );

            date =
                    (String) session.getAttribute(
                        "vehicleBookingDate"
                    );

            time =
                    (String) session.getAttribute(
                        "vehicleBookingTime"
                    );

            fare =
                    (String) session.getAttribute(
                        "vehicleBookingFare"
                    );

            // Vehicle booking does not have a selected driver
            driverId = null;
        }


        /*
         * Validate booking details
         */

        if (vehicleType == null ||
            pickup == null ||
            drop == null ||
            date == null ||
            time == null ||
            fare == null) {

            response.sendRedirect(
                request.getContextPath()
                + "/customer/dashboard.jsp"
            );

            return;
        }


        Connection connection = null;

        try {

            connection = DBConnection.getConnection();

            if (connection == null) {

                throw new Exception(
                    "Database connection failed."
                );
            }


            /*
             * Insert trip
             */

            String tripSql =
                    "INSERT INTO trips "
                    + "(pickup_location, drop_location, "
                    + "trip_date, trip_time, amount) "
                    + "VALUES (?, ?, ?, ?, ?)";

            int tripId;

            try (PreparedStatement tripStatement =
                    connection.prepareStatement(
                        tripSql,
                        Statement.RETURN_GENERATED_KEYS
                    )) {

                tripStatement.setString(
                    1,
                    pickup
                );

                tripStatement.setString(
                    2,
                    drop
                );

                tripStatement.setDate(
                    3,
                    java.sql.Date.valueOf(date)
                );

                tripStatement.setTime(
                    4,
                    java.sql.Time.valueOf(
                        time + ":00"
                    )
                );

                tripStatement.setBigDecimal(
                    5,
                    new BigDecimal(fare)
                );

                tripStatement.executeUpdate();


                /*
                 * Get generated trip ID
                 */

                try (ResultSet keys =
                        tripStatement.getGeneratedKeys()) {

                    if (keys.next()) {

                        tripId =
                            keys.getInt(1);

                    } else {

                        throw new Exception(
                            "Unable to create trip."
                        );
                    }
                }
            }


            /*
             * Insert booking
             */

            String bookingSql =
                    "INSERT INTO bookings "
                    + "(customer_id, driver_id, trip_id, status) "
                    + "VALUES (?, ?, ?, ?)";

            try (PreparedStatement bookingStatement =
                    connection.prepareStatement(
                        bookingSql
                    )) {

                bookingStatement.setInt(
                    1,
                    customerId
                );


                /*
                 * Driver ID
                 *
                 * Hire a Driver:
                 * selected driver ID is saved.
                 *
                 * Book a Vehicle:
                 * driver ID is NULL.
                 */

                if (driverId != null &&
                    !driverId.isEmpty()) {

                    bookingStatement.setInt(
                        2,
                        Integer.parseInt(driverId)
                    );

                } else {

                    bookingStatement.setNull(
                        2,
                        java.sql.Types.INTEGER
                    );
                }


                bookingStatement.setInt(
                    3,
                    tripId
                );

                bookingStatement.setString(
                    4,
                    "CONFIRMED"
                );

                bookingStatement.executeUpdate();
            }


            /*
             * Store common booking details
             * so payment-success.jsp can display
             * both types of bookings.
             */

            session.setAttribute(
                "bookingVehicleType",
                vehicleType
            );

            session.setAttribute(
                "bookingPickup",
                pickup
            );

            session.setAttribute(
                "bookingDrop",
                drop
            );

            session.setAttribute(
                "bookingDate",
                date
            );

            session.setAttribute(
                "bookingTime",
                time
            );

            session.setAttribute(
                "bookingFare",
                fare
            );


            /*
             * Payment information
             */

            String paymentId =
                    "HD" + System.currentTimeMillis();

            session.setAttribute(
                "paymentMethod",
                paymentMethod
            );

            session.setAttribute(
                "paymentId",
                paymentId
            );

            session.setAttribute(
                "paymentStatus",
                "SUCCESS"
            );


            /*
             * Payment successful
             */

            response.sendRedirect(
                request.getContextPath()
                + "/payment/payment-success.jsp"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "Booking failed: "
                + e.getMessage()
            );


        } finally {

            if (connection != null) {

                try {
                    connection.close();

                } catch (Exception ignored) {
                }
            }
        }
    }
}