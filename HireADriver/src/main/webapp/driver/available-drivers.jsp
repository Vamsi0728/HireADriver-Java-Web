<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<%
    // Get drivers from servlet
    ResultSet drivers =
            (ResultSet) request.getAttribute("drivers");

    // Get vehicle selected by customer
    String vehicleType =
            (String) request.getAttribute("vehicleType");

    // If data is missing, go back
    if (drivers == null || vehicleType == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/driver-booking/book.jsp"
        );

        return;
    }
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>
        Available Drivers - Hire A Driver
    </title>


    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }


        body {
            background: #f4f6f9;
            color: #1e293b;
        }


        /* ================= HEADER ================= */

        .header {

            background: #1e293b;

            color: white;

            padding: 22px;

            text-align: center;

        }


        .header h1 {

            font-size: 26px;

        }


        /* ================= CONTAINER ================= */

        .container {

            max-width: 950px;

            margin: 40px auto;

            padding: 20px;

        }


        .page-title {

            text-align: center;

            margin-bottom: 8px;

            color: #1e293b;

        }


        .subtitle {

            text-align: center;

            color: #64748b;

            margin-bottom: 30px;

        }


        /* ================= VEHICLE ================= */

        .vehicle-badge {

            display: block;

            width: fit-content;

            margin: 0 auto 30px auto;

            background: #dbeafe;

            color: #1d4ed8;

            padding: 10px 20px;

            border-radius: 25px;

            font-weight: bold;

        }


        /* ================= DRIVER CARD ================= */

        .driver-card {

            background: white;

            border-radius: 14px;

            padding: 25px;

            margin-bottom: 20px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.08);

            border-left: 5px solid #2563eb;

            transition: 0.2s;

        }


        .driver-card:hover {

            transform: translateY(-3px);

            box-shadow:
                0 8px 22px rgba(0,0,0,0.12);

        }


        /* ================= DRIVER HEADER ================= */

        .driver-header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 15px;

            margin-bottom: 18px;

        }


        .driver-name {

            font-size: 23px;

            font-weight: bold;

            color: #1e293b;

        }


        .available {

            background: #dcfce7;

            color: #15803d;

            padding: 7px 13px;

            border-radius: 20px;

            font-size: 13px;

            font-weight: bold;

        }


        /* ================= DETAILS ================= */

        .details {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 12px;

            margin-bottom: 20px;

        }


        .detail {

            background: #f8fafc;

            padding: 13px;

            border-radius: 8px;

        }


        .detail-label {

            display: block;

            color: #64748b;

            font-size: 13px;

            margin-bottom: 5px;

        }


        .detail-value {

            color: #1e293b;

            font-weight: bold;

            font-size: 15px;

        }


        /* ================= SELECT BUTTON ================= */

        .select-btn {

            width: 100%;

            border: none;

            background: #2563eb;

            color: white;

            padding: 13px;

            border-radius: 8px;

            cursor: pointer;

            font-size: 16px;

            font-weight: bold;

        }


        .select-btn:hover {

            background: #1d4ed8;

        }


        /* ================= EMPTY ================= */

        .empty {

            background: white;

            padding: 45px 25px;

            text-align: center;

            border-radius: 14px;

            box-shadow:
                0 4px 15px rgba(0,0,0,0.07);

        }


        .empty-icon {

            font-size: 55px;

            margin-bottom: 15px;

        }


        .empty h2 {

            margin-bottom: 10px;

            color: #1e293b;

        }


        .empty p {

            color: #64748b;

            margin-bottom: 20px;

        }


        .back-btn {

            display: inline-block;

            text-decoration: none;

            background: #2563eb;

            color: white;

            padding: 11px 20px;

            border-radius: 7px;

            font-weight: bold;

        }


        .back-btn:hover {

            background: #1d4ed8;

        }


        /* ================= MOBILE ================= */

        @media (max-width: 650px) {

            .container {

                margin: 20px auto;

                padding: 15px;

            }


            .driver-header {

                flex-direction: column;

                align-items: flex-start;

            }


            .details {

                grid-template-columns: 1fr;

            }

        }

    </style>

</head>


<body>


<!-- ================= HEADER ================= -->

<div class="header">

    <h1>
        🚗 Hire A Driver
    </h1>

</div>


<div class="container">


    <h1 class="page-title">
        Available Drivers
    </h1>


    <p class="subtitle">
        Choose an available driver for your booking
    </p>


    <div class="vehicle-badge">

        🚗 Selected Vehicle:
        <%= vehicleType %>

    </div>


<%

    boolean found = false;


    while (drivers.next()) {

        found = true;


        int driverId =
                drivers.getInt("driver_id");


        String driverName =
                drivers.getString("full_name");


        String phone =
                drivers.getString("phone");


        String email =
                drivers.getString("email");


        String licenseNumber =
                drivers.getString("license_number");


        String driverType =
                drivers.getString("driver_type");


        String activeVehicle =
                drivers.getString("active_vehicle");


        String vehicleNumber =
                drivers.getString("vehicle_number");

%>


    <!-- ================= DRIVER CARD ================= -->

    <div class="driver-card">


        <div class="driver-header">


            <div class="driver-name">

                👤 <%= driverName %>

            </div>


            <div class="available">

                🟢 Available

            </div>


        </div>


        <div class="details">


            <!-- DRIVER TYPE -->

            <div class="detail">

                <span class="detail-label">
                    Driver Type
                </span>

                <span class="detail-value">

                    <%= driverType != null
                        ? driverType
                        : "Driver" %>

                </span>

            </div>


            <!-- VEHICLE -->

            <div class="detail">

                <span class="detail-label">
                    Vehicle
                </span>

                <span class="detail-value">

                    <%= activeVehicle != null
                        ? activeVehicle
                        : vehicleType %>

                </span>

            </div>


            <!-- PHONE -->

            <div class="detail">

                <span class="detail-label">
                    Phone
                </span>

                <span class="detail-value">

                    <%= phone %>

                </span>

            </div>


            <!-- VEHICLE NUMBER -->

            <div class="detail">

                <span class="detail-label">
                    Vehicle Number
                </span>

                <span class="detail-value">

                    <%= vehicleNumber != null
                        ? vehicleNumber
                        : "Not Available" %>

                </span>

            </div>


            <!-- LICENSE -->

            <div class="detail">

                <span class="detail-label">
                    License Number
                </span>

                <span class="detail-value">

                    <%= licenseNumber != null
                        ? licenseNumber
                        : "Not Available" %>

                </span>

            </div>


            <!-- EMAIL -->

            <div class="detail">

                <span class="detail-label">
                    Email
                </span>

                <span class="detail-value">

                    <%= email != null
                        ? email
                        : "Not Available" %>

                </span>

            </div>


        </div>


        <!-- ================= SELECT DRIVER ================= -->

        <form
            action="<%= request.getContextPath() %>/driver-booking/select"
            method="post">


            <input
                type="hidden"
                name="driverId"
                value="<%= driverId %>">


            <button
                type="submit"
                class="select-btn">

                ✅ Select This Driver

            </button>


        </form>


    </div>


<%
    }


    // ================= NO DRIVER =================

    if (!found) {
%>


    <div class="empty">


        <div class="empty-icon">
            😔
        </div>


        <h2>
            No Drivers Available
        </h2>


        <p>

            Currently no driver is available
            for <strong><%= vehicleType %></strong>.

        </p>


        <a
            href="<%= request.getContextPath() %>/driver-booking/book.jsp"
            class="back-btn">

            ← Choose Another Vehicle

        </a>


    </div>


<%
    }
%>


</div>


</body>

</html>