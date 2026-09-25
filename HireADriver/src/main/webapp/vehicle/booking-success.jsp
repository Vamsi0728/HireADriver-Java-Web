<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String customerName =
        (String) session.getAttribute("customerName");

    String vehicleType =
        (String) session.getAttribute("vehicleBookingType");

    String pickup =
        (String) session.getAttribute("vehicleBookingPickup");

    String drop =
        (String) session.getAttribute("vehicleBookingDrop");

    String date =
        (String) session.getAttribute("vehicleBookingDate");

    String time =
        (String) session.getAttribute("vehicleBookingTime");

    String fare =
        (String) session.getAttribute("vehicleBookingFare");

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

<title>Vehicle Booking Successful</title>

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
    max-width: 700px;
    margin: 70px auto;
    padding: 20px;
}

.success-card {
    background: white;
    padding: 40px;
    border-radius: 20px;
    text-align: center;
    box-shadow: 0 6px 25px rgba(0,0,0,0.10);
}

.success-icon {
    font-size: 70px;
    margin-bottom: 15px;
}

h1 {
    color: #19a463;
    margin-bottom: 10px;
}

.message {
    color: #60708a;
    margin-bottom: 30px;
    font-size: 17px;
}

.details {
    text-align: left;
    border: 1px solid #e0e5eb;
    border-radius: 12px;
    overflow: hidden;
    margin-bottom: 30px;
}

.row {
    display: flex;
    justify-content: space-between;
    padding: 15px 18px;
    border-bottom: 1px solid #e0e5eb;
}

.row:last-child {
    border-bottom: none;
}

.label {
    font-weight: bold;
    color: #60708a;
}

.value {
    font-weight: bold;
}

.fare {
    color: #19a463;
    font-size: 20px;
}

.buttons {
    display: flex;
    gap: 15px;
    justify-content: center;
}

.btn {
    text-decoration: none;
    padding: 14px 25px;
    border-radius: 8px;
    font-weight: bold;
    color: white;
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

    .row {
        flex-direction: column;
        gap: 5px;
    }

    .buttons {
        flex-direction: column;
    }

}

</style>

</head>

<body>

<div class="container">

    <div class="success-card">

        <div class="success-icon">
            ✅
        </div>

        <h1>
            Vehicle Booked Successfully!
        </h1>

        <p class="message">
            Your vehicle booking has been confirmed.
        </p>


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


        <div class="buttons">

            <a
                class="btn dashboard"
                href="<%= request.getContextPath() %>/customer/dashboard.jsp">

                🏠 Dashboard

            </a>


            <a
                class="btn book-again"
                href="<%= request.getContextPath() %>/vehicle/book.jsp">

                🚕 Book Again

            </a>

        </div>

    </div>

</div>

</body>

</html>