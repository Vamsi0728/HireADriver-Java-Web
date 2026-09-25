<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Available Drivers - Hire A Driver</title>

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
            max-width: 1200px;
            margin: 40px auto;
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
            margin-bottom: 10px;
        }

        .subtitle {
            color: #64748b;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 900px;
        }

        th {
            background: #1e293b;
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

        .select-btn {
            background: #16a34a;
            color: white;
            border: none;
            padding: 9px 15px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: bold;
        }

        .select-btn:hover {
            background: #15803d;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            background: #475569;
            color: white;
            text-decoration: none;
            padding: 10px 18px;
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

        <h2>🚗 Hire A Driver</h2>

    </div>


    <div class="container">

        <div class="card">

            <h2 class="title">Available Drivers</h2>

            <p class="subtitle">

                Select a registered driver for your booking.

            </p>


            <%

                ResultSet drivers =
                    (ResultSet) request.getAttribute("drivers");

                String vehicleType =
                    (String) request.getAttribute("vehicleType");

            %>


            <% if (vehicleType != null) { %>

                <p>
                    <strong>Selected Vehicle:</strong>
                    <%= vehicleType %>
                </p>

            <% } %>


            <table>

                <tr>

                    <th>Driver ID</th>

                    <th>Driver Name</th>

                    <th>Phone</th>

                    <th>Email</th>

                    <th>License Number</th>

                    <th>Vehicle Type</th>

                    <th>Vehicle Number</th>

                    <th>Action</th>

                </tr>


                <%

                    if (drivers != null) {

                        boolean hasDrivers = false;

                        while (drivers.next()) {

                            hasDrivers = true;

                %>


                <tr>

                    <td>
                        <%= drivers.getInt("driver_id") %>
                    </td>


                    <td>
                        👤 <%= drivers.getString("full_name") %>
                    </td>


                    <td>
                        <%= drivers.getString("phone") %>
                    </td>


                    <td>
                        <%= drivers.getString("email") != null
                            ? drivers.getString("email")
                            : "-" %>
                    </td>


                    <td>
                        <%= drivers.getString("license_number") != null
                            ? drivers.getString("license_number")
                            : "-" %>
                    </td>


                    <td>
                        🚗 <%= drivers.getString("vehicle_type") %>
                    </td>


                    <td>
                        <%= drivers.getString("vehicle_number") != null
                            ? drivers.getString("vehicle_number")
                            : "-" %>
                    </td>


                    <td>

                        <form
                            action="<%= request.getContextPath() %>/driver-booking/select"
                            method="post"
                            style="margin:0;">

                            <input
                                type="hidden"
                                name="driverId"
                                value="<%= drivers.getInt("driver_id") %>">

                            <button
                                type="submit"
                                class="select-btn"
                                onclick="return confirm('Select this driver for your booking?');">

                                Select Driver

                            </button>

                        </form>

                    </td>

                </tr>


                <%

                        }


                        if (!hasDrivers) {

                %>


                <tr>

                    <td colspan="8" class="empty">

                        🚫 No registered drivers are currently available for
                        <strong><%= vehicleType %></strong>.

                    </td>

                </tr>


                <%

                        }

                    } else {

                %>


                <tr>

                    <td colspan="8" class="empty">

                        🚫 Unable to load available drivers.

                    </td>

                </tr>


                <%

                    }

                %>

            </table>


            <a
                class="back-btn"
                href="<%= request.getContextPath() %>/customer/dashboard.jsp">

                ← Back to Dashboard

            </a>

        </div>

    </div>

</body>

</html>