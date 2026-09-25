<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Driver Registration Successful</title>
</head>

<body>

    <h2>Driver Registration Successful!</h2>

    <p>The driver has been successfully registered.</p>

    <br>

    <a href="<%= request.getContextPath() %>/driver/driver-register.jsp">
        Register Another Driver
    </a>

</body>

</html>