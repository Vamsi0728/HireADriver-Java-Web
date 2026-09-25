<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>Customers - Hire A Driver</title>

    <style>

        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f4f6f9;
        }

        .header {
            background: #1e293b;
            color: white;
            padding: 20px 40px;
        }

        .container {
            max-width: 1100px;
            margin: 35px auto;
            padding: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.08);
            overflow-x: auto;
        }

        h2 {
            color: #1e293b;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 750px;
        }

        th {
            background: #7c3aed;
            color: white;
            padding: 13px;
            text-align: left;
        }

        td {
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
        }

        tr:hover {
            background: #f8fafc;
        }

        .back-btn {
            display: inline-block;
            margin-top: 25px;
            background: #475569;
            color: white;
            padding: 10px 18px;
            text-decoration: none;
            border-radius: 6px;
        }

        .back-btn:hover {
            background: #334155;
        }

        .empty {
            text-align: center;
            padding: 30px;
            color: #64748b;
        }

    </style>

</head>

<body>

    <div class="header">

        <h2>🚗 Hire A Driver - Admin</h2>

    </div>


    <div class="container">

        <div class="card">

            <h2>Registered Customers</h2>

            <%
                ResultSet customers =
                    (ResultSet) request.getAttribute("customers");
            %>

            <table>

                <tr>

                    <th>Customer ID</th>
                    <th>Full Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Registration Date</th>

                </tr>

                <%

                    if (customers != null) {

                        boolean hasCustomers = false;

                        while (customers.next()) {

                            hasCustomers = true;

                %>

                <tr>

                    <td>
                        <%= customers.getInt("customer_id") %>
                    </td>

                    <td>
                        <%= customers.getString("full_name") %>
                    </td>

                    <td>
                        <%= customers.getString("email") %>
                    </td>

                    <td>
                        <%= customers.getString("phone") %>
                    </td>

                    <td>
                        <%= customers.getTimestamp("registration_time") %>
                    </td>

                </tr>

                <%

                        }

                        if (!hasCustomers) {

                %>

                <tr>

                    <td colspan="5" class="empty">
                        No customers registered yet.
                    </td>

                </tr>

                <%

                        }

                    }

                %>

            </table>


            <a class="back-btn"
               href="<%= request.getContextPath() %>/admin/admin-dashboard.jsp">
                ← Back to Dashboard
            </a>

        </div>

    </div>

</body>

</html>