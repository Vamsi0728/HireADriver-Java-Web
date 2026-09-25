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
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Select Driver - Hire A Driver</title>

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

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 32px;
    font-weight: bold;
}

.back {
    background: #2864e8;
    color: white;
    text-decoration: none;

    padding: 12px 22px;
    border-radius: 8px;
}

.container {
    max-width: 1000px;
    margin: 45px auto;
    padding: 20px;
}

.title {
    background: white;
    padding: 35px;
    border-radius: 18px;
    text-align: center;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.08);

    margin-bottom: 30px;
}

.title h1 {
    font-size: 38px;
    margin-bottom: 10px;
}

.title p {
    color: #60708a;
    font-size: 18px;
}

.booking-summary {
    background: white;
    padding: 25px;

    border-radius: 18px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.08);

    margin-bottom: 30px;
}

.summary-title {
    font-size: 23px;
    margin-bottom: 20px;
}

.summary-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
}

.summary-item {
    background: #f4f6f9;
    padding: 16px;
    border-radius: 10px;
}

.summary-label {
    color: #60708a;
    font-size: 14px;
    margin-bottom: 5px;
}

.summary-value {
    font-size: 17px;
    font-weight: bold;
}

.fare {
    color: #19a463;
    font-size: 22px;
}

.driver-card {
    background: white;

    padding: 25px;

    border-radius: 18px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.08);

    margin-bottom: 20px;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.driver-info {
    display: flex;
    align-items: center;
    gap: 20px;
}

.driver-icon {
    width: 75px;
    height: 75px;

    background: #eef4ff;

    border-radius: 50%;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 40px;
}

.driver-name {
    font-size: 23px;
    font-weight: bold;

    margin-bottom: 8px;
}

.driver-details {
    color: #60708a;
    line-height: 1.7;
}

.select-btn {
    background: #19a463;

    color: white;

    border: none;

    padding: 14px 25px;

    border-radius: 9px;

    font-size: 17px;

    font-weight: bold;

    cursor: pointer;
}

.select-btn:hover {
    background: #12844e;
}

@media(max-width: 700px) {

    .summary-grid {
        grid-template-columns: 1fr;
    }

    .driver-card {
        flex-direction: column;
        gap: 20px;
        align-items: flex-start;
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

    <a class="back"
       href="<%= request.getContextPath() %>/driver-booking/book.jsp">

        ← Back

    </a>

</div>


<div class="container">


    <div class="title">

        <h1>

            Select Your Driver

        </h1>

        <p>

            Available drivers for your journey

        </p>

    </div>


    <!-- BOOKING SUMMARY -->

    <div class="booking-summary">

        <h2 class="summary-title">

            📋 Booking Details

        </h2>


        <div class="summary-grid">


            <div class="summary-item">

                <div class="summary-label">
                    Vehicle
                </div>

                <div class="summary-value">
                    <%= vehicleType %>
                </div>

            </div>


            <div class="summary-item">

                <div class="summary-label">
                    Pickup
                </div>

                <div class="summary-value">
                    <%= pickup %>
                </div>

            </div>


            <div class="summary-item">

                <div class="summary-label">
                    Drop
                </div>

                <div class="summary-value">
                    <%= drop %>
                </div>

            </div>


            <div class="summary-item">

                <div class="summary-label">
                    Date
                </div>

                <div class="summary-value">
                    <%= date %>
                </div>

            </div>


            <div class="summary-item">

                <div class="summary-label">
                    Time
                </div>

                <div class="summary-value">
                    <%= time %>
                </div>

            </div>


            <div class="summary-item">

                <div class="summary-label">
                    Driver Fare
                </div>

                <div class="summary-value fare">
                    ₹<%= fare %>
                </div>

            </div>


        </div>

    </div>


    <!-- DRIVER 1 -->

    <div class="driver-card">

        <div class="driver-info">

            <div class="driver-icon">
                👨‍✈️
            </div>

            <div>

                <div class="driver-name">
                    Ravi Kumar
                </div>

                <div class="driver-details">

                    📞 9876543210<br>

                    🚗 <%= vehicleType %><br>

                    ⭐ 4.8 Rating

                </div>

            </div>

        </div>


        <form
            action="<%= request.getContextPath() %>/driver-booking/select"
            method="post">

            <input
                type="hidden"
                name="driverId"
                value="1">

            <button
                type="submit"
                class="select-btn">

                Select Driver

            </button>

        </form>

    </div>


    <!-- DRIVER 2 -->

    <div class="driver-card">

        <div class="driver-info">

            <div class="driver-icon">
                👨‍✈️
            </div>

            <div>

                <div class="driver-name">
                    Suresh Kumar
                </div>

                <div class="driver-details">

                    📞 9876501234<br>

                    🚗 <%= vehicleType %><br>

                    ⭐ 4.7 Rating

                </div>

            </div>

        </div>


        <form
            action="<%= request.getContextPath() %>/driver-booking/select"
            method="post">

            <input
                type="hidden"
                name="driverId"
                value="2">

            <button
                type="submit"
                class="select-btn">

                Select Driver

            </button>

        </form>

    </div>


    <!-- DRIVER 3 -->

    <div class="driver-card">

        <div class="driver-info">

            <div class="driver-icon">
                👨‍✈️
            </div>

            <div>

                <div class="driver-name">
                    Mahesh Kumar
                </div>

                <div class="driver-details">

                    📞 9876512345<br>

                    🚗 <%= vehicleType %><br>

                    ⭐ 4.6 Rating

                </div>

            </div>

        </div>


        <form
            action="<%= request.getContextPath() %>/driver-booking/select"
            method="post">

            <input
                type="hidden"
                name="driverId"
                value="3">

            <button
                type="submit"
                class="select-btn">

                Select Driver

            </button>

        </form>

    </div>


</div>

</body>

</html>