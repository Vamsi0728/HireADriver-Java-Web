<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String customerName =
        (String) session.getAttribute("customerName");

    if (customerName == null) {
        response.sendRedirect(
            request.getContextPath() + "/customer/login.jsp"
        );
        return;
    }
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Book a Vehicle - Vizag</title>

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

.back {
    background: #2864e8;
    color: white;
    text-decoration: none;
    padding: 12px 22px;
    border-radius: 8px;
}

.back:hover {
    background: #174fc5;
}

.container {
    max-width: 1000px;
    margin: 45px auto;
    padding: 20px;
}

.title {
    background: white;
    padding: 35px;
    border-radius: 18px;
    text-align: center;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
    margin-bottom: 30px;
}

.title h1 {
    font-size: 38px;
    margin-bottom: 10px;
}

.title p {
    color: #60708a;
    font-size: 18px;
}

.card {
    background: white;
    padding: 35px;
    border-radius: 18px;
    box-shadow: 0 5px 20px rgba(0,0,0,0.08);
}

.section-title {
    font-size: 23px;
    margin-bottom: 20px;
}

.vehicle-options {
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    gap: 15px;
    margin-bottom: 35px;
}

.vehicle-option {
    border: 2px solid #d8dee8;
    border-radius: 12px;
    padding: 20px 10px;
    text-align: center;
    cursor: pointer;
    transition: 0.2s;
}

.vehicle-option:hover {
    border-color: #19a463;
    background: #f3fff8;
}

.vehicle-option input {
    margin-bottom: 8px;
}

.vehicle-icon {
    font-size: 45px;
    margin-bottom: 8px;
}

.vehicle-name {
    font-size: 17px;
    font-weight: bold;
}

.form-group {
    margin-bottom: 22px;
}

.form-group label {
    display: block;
    font-size: 17px;
    font-weight: bold;
    margin-bottom: 8px;
}

.form-group select,
.form-group input {
    width: 100%;
    padding: 14px;
    border: 1px solid #ccd3dd;
    border-radius: 8px;
    font-size: 16px;
    background: white;
}

.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 20px;
}

.fare-box {
    background: #eef9f3;
    padding: 25px;
    border-radius: 12px;
    text-align: center;
    margin-top: 25px;
}

.fare-label {
    color: #60708a;
}

.fare {
    font-size: 36px;
    font-weight: bold;
    color: #19a463;
    margin-top: 8px;
}

.calculate {
    width: 100%;
    padding: 15px;
    background: #2864e8;
    color: white;
    border: none;
    border-radius: 9px;
    font-size: 18px;
    font-weight: bold;
    cursor: pointer;
}

.calculate:hover {
    background: #174fc5;
}

.continue {
    width: 100%;
    padding: 16px;
    margin-top: 15px;
    background: #19a463;
    color: white;
    border: none;
    border-radius: 9px;
    font-size: 19px;
    font-weight: bold;
    cursor: pointer;
}

.continue:hover {
    background: #12844e;
}

@media(max-width: 900px) {

    .vehicle-options {
        grid-template-columns: repeat(3, 1fr);
    }
}

