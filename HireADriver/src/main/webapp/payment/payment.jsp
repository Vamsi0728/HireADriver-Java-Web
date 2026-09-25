<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
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

    String customerName =
        (String) session.getAttribute("customerName");

    if (customerName == null || vehicleType == null) {

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

<title>Payment - Hire A Driver</title>

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
    padding: 22px 50px;
}

.logo {
    font-size: 30px;
    font-weight: bold;
}

.container {
    max-width: 900px;
    margin: 45px auto;
    padding: 20px;
}

.card {
    background: white;
    border-radius: 18px;
    padding: 35px;
    box-shadow: 0 6px 25px rgba(0,0,0,0.08);
}

.title {
    text-align: center;
    margin-bottom: 30px;
}

.title h1 {
    font-size: 32px;
    margin-bottom: 8px;
}

.title p {
    color: #64748b;
}

.summary {
    background: #f8fafc;
    border: 1px solid #e2e8f0;
    border-radius: 12px;
    padding: 20px;
    margin-bottom: 30px;
}

.summary h2 {
    margin-bottom: 15px;
    font-size: 21px;
}

.row {
    display: flex;
    justify-content: space-between;
    padding: 11px 0;
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
}

.fare {
    color: #19a463;
    font-size: 20px;
}

.payment-title {
    font-size: 22px;
    margin-bottom: 18px;
}

.payment-option {
    display: flex;
    align-items: center;
    gap: 15px;

    border: 2px solid #e2e8f0;
    border-radius: 12px;

    padding: 18px;
    margin-bottom: 12px;

    cursor: pointer;
    transition: 0.2s;
}

.payment-option:hover {
    border-color: #2864e8;
    background: #f8fbff;
}

.payment-option input {
    width: 18px;
    height: 18px;
}

.payment-icon {
    font-size: 30px;
}

.payment-name {
    font-size: 17px;
    font-weight: bold;
}

.payment-description {
    color: #64748b;
    font-size: 13px;
    margin-top: 4px;
}

.proceed {
    width: 100%;
    border: none;

    background: #2864e8;
    color: white;

    padding: 16px;

    border-radius: 9px;

    font-size: 18px;
    font-weight: bold;

    cursor: pointer;

    margin-top: 20px;
}

.proceed:hover {
    background: #174fc5;
}

.back {
    display: block;
    text-align: center;

    margin-top: 18px;

    color: #2864e8;
    text-decoration: none;
}

@media(max-width: 600px) {

    .header {
        padding: 20px;
    }

    .logo {
        font-size: 24px;
    }

    .container {
        margin: 25px auto;
        padding: 12px;
    }

    .card {
        padding: 22px;
    }

    .row {
        flex-direction: column;
        gap: 5px;
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

<div class="card">


<div class="title">

    <h1>
        💳 Payment
    </h1>

    <p>
        Complete your payment to confirm your booking.
    </p>

</div>


<!-- BOOKING SUMMARY -->

<div class="summary">

    <h2>
        📋 Booking Summary
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
            Total Fare
        </span>

        <span class="value fare">
            ₹<%= fare %>
        </span>

    </div>

</div>


<!-- PAYMENT OPTIONS -->

<h2 class="payment-title">

    Select Payment Method

</h2>


<form
    action="<%= request.getContextPath() %>/payment/process"
    method="post"
    onsubmit="return validatePayment();">


    <label class="payment-option">

        <input
            type="radio"
            name="paymentMethod"
            value="UPI">

        <span class="payment-icon">
            📱
        </span>

        <span>

            <span class="payment-name">
                UPI
            </span>

            <br>

            <span class="payment-description">
                Google Pay, PhonePe, Paytm and other UPI apps
            </span>

        </span>

    </label>


    <label class="payment-option">

        <input
            type="radio"
            name="paymentMethod"
            value="CARD">

        <span class="payment-icon">
            💳
        </span>

        <span>

            <span class="payment-name">
                Credit / Debit Card
            </span>

            <br>

            <span class="payment-description">
                Pay securely using your card
            </span>

        </span>

    </label>


    <label class="payment-option">

        <input
            type="radio"
            name="paymentMethod"
            value="NET_BANKING">

        <span class="payment-icon">
            🏦
        </span>

        <span>

            <span class="payment-name">
                Net Banking
            </span>

            <br>

            <span class="payment-description">
                Pay using your bank account
            </span>

        </span>

    </label>


    <label class="payment-option">

        <input
            type="radio"
            name="paymentMethod"
            value="PAY_AFTER_RIDE">

        <span class="payment-icon">
            💵
        </span>

        <span>

            <span class="payment-name">
                Pay After Ride
            </span>

            <br>

            <span class="payment-description">
                Pay the driver after completing the ride
            </span>

        </span>

    </label>


    <button
        type="submit"
        class="proceed">

        💳 Proceed to Payment

    </button>

</form>


<a
    class="back"
    href="<%= request.getContextPath() %>/driver-booking/available-drivers.jsp">

    ← Back to Driver Selection

</a>


</div>

</div>


<script>

function validatePayment() {

    let method =
        document.querySelector(
            'input[name="paymentMethod"]:checked'
        );

    if (!method) {

        alert("Please select a payment method.");

        return false;
    }

    return true;
}

</script>


</body>

</html>