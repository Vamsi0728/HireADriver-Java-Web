<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String driverName =
        (String) session.getAttribute("driverName");

    Integer driverId =
        (Integer) session.getAttribute("driverId");

    Boolean driverAvailable =
        (Boolean) session.getAttribute("driverAvailable");

    if (driverName == null || driverId == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/driver/driver-login.jsp"
        );

        return;
    }

    // Default status
    if (driverAvailable == null) {
        driverAvailable = false;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Driver Dashboard - Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
        }

        .header {
            background: #1e293b;
            color: white;
            padding: 20px 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logout {
            color: white;
            text-decoration: none;
            background: #dc2626;
            padding: 10px 18px;
            border-radius: 6px;
        }

        .logout:hover {
            background: #b91c1c;
        }

        .container {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .welcome {
            background: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 25px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .welcome h1 {
            color: #1e293b;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #64748b;
        }

        /* Availability */

        .availability-card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 30px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .availability-card h2 {
            color: #1e293b;
            margin-bottom: 15px;
        }

        .current-status {
            display: inline-block;
            padding: 12px 25px;
            border-radius: 30px;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .available-status {
            background: #dcfce7;
            color: #15803d;
        }

        .unavailable-status {
            background: #fee2e2;
            color: #b91c1c;
        }

        .availability-buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
            flex-wrap: wrap;
        }

        .available-btn {
            border: none;
            background: #16a34a;
            color: white;
            padding: 12px 25px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .available-btn:hover {
            background: #15803d;
        }

        .unavailable-btn {
            border: none;
            background: #dc2626;
            color: white;
            padding: 12px 25px;
            border-radius: 7px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
        }

        .unavailable-btn:hover {
            background: #b91c1c;
        }

        /* Menu */

        .menu {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .card h3 {
            color: #1e293b;
            margin-bottom: 12px;
        }

        .card p {
            color: #64748b;
            margin-bottom: 20px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        @media (max-width: 768px) {

            .menu {
                grid-template-columns: 1fr;
            }

            .header {
                padding: 20px;
            }

        }

    </style>

</head>

<body>


    <!-- HEADER -->

    <div class="header">

        <h2>🚗 Hire A Driver</h2>

        <a class="logout"
           href="<%= request.getContextPath() %>/driver/logout">

            Logout

        </a>

    </div>


    <div class="container">


        <!-- WELCOME -->

        <div class="welcome">

            <h1>
                Welcome, <%= driverName %>!
            </h1>

            <p>
                Manage your assigned trips and driver profile.
            </p>

        </div>


        <!-- AVAILABILITY -->

        <div class="availability-card">

            <h2>🚦 Driver Availability</h2>


            <% if (driverAvailable) { %>

                <div class="current-status available-status">

                    🟢 You are currently AVAILABLE

                </div>

            <% } else { %>

                <div class="current-status unavailable-status">

                    🔴 You are currently UNAVAILABLE

                </div>

            <% } %>


            <div class="availability-buttons">


                <!-- AVAILABLE -->

                <form
                    action="<%= request.getContextPath() %>/driver/toggle-availability"
                    method="post">

                    <input
                        type="hidden"
                        name="available"
                        value="true">

                    <button
                        type="submit"
                        class="available-btn">

                        🟢 Set Available

                    </button>

                </form>


                <!-- UNAVAILABLE -->

                <form
                    action="<%= request.getContextPath() %>/driver/toggle-availability"
                    method="post">

                    <input
                        type="hidden"
                        name="available"
                        value="false">

                    <button
                        type="submit"
                        class="unavailable-btn">

                        🔴 Set Unavailable

                    </button>

                </form>

            </div>

        </div>


        <!-- MENU -->

        <div class="menu">


            <!-- BOOKINGS -->

            <div class="card">

                <h3>📋 My Assigned Bookings</h3>

                <p>
                    View your assigned customer bookings
                    and manage trips.
                </p>

                <a
                    class="btn"
                    href="<%= request.getContextPath() %>/driver/my-bookings">

                    View Bookings

                </a>

            </div>


            <!-- PROFILE -->

            <div class="card">

                <h3>👤 My Profile</h3>

                <p>
                    View your driver information and
                    vehicle details.
                </p>

                <a
                    class="btn"
                    href="<%= request.getContextPath() %>/driver/profile">

                    View Profile

                </a>

            </div>


        </div>

    </div>

</body>

</html>