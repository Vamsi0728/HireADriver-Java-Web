<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String driverName =
        (String) session.getAttribute("driverName");

    Integer driverId =
        (Integer) session.getAttribute("driverId");

    Boolean driverAvailable =
        (Boolean) session.getAttribute("driverAvailable");

    if (driverName == null || driverId == null) {

        response.sendRedirect(
            request.getContextPath()
            + "/driver/driver-login.jsp"
        );

        return;
    }

    if (driverAvailable == null) {
        driverAvailable = false;
    }
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Driver Dashboard - Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f6f9;
        }

        /* ================= HEADER ================= */

        .header {
            background: #1e293b;
            color: white;

            padding: 20px 40px;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header h2 {
            font-size: 22px;
        }

        .logout {
            color: white;
            text-decoration: none;

            background: #dc2626;

            padding: 10px 18px;

            border-radius: 6px;

            font-weight: bold;
        }

        .logout:hover {
            background: #b91c1c;
        }

        /* ================= CONTAINER ================= */

        .container {
            max-width: 1100px;

            margin: 40px auto;

            padding: 20px;
        }

        /* ================= WELCOME ================= */

        .welcome {
            background: white;

            padding: 30px;

            border-radius: 12px;

            margin-bottom: 25px;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.08);
        }

        .welcome h1 {
            color: #1e293b;

            margin-bottom: 10px;
        }

        .welcome p {
            color: #64748b;

            line-height: 1.5;
        }

        /* ================= AVAILABILITY ================= */

        .availability-card {
            background: white;

            padding: 30px;

            border-radius: 12px;

            margin-bottom: 30px;

            text-align: center;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.08);
        }

        .availability-card h2 {
            color: #1e293b;

            margin-bottom: 15px;
        }

        .current-status {
            display: inline-block;

            padding: 12px 25px;

            border-radius: 30px;

            font-size: 18px;

            font-weight: bold;

            margin-bottom: 20px;
        }

        .available-status {
            background: #dcfce7;

            color: #15803d;
        }

        .unavailable-status {
            background: #fee2e2;

            color: #b91c1c;
        }

        .availability-buttons {
            display: flex;

            justify-content: center;

            gap: 15px;

            flex-wrap: wrap;
        }

        .available-btn {
            border: none;

            background: #16a34a;

            color: white;

            padding: 12px 25px;

            border-radius: 7px;

            cursor: pointer;

            font-size: 16px;

            font-weight: bold;
        }

        .available-btn:hover {
            background: #15803d;
        }

        .unavailable-btn {
            border: none;

            background: #dc2626;

            color: white;

            padding: 12px 25px;

            border-radius: 7px;

            cursor: pointer;

            font-size: 16px;

            font-weight: bold;
        }

        .unavailable-btn:hover {
            background: #b91c1c;
        }

        /* ================= MENU ================= */

        .menu {
            display: grid;

            grid-template-columns: repeat(2, 1fr);

            gap: 20px;
        }

        .card {
            background: white;

            padding: 30px;

            border-radius: 12px;

            text-align: center;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.08);

            transition: 0.2s;
        }

        .card:hover {
            transform: translateY(-3px);

            box-shadow:
                0 8px 20px rgba(0,0,0,0.12);
        }

        .card h3 {
            color: #1e293b;

            margin-bottom: 12px;

            font-size: 21px;
        }

        .card p {
            color: #64748b;

            margin-bottom: 20px;

            line-height: 1.5;
        }

        /* ================= DRIVER TYPE ================= */

        .driver-type-card {
            border-top: 5px solid #2563eb;
        }

        .commercial-card {
            border-top: 5px solid #f59e0b;
        }

        .driver-icon {
            font-size: 45px;

            margin-bottom: 10px;
        }

        /* ================= VEHICLE LIST ================= */

        .vehicle-list {
            display: block;

            margin-top: 18px;

            padding: 15px;

            background: #f8fafc;

            border-radius: 10px;

            text-align: left;
        }

        .vehicle-list-title {
            font-weight: bold;

            color: #334155;

            margin-bottom: 10px;

            text-align: center;
        }

        /* ================= VEHICLE BUTTON ================= */

        .vehicle {
            display: inline-block;

            background: white;

            border: 1px solid #e2e8f0;

            border-radius: 8px;

            padding: 10px 14px;

            margin: 4px;

            color: #334155;

            font-size: 14px;

            cursor: pointer;

            transition: 0.2s;
        }

        .vehicle:hover {
            border-color: #2563eb;

            background: #eff6ff;

            color: #1d4ed8;

            transform: translateY(-2px);
        }

        .vehicle.selected {
            background: #2563eb;

            border-color: #2563eb;

            color: white;

            font-weight: bold;
        }

        /* ================= NORMAL BUTTON ================= */

        .btn {
            display: inline-block;

            text-decoration: none;

            background: #2563eb;

            color: white;

            padding: 10px 20px;

            border-radius: 6px;

            font-weight: bold;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        /* ================= MODAL ================= */

        .modal {
            display: none;

            position: fixed;

            z-index: 9999;

            left: 0;
            top: 0;

            width: 100%;
            height: 100%;

            background: rgba(15, 23, 42, 0.65);

            justify-content: center;

            align-items: center;

            padding: 20px;
        }

        .modal.show {
            display: flex;
        }

        .modal-box {
            width: 100%;

            max-width: 430px;

            background: white;

            border-radius: 18px;

            padding: 35px;

            text-align: center;

            box-shadow:
                0 25px 60px rgba(0,0,0,0.30);

            animation: modalShow 0.25s ease;
        }

        @keyframes modalShow {

            from {
                opacity: 0;

                transform: scale(0.90);
            }

            to {
                opacity: 1;

                transform: scale(1);
            }
        }

        .modal-icon {
            font-size: 55px;

            margin-bottom: 15px;
        }

        .modal-box h2 {
            color: #1e293b;

            margin-bottom: 10px;
        }

        .modal-box p {
            color: #64748b;

            margin-bottom: 25px;

            line-height: 1.5;
        }

        .modal-buttons {
            display: flex;

            gap: 12px;

            justify-content: center;

            flex-wrap: wrap;
        }

        .yes-btn,
        .no-btn {
            border: none;

            color: white;

            padding: 12px 18px;

            border-radius: 8px;

            cursor: pointer;

            font-weight: bold;

            font-size: 14px;
        }

        .yes-btn {
            background: #16a34a;
        }

        .yes-btn:hover {
            background: #15803d;
        }

        .no-btn {
            background: #dc2626;
        }

        .no-btn:hover {
            background: #b91c1c;
        }

        /* ================= MOBILE ================= */

        @media (max-width: 768px) {

            .menu {
                grid-template-columns: 1fr;
            }

            .header {
                padding: 20px;
            }

            .container {
                margin: 20px auto;

                padding: 15px;
            }

            .welcome {
                padding: 25px;
            }

            .availability-card {
                padding: 25px;
            }

        }

    </style>

</head>

<body>


<!-- ================= HEADER ================= -->

<div class="header">

    <h2>
        🚗 Hire A Driver
    </h2>

    <a
        class="logout"
        href="<%= request.getContextPath() %>/driver/logout">

        Logout

    </a>

</div>


<div class="container">


    <!-- ================= WELCOME ================= -->

    <div class="welcome">

        <h1>
            Welcome, <%= driverName %>!
        </h1>

        <p>
            Manage your driver services, assigned trips
            and driver profile.
        </p>

    </div>


    <!-- ================= AVAILABILITY ================= -->

    <div class="availability-card">

        <h2>
            🚦 Driver Availability
        </h2>


        <% if (driverAvailable) { %>

            <div class="current-status available-status">

                🟢 You are currently AVAILABLE

            </div>

        <% } else { %>

            <div class="current-status unavailable-status">

                🔴 You are currently UNAVAILABLE

            </div>

        <% } %>


        <div class="availability-buttons">


            <!-- SET AVAILABLE -->

            <form
                action="<%= request.getContextPath() %>/driver/toggle-availability"
                method="post">

                <input
                    type="hidden"
                    name="available"
                    value="true">

                <button
                    type="submit"
                    class="available-btn">

                    🟢 Set Available

                </button>

            </form>


            <!-- SET UNAVAILABLE -->

            <form
                action="<%= request.getContextPath() %>/driver/toggle-availability"
                method="post">

                <input
                    type="hidden"
                    name="available"
                    value="false">

                <button
                    type="submit"
                    class="unavailable-btn">

                    🔴 Set Unavailable

                </button>

            </form>

        </div>

    </div>


    <!-- ================= MENU ================= -->

    <div class="menu">


        <!-- ================= DESIGNATED DRIVER ================= -->

        <div class="card driver-type-card">

            <div class="driver-icon">
                👤
            </div>

            <h3>
                Designated Driver
            </h3>

            <p>
                Drive the customer's own vehicle
                as a designated driver.
            </p>


            <div class="vehicle-list">

                <div class="vehicle-list-title">
                    Select Vehicle
                </div>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Designated',
                        'Scooty'
                    )">

                    🛵 Scooty

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Designated',
                        'Bike'
                    )">

                    🏍️ Bike

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Designated',
                        'Car'
                    )">

                    🚗 Car

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Designated',
                        'Bus'
                    )">

                    🚌 Bus

                </button>

            </div>

        </div>


        <!-- ================= COMMERCIAL DRIVER ================= -->

        <div class="card commercial-card">

            <div class="driver-icon">
                🚕
            </div>

            <h3>
                Commercial Driver
            </h3>

            <p>
                Drive commercial vehicles and
                provide transportation services.
            </p>


            <div class="vehicle-list">

                <div class="vehicle-list-title">
                    Select Vehicle
                </div>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Commercial',
                        'Scooty'
                    )">

                    🛵 Scooty

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Commercial',
                        'Bike'
                    )">

                    🏍️ Bike

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Commercial',
                        'Auto'
                    )">

                    🛺 Auto

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Commercial',
                        'Car'
                    )">

                    🚗 Car

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Commercial',
                        'Taxi'
                    )">

                    🚕 Taxi

                </button>


                <button
                    type="button"
                    class="vehicle"
                    onclick="selectVehicle(
                        'Commercial',
                        'Bus'
                    )">

                    🚌 Bus

                </button>

            </div>

        </div>


        <!-- ================= MY ASSIGNED BOOKINGS ================= -->

        <div class="card">

            <h3>
                📋 My Assigned Bookings
            </h3>

            <p>
                View your assigned customer bookings
                and manage trips.
            </p>

            <a
                class="btn"
                href="<%= request.getContextPath() %>/driver/my-bookings">

                View Bookings

            </a>

        </div>


        <!-- ================= MY PROFILE ================= -->

        <div class="card">

            <h3>
                👤 My Profile
            </h3>

            <p>
                View your driver information and
                vehicle details.
            </p>

            <a
                class="btn"
                href="<%= request.getContextPath() %>/driver/profile">

                View Profile

            </a>

        </div>


    </div>