@media(max-width: 600px) {

    .vehicle-options {
        grid-template-columns: repeat(2, 1fr);
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .header {
        padding: 20px;
    }

    .logo {
        font-size: 25px;
    }
}

</style>


<script>

/* VEHICLE SELECTION */

function setVehicle(vehicle) {

    document.getElementById("selectedVehicle").value =
        vehicle;
}


/* CALCULATE FARE */

function calculateFare() {

    let vehicle =
        document.querySelector(
            'input[name="vehicleType"]:checked'
        );

    if (!vehicle) {

        alert("Please select your vehicle.");

        return;
    }

    let fare = 0;

    if (vehicle.value === "Auto") {

        fare = 200;

    } else if (vehicle.value === "Bike") {

        fare = 150;

    } else if (vehicle.value === "Car") {

        fare = 400;

    } else if (vehicle.value === "Taxi") {

        fare = 500;

    } else if (vehicle.value === "Bus") {

        fare = 1000;
    }


    document.getElementById("fare").innerHTML =
        "₹" + fare.toFixed(2);


    document.getElementById("fareValue").value =
        fare;


    document.getElementById("calculated").value =
        "yes";
}


/* VALIDATE */

function validateBooking() {

    let vehicle =
        document.querySelector(
            'input[name="vehicleType"]:checked'
        );

    if (!vehicle) {

        alert("Please select your vehicle.");

        return false;
    }


    let pickup =
        document.getElementById(
            "pickupLocation"
        ).value;


    let drop =
        document.getElementById(
            "dropLocation"
        ).value;


    if (pickup === "") {

        alert("Please select pickup point.");

        return false;
    }


    if (drop === "") {

        alert("Please select drop point.");

        return false;
    }


    if (pickup === drop) {

        alert(
            "Pickup and drop point cannot be the same."
        );

        return false;
    }


    let calculated =
        document.getElementById(
            "calculated"
        ).value;


    if (calculated !== "yes") {

        alert(
            "Please calculate the vehicle fare first."
        );

        return false;
    }


    document.getElementById("selectedVehicle").value =
        vehicle.value;


    return true;
}

</script>

</head>


<body>


<div class="header">

    <div class="logo">

        🚕 Book a Vehicle

    </div>

    <a class="back"
       href="<%= request.getContextPath() %>/customer/dashboard.jsp">

        ← Dashboard

    </a>

</div>


<div class="container">


<div class="title">

    <h1>

        Book a Vehicle

    </h1>

    <p>

        Select your vehicle and journey details
        in Visakhapatnam.

    </p>

</div>


<div class="card">


<form
    action="<%= request.getContextPath() %>/vehicle/book"
    method="post"
    onsubmit="return validateBooking();">


    <!-- VEHICLES -->

    <h2 class="section-title">

        🚘 Select Your Vehicle

    </h2>


    <div class="vehicle-options">


        <label class="vehicle-option">

            <input
                type="radio"
                name="vehicleType"
                value="Auto"
                onclick="setVehicle(this.value)">

            <div class="vehicle-icon">
                🛺
            </div>

            <div class="vehicle-name">
                Auto
            </div>

        </label>


        <label class="vehicle-option">

            <input
                type="radio"
                name="vehicleType"
                value="Bike"
                onclick="setVehicle(this.value)">

            <div class="vehicle-icon">
                🏍️
            </div>

            <div class="vehicle-name">
                Bike
            </div>

        </label>


        <label class="vehicle-option">

            <input
                type="radio"
                name="vehicleType"
                value="Car"
                onclick="setVehicle(this.value)">

            <div class="vehicle-icon">
                🚗
            </div>

            <div class="vehicle-name">
                Car
            </div>

        </label>


        <label class="vehicle-option">

            <input
                type="radio"
                name="vehicleType"
                value="Taxi"
                onclick="setVehicle(this.value)">

            <div class="vehicle-icon">
                🚕
            </div>

            <div class="vehicle-name">
                Taxi
            </div>

        </label>


        <label class="vehicle-option">

            <input
                type="radio"
                name="vehicleType"
                value="Bus"
                onclick="setVehicle(this.value)">

            <div class="vehicle-icon">
                🚌
            </div>

            <div class="vehicle-name">
                Bus
            </div>

        </label>


    </div>


    <!-- HIDDEN VEHICLE -->

    <input
        type="hidden"
        id="selectedVehicle"
        name="vehicleType">


    <!-- JOURNEY -->

    <h2 class="section-title">

        📍 Journey Details

    </h2>


    <div class="form-grid">


        <div class="form-group">

            <label>
                📍 Pickup Point
            </label>

            <select
                id="pickupLocation"
                name="pickupLocation"
                required>

                <option value="">
                    -- Select Pickup Point --
                </option>

                <option>Dwaraka Nagar</option>
                <option>Maddilapalem</option>
                <option>MVP Colony</option>
                <option>Seethammadhara</option>
                <option>Gajuwaka</option>
                <option>NAD Junction</option>
                <option>Akkayyapalem</option>
                <option>Kancharapalem</option>
                <option>Kurmannapalem</option>
                <option>Madhurawada</option>
                <option>Rushikonda</option>
                <option>Bheemili</option>
                <option>Kommadi</option>
                <option>Pendurthi</option>
                <option>Sujatha Nagar</option>
                <option>Gopalapatnam</option>
                <option>RTC Complex</option>
                <option>Visakhapatnam Railway Station</option>
                <option>Jagadamba Junction</option>
                <option>Siripuram</option>
                <option>Asilmetta</option>
                <option>Lawsons Bay Colony</option>
                <option>Ram Nagar</option>
                <option>Beach Road</option>
                <option>Visalakshi Nagar</option>
                <option>Yendada</option>
                <option>Hanumanthawaka</option>
                <option>Arilova</option>
                <option>Anandapuram</option>

            </select>

        </div>


        <div class="form-group">

            <label>
                📍 Drop Point
            </label>

            <select
                id="dropLocation"
                name="dropLocation"
                required>

                <option value="">
                    -- Select Drop Point --
                </option>

                <option>Dwaraka Nagar</option>
                <option>Maddilapalem</option>
                <option>MVP Colony</option>
                <option>Seethammadhara</option>
                <option>Gajuwaka</option>
                <option>NAD Junction</option>
                <option>Akkayyapalem</option>
                <option>Kancharapalem</option>
                <option>Kurmannapalem</option>
                <option>Madhurawada</option>
                <option>Rushikonda</option>
                <option>Bheemili</option>
                <option>Kommadi</option>
                <option>Pendurthi</option>
                <option>Sujatha Nagar</option>
                <option>Gopalapatnam</option>
                <option>RTC Complex</option>
                <option>Visakhapatnam Railway Station</option>
                <option>Jagadamba Junction</option>
                <option>Siripuram</option>
                <option>Asilmetta</option>
                <option>Lawsons Bay Colony</option>
                <option>Ram Nagar</option>
                <option>Beach Road</option>
                <option>Visalakshi Nagar</option>
                <option>Yendada</option>
                <option>Hanumanthawaka</option>
                <option>Arilova</option>
                <option>Anandapuram</option>

            </select>

        </div>

    </div>


    <!-- DATE TIME -->

    <div class="form-grid">


        <div class="form-group">

            <label>
                📅 Date
            </label>

            <input
                type="date"
                name="tripDate"
                required>

        </div>


        <div class="form-group">

            <label>
                🕐 Time
            </label>

            <input
                type="time"
                name="tripTime"
                required>

        </div>


    </div>


    <!-- CALCULATE -->

    <button
        type="button"
        class="calculate"
        onclick="calculateFare()">

        💰 Calculate Vehicle Fare

    </button>


    <!-- FARE -->

    <div class="fare-box">

        <div class="fare-label">

            Estimated Vehicle Fare

        </div>

        <div
            class="fare"
            id="fare">

            ₹0.00

        </div>

    </div>


    <input
        type="hidden"
        id="fareValue"
        name="fare">


    <input
        type="hidden"
        id="calculated"
        name="calculated"
        value="no">


    <!-- CONTINUE -->

    <button
        type="submit"
        class="continue">

        🚕 Continue & Book Vehicle

    </button>


</form>

</div>

</div>

</body>

</html>