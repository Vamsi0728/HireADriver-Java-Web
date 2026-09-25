<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>My Profile - Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
            min-height: 100vh;
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
            max-width: 700px;
            margin: 40px auto;
            padding: 20px;
        }

        .profile-card {
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.10);
        }

        .profile-icon {
            text-align: center;
            font-size: 55px;
            margin-bottom: 15px;
        }

        .profile-title {
            text-align: center;
            margin-bottom: 30px;
            color: #1e293b;
        }

        .info {
            border-bottom: 1px solid #e2e8f0;
            padding: 15px 0;
        }

        .label {
            color: #64748b;
            font-size: 14px;
            margin-bottom: 5px;
        }

        .value {
            color: #1e293b;
            font-size: 17px;
            font-weight: bold;
        }

        .buttons {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #2563eb;
            color: white;
            padding: 11px 22px;
            border-radius: 6px;
        }

        .btn:hover {
            background: #1d4ed8;
        }

    </style>

</head>

<body>

    <div class="header">

        <h2>🚗 Hire A Driver</h2>

    </div>


    <div class="container">

        <div class="profile-card">

            <div class="profile-icon">
                👤
            </div>

            <h2 class="profile-title">
                My Profile
            </h2>


            <div class="info">

                <div class="label">
                    Customer ID
                </div>

                <div class="value">
                    <%= request.getAttribute("customerId") %>
                </div>

            </div>


            <div class="info">

                <div class="label">
                    Full Name
                </div>

                <div class="value">
                    <%= request.getAttribute("fullName") %>
                </div>

            </div>


            <div class="info">

                <div class="label">
                    Email
                </div>

                <div class="value">
                    <%= request.getAttribute("email") %>
                </div>

            </div>


            <div class="info">

                <div class="label">
                    Phone
                </div>

                <div class="value">
                    <%= request.getAttribute("phone") %>
                </div>

            </div>


            <div class="info">

                <div class="label">
                    Registration Date
                </div>

                <div class="value">
                    <%= request.getAttribute("registrationTime") %>
                </div>

            </div>


            <div class="buttons">

                <a class="btn"
                   href="<%= request.getContextPath() %>/customer/dashboard.jsp">
                    Back to Dashboard
                </a>

            </div>

        </div>

    </div>

</body>

</html>