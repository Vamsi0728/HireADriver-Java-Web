<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String customerName =
        (String) session.getAttribute("customerName");

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

    String paymentMethod =
        (String) session.getAttribute("paymentMethod");

    String paymentId =
        (String) session.getAttribute("paymentId");

    String paymentStatus =
        (String) session.getAttribute("paymentStatus");

    if (customerName == null ||
        paymentMethod == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/customer/dashboard.jsp"
        );

        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment Successful - Hire A Driver</title>

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

.container {
    max-width: 750px;
    margin: 50px auto;
    padding: 20px;
}

.card {
    background: white;
    padding: 40px;
    border-radius: 20px;
    box-shadow: 0 7px 25px rgba(0,0,0,0.10);
}

.success {
    text-align: center;
    margin-bottom: 30px;
}

.success-icon {
    width: 90px;
    height: 90px;
    margin: 0 auto 20px;

    border-radius: 50%;

    background: #e8f8ef;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 52px;
}

.success h1 {
    color: #19a463;
    font-size: 32px;
    margin-bottom: 10px;
}

.success p {
    color: #64748b;
    font-size: 17px;
}

.status {
    text-align: center;

    background: #e8f8ef;
    color: #12844e;

    padding: 12px;

    border-radius: 8px;

    font-weight: bold;

    margin-bottom: 25px;
}

.section-title {
    font-size: 21px;
    margin-bottom: 15px;
}

.details {
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 25px;
}

.row {
    display: flex;
    justify-content: space-between;

    padding: 14px 18px;

    border-bottom: 1px solid #e2e8f0;
}

.row:last-child {
    border-bottom: none;
}

.label {
    color: #64748b;
}

.value {
    font-weight: bold;
    text-align: right;
}

.fare {
    color: #19a463;
    font-size: 20px;
}

.payment-id {
    color: #2864e8;
}

.buttons {
    display: flex;
    gap: 12px;
    justify-content: center;
    margin-top: 25px;
}

.btn {
    text-decoration: none;
    padding: 14px 22px;
    border-radius: 8px;
    color: white;
    font-weight: bold;
}

.dashboard {
    background: #2864e8;
}

.bookings {
    background: #f39c12;
}

.dashboard:hover {
    background: #174fc5;
}

.bookings:hover {
    background: #d68910;
}

@media(max-width: 600px) {

    .container {
        margin: 25px auto;
        padding: 12px;
    }

    .card {
        padding: 25px;
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
}

</style>

</head>

<body>

<div class="container">

<div class="card">


<!-- SUCCESS -->

<div class="success">

    <div class="success-icon">
        ✅
    </div>

    <h1>
        Payment Successful!
    </h1>

    <p>
        Your driver booking has been confirmed.
    </p>

</div>


<!-- STATUS -->

<div class="status">

    ✓ PAYMENT SUCCESSFUL

</div>


<!-- BOOKING DETAILS -->

<h2 class="section-title">

    📋 Booking Details

</h2>


<div class="details">


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
            Fare
        </span>

        <span class="value fare">
            ₹<%= fare %>
        </span>

    </div>

</div>


<!-- PAYMENT DETAILS -->

<h2 class="section-title">

    💳 Payment Details

</h2>


<div class="details">


    <div class="row">

        <span class="label">
            Payment Method
        </span>

        <span class="value">
            <%= paymentMethod %>
        </span>

    </div>


    <div class="row">

        <span class="label">
            Payment ID
        </span>

        <span class="value payment-id">
            <%= paymentId %>
        </span>

    </div>


    <div class="row">

        <span class="label">
            Payment Status
        </span>

        <span class="value">
            <%= paymentStatus %>
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
        class="btn bookings"
        href="<%= request.getContextPath() %>/booking/my-bookings">

        📋 My Bookings

    </a>

</div>


</div>

</div>

</body>

</html>