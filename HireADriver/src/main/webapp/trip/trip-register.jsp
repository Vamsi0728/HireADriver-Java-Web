<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Add Trip - Hire A Driver</title>
</head>

<body>

    <h2>Add New Trip</h2>

    <form action="<%= request.getContextPath() %>/trip/register"
          method="post">

        <label>Pickup Location:</label><br>
        <input type="text" name="pickupLocation" required>
        <br><br>

        <label>Drop Location:</label><br>
        <input type="text" name="dropLocation" required>
        <br><br>

        <label>Trip Date:</label><br>
        <input type="date" name="tripDate" required>
        <br><br>

        <label>Trip Time:</label><br>
        <input type="time" name="tripTime" required>
        <br><br>

        <label>Amount:</label><br>
        <input type="number" name="amount"
               step="0.01" min="0" required>
        <br><br>

        <button type="submit">Add Trip</button>

    </form>

</body>

</html>