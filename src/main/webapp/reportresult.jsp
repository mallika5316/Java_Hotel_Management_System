<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<%
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
    String reportType = (String) request.getAttribute("reportType");
    Double totalRevenue = (Double) request.getAttribute("totalRevenue");
    boolean showName = "customer".equals(reportType);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Report Result</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #e6ecff, #f8fbff);
            padding: 40px;
            text-align: center;
            margin: 0;
        }

        h2 {
            color: #2d3e50;
            font-size: 2.2rem;
        }

        table {
            width: 95%;
            margin: 30px auto;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 14px 18px;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3c8dbc;
            color: #fff;
            font-size: 1rem;
        }

        td {
            background-color: #fff;
        }

        tr:hover td {
            background-color: #f0f8ff;
        }

        h3 {
            margin-top: 30px;
            color: #215d91;
            font-size: 1.4rem;
        }

        p {
            font-size: 18px;
            color: #666;
            margin-top: 20px;
        }

        .button {
            background-color: #3c8dbc;
            color: white;
            padding: 12px 22px;
            margin-top: 30px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #326fa6;
        }

        @media screen and (max-width: 768px) {
            table, th, td {
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<h2>Report Result</h2>

<% if (reservations != null && !reservations.isEmpty()) { %>
    <table>
        <tr>
            <th>ID</th>
            <% if (showName) { %>
                <th>Customer Name</th>
            <% } %>
            <th>Room Number</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Total Amount</th>
        </tr>
        <% for (Reservation r : reservations) { %>
            <tr>
                <td><%= r.getReservationId() %></td>
                <% if (showName) { %>
                    <td><%= r.getCustomerName() %></td>
                <% } %>
                <td><%= r.getRoomNumber() %></td>
                <td><%= r.getCheckIn() %></td>
                <td><%= r.getCheckOut() %></td>
                <td>₹<%= String.format("%,.2f", r.getTotalAmount()) %></td>
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>No records found.</p>
<% } %>

<% if ("revenue".equals(reportType) && totalRevenue != null) { %>
    <h3>Total Revenue: ₹<%= String.format("%,.2f", totalRevenue) %></h3>
<% } %>

<a href="reportform.jsp" class="button"><i class="fas fa-arrow-left"></i> Back to Report Form</a>

</body>
</html>
