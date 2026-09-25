<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>All Bookings - Hire A Driver</title>

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

        .container {
            max-width: 1400px;
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

        h2 {
            color: #1e293b;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1200px;
        }

        th {
            background: #7c3aed;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
        }

        tr:hover {
            background: #f8fafc;
        }

        .status {
            font-weight: bold;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            background: #475569;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background: #334155;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #64748b;
        }

    </style>

</head>

<body>

    <div class="header">

        <h2>🚗 Hire A Driver - Admin</h2>

    </div>


    <div class="container">

        <div class="card">

            <h2>All Bookings</h2>

            <%
                ResultSet bookings =
                    (ResultSet) request.getAttribute("bookings");
            %>

            <table>

                <tr>

                    <th>Booking ID</th>
                    <th>Customer</th>
                    <th>Customer Phone</th>
                    <th>Driver</th>
                    <th>Driver Phone</th>
                    <th>Pickup</th>
                    <th>Drop</th>
                    <th>Date</th>
                    <th>Time</th>
                    <th>Amount</th>
                    <th>Status</th>

                </tr>

                <%

                    if (bookings != null) {

                        boolean hasBookings = false;

                        while (bookings.next()) {

                            hasBookings = true;

                %>

                <tr>

                    <td>
                        <%= bookings.getInt("booking_id") %>
                    </td>

                    <td>
                        <%= bookings.getString("customer_name") %>
                    </td>

                    <td>
                        <%= bookings.getString("customer_phone") %>
                    </td>

                    <td>
                        <%= bookings.getString("driver_name") != null
                            ? bookings.getString("driver_name")
                            : "Not Assigned" %>
                    </td>

                    <td>
                        <%= bookings.getString("driver_phone") != null
                            ? bookings.getString("driver_phone")
                            : "-" %>
                    </td>

                    <td>
                        <%= bookings.getString("pickup_location") %>
                    </td>

                    <td>
                        <%= bookings.getString("drop_location") %>
                    </td>

                    <td>
                        <%= bookings.getDate("trip_date") %>
                    </td>

                    <td>
                        <%= bookings.getTime("trip_time") %>
                    </td>

                    <td>
                        ₹<%= bookings.getBigDecimal("amount") %>
                    </td>

                    <td class="status">
                        <%= bookings.getString("status") %>
                    </td>

                </tr>

                <%

                        }

                        if (!hasBookings) {

                %>

                <tr>

                    <td colspan="11" class="empty">
                        No bookings available.
                    </td>

                </tr>

                <%

                        }

                    }

                %>

            </table>


            <a class="back-btn"
               href="<%= request.getContextPath() %>/admin/admin-dashboard.jsp">
                ← Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>