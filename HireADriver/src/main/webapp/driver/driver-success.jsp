<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Registration Successful - Hire A Driver</title>

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
                #166534,
                #22c55e
            );

            padding: 20px;
        }

        .container {
            width: 100%;
            max-width: 500px;
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

        .success-icon {
            width: 95px;
            height: 95px;

            margin: 0 auto 25px;

            border-radius: 50%;

            background: #dcfce7;

            border: 6px solid #bbf7d0;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 48px;

            color: #16a34a;
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

        .success-box {
            background: #f0fdf4;

            border: 1px solid #bbf7d0;

            color: #166534;

            border-radius: 10px;

            padding: 16px;

            margin-bottom: 28px;

            font-size: 14px;

            line-height: 1.6;
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

        .login-btn {
            background: #2563eb;

            color: white;
        }

        .login-btn:hover {
            background: #1d4ed8;

            transform: translateY(-1px);
        }

        .register-btn {
            background: #f1f5f9;

            color: #334155;

            border: 1px solid #e2e8f0;
        }

        .register-btn:hover {
            background: #e2e8f0;
        }

        .home-btn {
            background: #f8fafc;

            color: #475569;

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

        <div class="success-icon">
            ✓
        </div>

        <h1 class="title">
            Registration Successful!
        </h1>

        <p class="subtitle">
            Welcome to Hire A Driver.
            Your driver account has been created successfully.
        </p>

        <div class="success-box">

            🚗 <strong>Driver account created</strong>

            <br>

            You can now log in and start managing
            your availability and bookings.

        </div>

        <div class="buttons">

            <a
                href="<%= request.getContextPath() %>/driver/driver-login.jsp"
                class="btn login-btn">

                🔐 Login as Driver

            </a>

            <a
                href="<%= request.getContextPath() %>/driver/driver-register.jsp"
                class="btn register-btn">

                + Register Another Driver

            </a>

            <a
                href="<%= request.getContextPath() %>/"
                class="btn home-btn">

                🏠 Back to Home

            </a>

        </div>

        <div class="footer">

            Hire A Driver • Driver Registration

        </div>

    </div>

</div>

</body>

</html>