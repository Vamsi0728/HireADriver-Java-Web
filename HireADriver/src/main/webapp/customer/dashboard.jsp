<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String customerName =
        (String) session.getAttribute("customerName");

    if (customerName == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/customer/login.jsp"
        );

        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Customer Dashboard - Hire A Driver</title>

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


/* HEADER */

.header {
    background: #1d2a3f;
    color: white;

    padding: 25px 60px;

    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo {
    font-size: 32px;
    font-weight: bold;
}

.header-buttons {
    display: flex;
    gap: 12px;
    align-items: center;
}

.profile-top {
    background: #2864e8;
    color: white;

    text-decoration: none;

    padding: 12px 20px;

    border-radius: 8px;

    font-weight: bold;
}

.logout {
    background: #e3262e;
    color: white;

    text-decoration: none;

    padding: 12px 20px;

    border-radius: 8px;

    font-weight: bold;
}

.profile-top:hover {
    background: #174fc5;
}

.logout:hover {
    background: #c51d25;
}


/* MAIN */

.container {
    max-width: 1200px;

    margin: 60px auto;

    padding: 0 30px;
}


/* WELCOME */

.welcome {
    background: white;

    padding: 35px;

    border-radius: 18px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.08);

    text-align: center;

    margin-bottom: 40px;
}

.welcome h1 {
    font-size: 40px;

    margin-bottom: 10px;
}

.welcome p {
    font-size: 19px;

    color: #60708a;
}


/* SERVICES */

.services {
    display: grid;

    grid-template-columns:
        repeat(2, 1fr);

    gap: 30px;
}


/* CARD */

.card {
    background: white;

    min-height: 330px;

    padding: 40px 30px;

    border-radius: 18px;

    box-shadow:
        0 5px 20px rgba(0,0,0,0.08);

    text-align: center;

    transition: 0.3s;
}

.card:hover {
    transform: translateY(-5px);

    box-shadow:
        0 10px 30px rgba(0,0,0,0.12);
}


/* ICON */

.icon {
    font-size: 65px;

    margin-bottom: 15px;
}


/* TITLE */

.card h2 {
    font-size: 28px;

    margin-bottom: 15px;
}


/* DESCRIPTION */

.card p {
    font-size: 17px;

    line-height: 1.6;

    color: #60708a;

    margin-bottom: 25px;
}


/* BUTTON */

.btn {
    display: inline-block;

    padding: 14px 30px;

    color: white;

    text-decoration: none;

    border-radius: 9px;

    font-size: 17px;

    font-weight: bold;
}


/* HIRE DRIVER */

.driver-btn {
    background: #2864e8;
}

.driver-btn:hover {
    background: #174fc5;
}


/* BOOK VEHICLE */

.vehicle-btn {
    background: #19a463;
}

.vehicle-btn:hover {
    background: #12844e;
}


/* MY BOOKINGS */

.booking-btn {
    background: #f39c12;
}

.booking-btn:hover {
    background: #d68910;
}


/* PROFILE */

.profile-btn {
    background: #8e44ad;
}

.profile-btn:hover {
    background: #71368a;
}


/* MOBILE */

@media (max-width: 750px) {

    .services {
        grid-template-columns: 1fr;
    }

    .header {
        padding: 20px;
    }

    .logo {
        font-size: 24px;
    }

    .header-buttons {
        gap: 6px;
    }

    .profile-top,
    .logout {
        padding: 9px 12px;

        font-size: 13px;
    }

    .container {
        margin: 40px auto;
    }

    .welcome h1 {
        font-size: 30px;
    }

}

</style>

</head>


<body>


<!-- HEADER -->

<div class="header">


    <div class="logo">

        🚘 Hire A Driver

    </div>


    <div class="header-buttons">


        <!-- PROFILE -->

        <a
            class="profile-top"
            href="<%= request.getContextPath() %>/customer/profile">

            👤 Profile

        </a>


        <!-- LOGOUT -->

        <a
            class="logout"
            href="<%= request.getContextPath() %>/customer/logout">

            Logout

        </a>


    </div>

</div>



<!-- MAIN -->

<div class="container">


    <!-- WELCOME -->

    <div class="welcome">

        <h1>

            Welcome, <%= customerName %>! 👋

        </h1>

        <p>

            What service would you like today?

        </p>

    </div>



    <!-- SERVICES -->

    <div class="services">


        <!-- HIRE DRIVER -->

        <div class="card">


            <div class="icon">

                🚗

            </div>


            <h2>

                Hire a Driver

            </h2>


            <p>

                Have your own car?

                Hire a professional driver

                to drive your vehicle.

            </p>


            <a
                class="btn driver-btn"
                href="<%= request.getContextPath() %>/driver-booking/book.jsp">

                🚗 Hire a Driver

            </a>


        </div>



        <!-- BOOK VEHICLE -->

        <div class="card">


            <div class="icon">

                🚕

            </div>


            <h2>

                Book a Vehicle

            </h2>


            <p>

                Need a vehicle?

                Book a cab, auto or taxi

                with a professional driver.

            </p>


            <a
                class="btn vehicle-btn"
                href="<%= request.getContextPath() %>/vehicle/book.jsp">

                🚕 Book a Vehicle

            </a>


        </div>



        <!-- MY BOOKINGS -->

        <div class="card">


            <div class="icon">

                📋

            </div>


            <h2>

                My Bookings

            </h2>


            <p>

                View your previous and

                current bookings, trip details

                and booking status.

            </p>


            <a
                class="btn booking-btn"
                href="<%= request.getContextPath() %>/booking/my-bookings">

                📋 My Bookings

            </a>


        </div>



        <!-- MY PROFILE -->

        <div class="card">


            <div class="icon">

                👤

            </div>


            <h2>

                My Profile

            </h2>


            <p>

                View your personal details,

                phone number, email and

                customer information.

            </p>


            <a
                class="btn profile-btn"
                href="<%= request.getContextPath() %>/customer/profile">

                👤 My Profile

            </a>


        </div>


    </div>

</div>


</body>

</html>