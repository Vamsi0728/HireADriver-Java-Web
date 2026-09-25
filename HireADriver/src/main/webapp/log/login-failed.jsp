<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String type = request.getParameter("type");

    String loginName = "Login";
    String loginPage = "customer/login.jsp";

    if ("admin".equalsIgnoreCase(type)) {

        loginName = "Admin Login";
        loginPage = "admin/admin-login.jsp";

    } else if ("driver".equalsIgnoreCase(type)) {

        loginName = "Driver Login";
        loginPage = "driver/driver-login.jsp";

    } else if ("customer".equalsIgnoreCase(type)) {

        loginName = "Customer Login";
        loginPage = "customer/login.jsp";
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title><%= loginName %> Failed - Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;

            background: linear-gradient(
                135deg,
                #0f172a,
                #1e3a8a,
                #2563eb
            );

            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 460px;
        }

        .card {
            background: white;
            border-radius: 24px;
            padding: 45px 35px;
            text-align: center;

            box-shadow:
                0 25px 60px rgba(0, 0, 0, 0.30);

            animation: showCard 0.4s ease;
        }

        @keyframes showCard {

            from {
                opacity: 0;
                transform: translateY(25px) scale(0.96);
            }

            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .error-icon {
            width: 90px;
            height: 90px;

            margin: 0 auto 25px;

            border-radius: 50%;

            background: #fee2e2;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 48px;

            color: #dc2626;

            border: 6px solid #fecaca;
        }

        .title {
            color: #0f172a;
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .subtitle {
            color: #64748b;
            font-size: 15px;
            line-height: 1.6;
            margin-bottom: 28px;
        }

        .error-box {
            background: #fff7ed;
            border: 1px solid #fed7aa;

            color: #9a3412;

            border-radius: 10px;

            padding: 14px;

            margin-bottom: 28px;

            font-size: 14px;

            line-height: 1.5;
        }

        .buttons {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .btn {
            width: 100%;

            padding: 14px;

            border-radius: 9px;

            text-decoration: none;

            font-size: 15px;

            font-weight: bold;

            transition: 0.2s;
        }

        .try-btn {
            background: #2563eb;
            color: white;
        }

        .try-btn:hover {
            background: #1d4ed8;
            transform: translateY(-1px);
        }

        .home-btn {
            background: #f1f5f9;
            color: #334155;
            border: 1px solid #e2e8f0;
        }

        .home-btn:hover {
            background: #e2e8f0;
        }

        .footer {
            margin-top: 25px;
            color: #94a3b8;
            font-size: 12px;
        }

        @media (max-width: 480px) {

            .card {
                padding: 35px 22px;
            }

            .title {
                font-size: 26px;
            }
        }

    </style>

</head>

<body>

<div class="container">

    <div class="card">

        <div class="error-icon">
            ✕
        </div>

        <h1 class="title">
            <%= loginName %> Failed
        </h1>

        <p class="subtitle">
            We couldn't sign you in.
            Please check your login details and try again.
        </p>

        <div class="error-box">

            🔒 <strong>Invalid login details</strong>

            <br>

            Please check your email, phone number,
            username or password and try again.

        </div>

        <div class="buttons">

            <a
                href="<%= request.getContextPath() %>/<%= loginPage %>"
                class="btn try-btn">

                ↻ Try Again

            </a>

            <a
                href="<%= request.getContextPath() %>/"
                class="btn home-btn">

                🏠 Back to Home

            </a>

        </div>

        <div class="footer">

            Hire A Driver • Secure Login

        </div>

    </div>

</div>

</body>

</html>