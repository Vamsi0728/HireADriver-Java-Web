<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Drivers - Hire A Driver</title>

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

        h2 {
            color: #1e293b;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1100px;
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

        .available {
            color: #16a34a;
            font-weight: bold;
        }

        .unavailable {
            color: #dc2626;
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

            <h2>Registered Drivers</h2>

            <%
                ResultSet drivers =
                    (ResultSet) request.getAttribute("drivers");
            %>

            <table>

                <tr>

                    <th>Driver ID</th>
                    <th>Full Name</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>License Number</th>
                    <th>Vehicle Type</th>
                    <th>Vehicle Number</th>
                    <th>Availability</th>

                </tr>

                <%

                    if (drivers != null) {

                        boolean hasDrivers = false;

                        while (drivers.next()) {

                            hasDrivers = true;

                            boolean available =
                                drivers.getBoolean("available");

                %>

                <tr>

                    <td>
                        <%= drivers.getInt("driver_id") %>
                    </td>

                    <td>
                        <%= drivers.getString("full_name") %>
                    </td>

                    <td>
                        <%= drivers.getString("phone") %>
                    </td>

                    <td>
                        <%= drivers.getString("email") %>
                    </td>

                    <td>
                        <%= drivers.getString("license_number") %>
                    </td>

                    <td>
                        <%= drivers.getString("vehicle_type") %>
                    </td>

                    <td>
                        <%= drivers.getString("vehicle_number") %>
                    </td>

                    <td>

                        <% if (available) { %>

                            <span class="available">
                                Available
                            </span>

                        <% } else { %>

                            <span class="unavailable">
                                Busy
                            </span>

                        <% } %>

                    </td>

                </tr>

                <%

                        }

                        if (!hasDrivers) {

                %>

                <tr>

                    <td colspan="8" class="empty">
                        No drivers registered yet.
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