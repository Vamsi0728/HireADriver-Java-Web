<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Driver Registration - Hire A Driver</title>

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
            width: 500px;
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

        input,
        select {
            width: 100%;
            padding: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
            margin-bottom: 18px;
            font-size: 15px;
        }

        input:focus,
        select:focus {
            outline: none;
            border-color: #16a34a;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #16a34a;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #15803d;
        }

        .login {
            text-align: center;
            margin-top: 20px;
            color: #64748b;
        }

        .login a {
            color: #16a34a;
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
            Driver Registration
        </div>

        <form action="<%= request.getContextPath() %>/driver/register"
              method="post">

            <label>Full Name</label>

            <input type="text"
                   name="fullName"
                   placeholder="Enter your full name"
                   required>


            <label>Phone Number</label>

            <input type="text"
                   name="phone"
                   placeholder="Enter your phone number"
                   required>


            <label>Email</label>

            <input type="email"
                   name="email"
                   placeholder="Enter your email">


            <label>License Number</label>

            <input type="text"
                   name="licenseNumber"
                   placeholder="Enter your driving license number"
                   required>


            <label>Vehicle Type</label>

            <select name="vehicleType" required>

                <option value="">
                    Select Vehicle Type
                </option>

                <option value="Sedan">
                    Sedan
                </option>

                <option value="SUV">
                    SUV
                </option>

                <option value="Hatchback">
                    Hatchback
                </option>

                <option value="Luxury">
                    Luxury
                </option>

            </select>


            <label>Vehicle Number</label>

            <input type="text"
                   name="vehicleNumber"
                   placeholder="Enter vehicle number"
                   required>


            <button type="submit">
                Register as Driver
            </button>

        </form>


        <div class="login">

            Already registered?

            <a href="<%= request.getContextPath() %>/driver/driver-login.jsp">
                Driver Login
            </a>

        </div>

    </div>

</body>

</html>