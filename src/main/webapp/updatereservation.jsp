<%@ page import="model.Reservation" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    Reservation reservation = (Reservation) request.getAttribute("reservation");
    if (reservation == null) {
%>
    <p style="color:red;">No reservation found to update.</p>
    <a href="DisplayReservationsServlet">Back to list</a>
<%
        return;
    }
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Reservation</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #333;
        }

        .card {
            background: #f7faff;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 600px;
        }

        h2 {
            font-size: 2rem;
            color: #222;
            text-align: center;
            margin-bottom: 30px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: 600;
            margin-bottom: 8px;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"] {
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            font-size: 1rem;
        }

        input[type="submit"] {
            background: linear-gradient(to right, #182848, #4b6cb7);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 12px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        input[type="submit"]:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(72, 100, 172, 0.3);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4b6cb7;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="card">
    <h2><i class="fas fa-edit"></i> Update Reservation</h2>
    <form action="UpdateReservationServlet" method="post">
        <input type="hidden" name="reservationId" value="<%= reservation.getReservationId() %>" />

        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" id="customerName" value="<%= reservation.getCustomerName() %>" required />

        <label for="roomNumber">Room Number:</label>
        <input type="text" name="roomNumber" id="roomNumber" value="<%= reservation.getRoomNumber() %>" required />

        <label for="checkIn">Check-in Date:</label>
        <input type="date" name="checkIn" id="checkIn" value="<%= sdf.format(reservation.getCheckIn()) %>" required />

        <label for="checkOut">Check-out Date:</label>
        <input type="date" name="checkOut" id="checkOut" value="<%= sdf.format(reservation.getCheckOut()) %>" required />

        <label for="totalAmount">Total Amount:</label>
        <input type="number" step="0.01" name="totalAmount" id="totalAmount" value="<%= reservation.getTotalAmount() %>" required />

        <input type="submit" value="Update Reservation">
    </form>

    <a class="back-link" href="DisplayReservationsServlet"><i class="fas fa-arrow-left"></i> Back to Reservations</a>
</div>

</body>
</html>
