<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            background: linear-gradient(
                135deg,
                #0f172a,
                #2563eb
            );
        }

        .card {
            background: white;
            width: 90%;
            max-width: 500px;

            padding: 50px 35px;

            border-radius: 24px;

            text-align: center;

            box-shadow:
                0 20px 50px rgba(0,0,0,0.25);
        }

        .icon {
            font-size: 60px;
            margin-bottom: 15px;
        }

        h1 {
            color: #0f172a;
            margin-bottom: 10px;
        }

        p {
            color: #64748b;
            margin-bottom: 30px;
        }

        .btn {
            display: block;

            text-decoration: none;

            padding: 14px;

            margin: 12px 0;

            border-radius: 9px;

            font-weight: bold;

            color: white;

            background: #2563eb;
        }

        .btn:hover {
            background: #1d4ed8;
        }

    </style>

</head>

<body>

<div class="card">

    <div class="icon">
        🚗
    </div>

    <h1>
        Hire A Driver
    </h1>

    <p>
        Your trusted driver and vehicle booking platform
    </p>

    <a
        class="btn"
        href="<%= request.getContextPath() %>/customer/login.jsp">

        👤 Customer Login

    </a>

    <a
        class="btn"
        href="<%= request.getContextPath() %>/driver/driver-login.jsp">

        🚗 Driver Login

    </a>

    <a
        class="btn"
        href="<%= request.getContextPath() %>/admin/admin-login.jsp">

        🛡️ Admin Login

    </a>

</div>

</body>

</html>