</div>


<!-- ================= VEHICLE AVAILABILITY MODAL ================= -->

<div
    id="vehicleModal"
    class="modal">


    <div class="modal-box">


        <div
            id="modalIcon"
            class="modal-icon">

            🚗

        </div>


        <h2 id="modalTitle">

            Vehicle Selected

        </h2>


        <p id="modalMessage">

            Are you available for this vehicle?

        </p>


        <form
            id="vehicleForm"
            action="<%= request.getContextPath() %>/driver/select-vehicle"
            method="post">


            <input
                type="hidden"
                id="selectedDriverType"
                name="driverType">


            <input
                type="hidden"
                id="selectedVehicle"
                name="vehicleType">


            <input
                type="hidden"
                id="selectedAvailable"
                name="available">


            <div class="modal-buttons">


                <button
                    type="button"
                    class="yes-btn"
                    onclick="confirmAvailability(true)">

                    🟢 Yes, I'm Available

                </button>


                <button
                    type="button"
                    class="no-btn"
                    onclick="confirmAvailability(false)">

                    🔴 No

                </button>


            </div>

        </form>

    </div>

</div>


<script>

/* ================= SELECT VEHICLE ================= */

function selectVehicle(driverType, vehicleType) {

    document.getElementById(
        "selectedDriverType"
    ).value = driverType;


    document.getElementById(
        "selectedVehicle"
    ).value = vehicleType;


    let icon = "🚗";


    if (vehicleType === "Scooty") {

        icon = "🛵";

    } else if (vehicleType === "Bike") {

        icon = "🏍️";

    } else if (vehicleType === "Auto") {

        icon = "🛺";

    } else if (vehicleType === "Taxi") {

        icon = "🚕";

    } else if (vehicleType === "Bus") {

        icon = "🚌";
    }


    document.getElementById(
        "modalIcon"
    ).innerHTML = icon;


    document.getElementById(
        "modalTitle"
    ).innerHTML =
        vehicleType + " Selected";


    document.getElementById(
        "modalMessage"
    ).innerHTML =
        "Are you available for "
        + vehicleType
        + " bookings?";


    document.getElementById(
        "vehicleModal"
    ).classList.add("show");
}


/* ================= CONFIRM AVAILABILITY ================= */

function confirmAvailability(isAvailable) {

    document.getElementById(
        "selectedAvailable"
    ).value =
        isAvailable ? "true" : "false";


    document.getElementById(
        "vehicleForm"
    ).submit();
}

</script>


</body>

</html>