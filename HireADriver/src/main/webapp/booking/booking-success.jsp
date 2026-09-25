<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>Booking Successful - Hire A Driver</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 450px;
            margin: 80px auto;
            background: white;
            padding: 35px;
            border-radius: 15px;
            text-align: center;
            box-shadow: 0 5px 20px rgba(0,0,0,0.15);
        }

        .success-icon {
            font-size: 60px;
            color: green;
        }

        h2 {
            color: #222;
        }

        p {
            color: #555;
            font-size: 16px;
        }

        .btn {
            display: block;
            padding: 14px;
            margin-top: 20px;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
        }

        .payment-btn {
            background: #28a745;
        }

        .dashboard-btn {
            background: #555;
        }

        .btn:hover {
            opacity: 0.9;
        }

    </style>

</head>

<body>

<div class="container">

    <div class="success-icon">✅</div>

    <h2>Driver Selected Successfully!</h2>

    <p>
        Your driver has been selected for the booking.
    </p>

    <p>
        Please proceed to payment to confirm your booking.
    </p>

    <!-- PAYMENT BUTTON -->
    <a class="btn payment-btn"
       href="<%= request.getContextPath() %>/payment/payment.jsp">
        💳 Proceed to Payment
    </a>

    <!-- DASHBOARD -->
    <a class="btn dashboard-btn"
       href="<%= request.getContextPath() %>/customer/dashboard.jsp">
        🏠 Back to Dashboard
    </a>

</div>

</body>
</html>