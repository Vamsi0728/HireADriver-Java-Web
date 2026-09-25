<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Admin Login - Hire A Driver</title>

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

        .login-box {
            background: white;
            width: 400px;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.12);
        }

        .logo {
            text-align: center;
            font-size: 28px;
            font-weight: bold;
            color: #1e293b;
            margin-bottom: 10px;
        }

        .subtitle {
            text-align: center;
            color: #64748b;
            margin-bottom: 30px;
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
            margin-bottom: 20px;
            font-size: 15px;
        }

        input:focus {
            outline: none;
            border-color: #7c3aed;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #7c3aed;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #6d28d9;
        }

        .note {
            text-align: center;
            margin-top: 20px;
            color: #64748b;
            font-size: 13px;
        }

    </style>

</head>

<body>

    <div class="login-box">

        <div class="logo">
            🚗 Hire A Driver
        </div>

        <div class="subtitle">
            Administrator Login
        </div>

        <form action="<%= request.getContextPath() %>/admin/login"
              method="post">

            <label>Username</label>

            <input type="text"
                   name="username"
                   placeholder="Enter admin username"
                   required>


            <label>Password</label>

            <input type="password"
                   name="password"
                   placeholder="Enter admin password"
                   required>


            <button type="submit">
                Admin Login
            </button>

        </form>

        <div class="note">
            Authorized administrators only
        </div>

    </div>

</body>

</html>