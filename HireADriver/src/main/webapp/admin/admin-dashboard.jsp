<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String adminUsername =
        (String) session.getAttribute("adminUsername");

    if (adminUsername == null) {
        response.sendRedirect(
            request.getContextPath() + "/admin/admin-login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Dashboard - Hire A Driver</title>

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
            margin-bottom: 30px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.08);
        }

        .welcome h1 {
            color: #1e293b;
            margin-bottom: 10px;
        }

        .welcome p {
            color: #64748b;
        }

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
            transition: 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
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
            background: #7c3aed;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
        }

        .btn:hover {
            background: #6d28d9;
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

    <div class="header">

        <h2>🚗 Hire A Driver - Admin</h2>

        <a class="logout"
           href="<%= request.getContextPath() %>/admin/logout">
            Logout
        </a>

    </div>


    <div class="container">

        <div class="welcome">

            <h1>
                Welcome, Admin!
            </h1>

            <p>
                Manage customers, drivers, trips and bookings.
            </p>

        </div>


        <div class="menu">

            <div class="card">

                <h3>👥 Customers</h3>

                <p>
                    View all registered customers.
                </p>

                <a class="btn"
                   href="<%= request.getContextPath() %>/admin/customers">
                    View Customers
                </a>

            </div>


            <div class="card">

                <h3>🚗 Drivers</h3>

                <p>
                    View registered drivers and their availability.
                </p>

                <a class="btn"
                   href="<%= request.getContextPath() %>/admin/drivers">
                    View Drivers
                </a>

            </div>


            <div class="card">

                <h3>🛣️ Trips</h3>

                <p>
                    View all available trips.
                </p>

                <a class="btn"
                   href="<%= request.getContextPath() %>/admin/trips">
                    View Trips
                </a>

            </div>


            <div class="card">

                <h3>📋 Bookings</h3>

                <p>
                    View and monitor all customer bookings.
                </p>

                <a class="btn"
                   href="<%= request.getContextPath() %>/admin/bookings">
                    View Bookings
                </a>

            </div>

        </div>

    </div>

</body>

</html>