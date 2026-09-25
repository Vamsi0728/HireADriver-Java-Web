<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Trip Added Successfully</title>
</head>

<body>

    <h2>Trip Added Successfully!</h2>

    <p>The trip has been added successfully.</p>

    <br>

    <a href="<%= request.getContextPath() %>/trip/trip-register.jsp">
        Add Another Trip
    </a>

</body>

</html>