<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

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
            background: linear-gradient(135deg, #eef4ff, #f4fff9);

            display: flex;
            justify-content: center;
            align-items: center;

            padding: 25px;
        }

        .success-card {
            width: 100%;
            max-width: 520px;

            background: white;

            padding: 45px 40px;

            border-radius: 22px;

            text-align: center;

            box-shadow:
                0 15px 45px rgba(0, 0, 0, 0.12);
        }

        .success-icon {
            width: 95px;
            height: 95px;

            margin: 0 auto 25px;

            background: #e8f8ef;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 55px;
        }

        h1 {
            color: #19a463;

            font-size: 32px;

            margin-bottom: 12px;
        }

        .subtitle {
            color: #64748b;

            font-size: 17px;

            line-height: 1.6;

            margin-bottom: 30px;
        }

        .message-box {
            background: #f8fafc;

            border: 1px solid #e2e8f0;

            border-radius: 12px;

            padding: 20px;

            margin-bottom: 30px;
        }

        .message-box p {
            color: #334155;

            font-size: 16px;

            line-height: 1.6;
        }

        .message-box strong {
            color: #1e293b;
        }

        .buttons {
            display: flex;

            flex-direction: column;

            gap: 12px;
        }

        .btn {
            display: block;

            text-decoration: none;

            padding: 14px;

            border-radius: 9px;

            font-size: 17px;

            font-weight: bold;

            transition: 0.2s;
        }

        .login-btn {
            background: #2864e8;

            color: white;
        }

        .login-btn:hover {
            background: #174fc5;
        }

        .register-btn {
            background: #eef2ff;

            color: #2864e8;
        }

        .register-btn:hover {
            background: #e0e7ff;
        }

        .brand {
            margin-top: 28px;

            color: #94a3b8;

            font-size: 14px;
        }

        @media (max-width: 500px) {

            .success-card {
                padding: 35px 25px;
            }

            h1 {
                font-size: 27px;
            }

            .success-icon {
                width: 80px;
                height: 80px;
                font-size: 45px;
            }

        }

    </style>

</head>


<body>


    <div class="success-card">


        <!-- SUCCESS ICON -->

        <div class="success-icon">

            ✅

        </div>


        <!-- TITLE -->

        <h1>

            Registration Successful!

        </h1>


        <p class="subtitle">

            Welcome to <strong>Hire A Driver</strong>!

            Your account has been created successfully.

        </p>


        <!-- MESSAGE -->

        <div class="message-box">

            <p>

                🎉 Your customer account is now ready.

                You can login and start booking a

                professional driver or vehicle.

            </p>

        </div>


        <!-- BUTTONS -->

        <div class="buttons">


            <a
                class="btn login-btn"
                href="login.jsp">

                🔐 Login to Your Account

            </a>


            <a
                class="btn register-btn"
                href="register.jsp">

                👤 Register Another Customer

            </a>


        </div>


        <div class="brand">

            🚗 Hire A Driver

        </div>


    </div>


</body>

</html>