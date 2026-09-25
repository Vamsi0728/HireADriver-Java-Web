<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Customer Registration - Hire A Driver</title>

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
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-box {
            background: white;
            width: 450px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.12);
        }

        .logo {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 28px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #334155;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            margin-bottom: 18px;
            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #2563eb;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .login {
            text-align: center;
            margin-top: 20px;
            color: #64748b;
        }

        .login a {
            color: #2563eb;
            text-decoration: none;
            font-weight: bold;
        }

        .login a:hover {
            text-decoration: underline;
        }

    </style>

</head>

<body>

    <div class="register-box">

        <div class="logo">
            🚗 Hire A Driver
        </div>

        <div class="subtitle">
            Create Customer Account
        </div>

        <form action="<%= request.getContextPath() %>/customer/register"
              method="post">

            <label>Full Name</label>

            <input type="text"
                   name="fullName"
                   placeholder="Enter your full name"
                   required>


            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email"
                   required>


            <label>Phone Number</label>

            <input type="text"
                   name="phone"
                   placeholder="Enter your phone number"
                   required>


            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Create a password"
                   required>


            <button type="submit">
                Create Account
            </button>

        </form>

        <div class="login">

            Already have an account?

            <a href="<%= request.getContextPath() %>/customer/login.jsp">
                Login
            </a>

        </div>

    </div>

</body>

</html>