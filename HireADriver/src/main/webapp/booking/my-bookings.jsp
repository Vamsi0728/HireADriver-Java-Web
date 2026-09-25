<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>My Bookings - Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f4f6f9;
        }

        .header {
            background: #1e293b;
            color: white;
            padding: 20px 40px;
        }

        .header h2 {
            margin: 0;
        }

        .container {
            max-width: 1250px;
            margin: 35px auto;
            padding: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        .title {
            color: #1e293b;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1050px;
        }

        th {
            background: #1e293b;
            color: white;
            padding: 12px;
            text-align: left;
        }

        td {
            padding: 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        tr:hover {
            background: #f8fafc;
        }

        .status {
            font-weight: bold;
        }

        .cancel {
            background: #dc2626;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
        }

        .cancel:hover {
            background: #b91c1c;
        }

        .back {
            display: inline-block;
            margin-top: 25px;
            background: #2563eb;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 6px;
        }

        .back:hover {
            background: #1d4ed8;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #64748b;
        }

        .vehicle-booking {
            font-weight: bold;
        }

    </style>

</head>

<body>

    <div class="header">

        <h2>🚗 Hire A Driver</h2>

    </div>


    <div class="container">

        <div class="card">

            <h2 class="title">📋 My Bookings</h2>


            <%

                ResultSet bookings =
                    (ResultSet) request.getAttribute("bookings");

            %>


            <table>

                <tr>

                    <th>Booking ID</th>

                    <th>Pickup</th>

                    <th>Drop</th>

                    <th>Date</th>

                    <th>Time</th>

                    <th>Amount</th>

                    <th>Driver</th>

                    <th>Driver Phone</th>

                    <th>Vehicle</th>

                    <th>Vehicle Number</th>

                    <th>Status</th>

                    <th>Action</th>

                </tr>


                <%

                    if (bookings != null) {

                        boolean hasBookings = false;

                        while (bookings.next()) {

                            hasBookings = true;

                            String driverName =
                                bookings.getString("driver_name");

                            String driverPhone =
                                bookings.getString("driver_phone");

                            String vehicleType =
                                bookings.getString("vehicle_type");

                            String vehicleNumber =
                                bookings.getString("vehicle_number");

                            String status =
                                bookings.getString("status");

                %>


                <tr>

                    <!-- Booking ID -->

                    <td>
                        <%= bookings.getInt("booking_id") %>
                    </td>


                    <!-- Pickup -->

                    <td>
                        <%= bookings.getString("pickup_location") %>
                    </td>


                    <!-- Drop -->

                    <td>
                        <%= bookings.getString("drop_location") %>
                    </td>


                    <!-- Date -->

                    <td>
                        <%= bookings.getDate("trip_date") %>
                    </td>


                    <!-- Time -->

                    <td>
                        <%= bookings.getTime("trip_time") %>
                    </td>


                    <!-- Amount -->

                    <td>
                        ₹<%= bookings.getBigDecimal("amount") %>
                    </td>


                    <!-- Driver -->

                    <td>

                        <%

                            if (driverName != null) {

                        %>

                            🚗 <%= driverName %>

                        <%

                            } else {

                        %>

                            🚕 Vehicle Booking

                        <%

                            }

                        %>

                    </td>


                    <!-- Driver Phone -->

                    <td>

                        <%

                            if (driverPhone != null) {

                        %>

                            <%= driverPhone %>

                        <%

                            } else {

                        %>

                            -

                        <%

                            }

                        %>

                    </td>


                    <!-- Vehicle -->

                    <td>

                        <%

                            if (vehicleType != null) {

                        %>

                            <%= vehicleType %>

                        <%

                            } else {

                        %>

                            Vehicle

                        <%

                            }

                        %>

                    </td>


                    <!-- Vehicle Number -->

                    <td>

                        <%

                            if (vehicleNumber != null) {

                        %>

                            <%= vehicleNumber %>

                        <%

                            } else {

                        %>

                            -

                        <%

                            }

                        %>

                    </td>


                    <!-- Status -->

                    <td class="status">

                        <%= status %>

                    </td>


                    <!-- Action -->

                    <td>

                        <%

                            if ("BOOKED".equals(status)) {

                        %>

                            <a class="cancel"
                               href="<%= request.getContextPath() %>/booking/cancel?bookingId=<%= bookings.getInt("booking_id") %>"
                               onclick="return confirm('Are you sure you want to cancel this booking?');">

                                Cancel

                            </a>

                        <%

                            } else {

                        %>

                            -

                        <%

                            }

                        %>

                    </td>

                </tr>


                <%

                        }


                        if (!hasBookings) {

                %>


                <tr>

                    <td colspan="12" class="empty">

                        You have no bookings yet.

                    </td>

                </tr>


                <%

                        }

                    }

                %>

            </table>


            <a class="back"
               href="<%= request.getContextPath() %>/customer/dashboard.jsp">

                ← Back to Dashboard

            </a>

        </div>

    </div>

</body>

</html>