<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String customerName =
        (String) session.getAttribute("customerName");

    if (customerName == null) {
        response.sendRedirect(
            request.getContextPath()
            + "/customer/login.jsp"
        );
        return;
    }

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
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Booking Successful - Hire A Driver</title>

<style>

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: Arial, sans-serif;
    background: #f4f6f9;
    color: #17233c;
}

.header {
    background: #1d2a3f;
    color: white;
    padding: 25px 60px;
}

.logo {
    font-size: 32px;
    font-weight: bold;
}

.container {
    max-width: 850px;
    margin: 60px auto;
    padding: 20px;
}

.success-card {
    background: white;
    padding: 45px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0 5px 25px rgba(0,0,0,0.08);
}

.success-icon {
    font-size: 70px;
    margin-bottom: 20px;
}

.success-card h1 {
    color: #19a463;
    font-size: 36px;
    margin-bottom: 12px;
}

.success-card p {
    color: #60708a;
    font-size: 18px;
    margin-bottom: 30px;
}

.details {
    text-align: left;
    background: #f4f6f9;
    padding: 25px;
    border-radius: 14px;
    margin-bottom: 30px;
}

.details h2 {
    margin-bottom: 20px;
    font-size: 23px;
}

.row {
    display: flex;
    justify-content: space-between;
    padding: 12px 0;
    border-bottom: 1px solid #d8dee8;
}

.row:last-child {
    border-bottom: none;
}

.label {
    color: #60708a;
    font-weight: bold;
}

.value {
    font-weight: bold;
    text-align: right;
}

.fare {
    color: #19a463;
    font-size: 20px;
}

.driver {
    background: #eef4ff;
    padding: 20px;
    border-radius: 12px;
    margin-bottom: 30px;
}

.driver h2 {
    margin-bottom: 10px;
}

.buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
}

.btn {
    display: inline-block;
    padding: 14px 25px;
    border-radius: 9px;
    text-decoration: none;
    color: white;
    font-weight: bold;
    font-size: 16px;
}

.dashboard {
    background: #2864e8;
}

.book-again {
    background: #19a463;
}

.dashboard:hover {
    background: #174fc5;
}

.book-again:hover {
    background: #12844e;
}

@media(max-width: 600px) {

    .container {
        margin: 30px auto;
    }

    .success-card {
        padding: 25px;
    }

    .success-card h1 {
        font-size: 28px;
    }

    .row {
        flex-direction: column;
        gap: 5px;
    }

    .value {
        text-align: left;
    }

    .buttons {
        flex-direction: column;
    }

    .btn {
        text-align: center;
    }

    .header {
        padding: 20px;
    }

    .logo {
        font-size: 25px;
    }
}

</style>

</head>

<body>

<div class="header">

    <div class="logo">

        🚗 Hire A Driver

    </div>

</div>


<div class="container">

<div class="success-card">


    <div class="success-icon">

        ✅

    </div>


    <h1>

        Driver Selected Successfully!

    </h1>


    <p>

        Your driver has been selected for the journey.

    </p>


    <!-- DRIVER -->

    <div class="driver">

        <h2>

            👨‍✈️ Driver Selected

        </h2>

        <p>

            Driver ID:
            <strong><%= driverId %></strong>

        </p>

    </div>


    <!-- BOOKING DETAILS -->

    <div class="details">

        <h2>

            📋 Booking Details

        </h2>


        <div class="row">

            <span class="label">
                Customer
            </span>

            <span class="value">
                <%= customerName %>
            </span>

        </div>


        <div class="row">

            <span class="label">
                Vehicle
            </span>

            <span class="value">
                <%= vehicleType %>
            </span>

        </div>


        <div class="row">

            <span class="label">
                Pickup
            </span>

            <span class="value">
                <%= pickup %>
            </span>

        </div>


        <div class="row">

            <span class="label">
                Drop
            </span>

            <span class="value">
                <%= drop %>
            </span>

        </div>


        <div class="row">

            <span class="label">
                Date
            </span>

            <span class="value">
                <%= date %>
            </span>

        </div>


        <div class="row">

            <span class="label">
                Time
            </span>

            <span class="value">
                <%= time %>
            </span>

        </div>


        <div class="row">

            <span class="label">
                Driver Fare
            </span>

            <span class="value fare">
                ₹<%= fare %>
            </span>

        </div>


    </div>


    <!-- BUTTONS -->

    <div class="buttons">

        <a
            class="btn dashboard"
            href="<%= request.getContextPath() %>/customer/dashboard.jsp">

            🏠 Dashboard

        </a>


        <a
            class="btn book-again"
            href="<%= request.getContextPath() %>/driver-booking/book.jsp">

            🚗 Book Again

        </a>

    </div>


</div>

</div>

</body>

</html>