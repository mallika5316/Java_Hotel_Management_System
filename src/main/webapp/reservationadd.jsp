<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Reservation - Hotel Management System</title>
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
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            width: 90%;
            max-width: 600px;
        }

        h2 {
            font-size: 2rem;
            color: #222;
            margin-bottom: 25px;
            text-align: center;
        }

        label {
            display: block;
            margin: 12px 0 6px;
            font-weight: 600;
            color: #444;
        }

        input[type="text"],
        input[type="date"],
        input[type="number"] {
            width: 100%;
            padding: 12px;
            border-radius: 10px;
            border: 1px solid #ccc;
            font-size: 1rem;
            margin-bottom: 10px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: linear-gradient(to right, #182848, #4b6cb7);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        input[type="submit"]:hover {
            background: linear-gradient(to right, #1c2e52, #3e5fa5);
        }

        .links {
            margin-top: 25px;
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
        }

        .links a {
            background: #6c757d;
            color: white;
            padding: 10px 16px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 500;
            margin-top: 10px;
            transition: background-color 0.2s ease;
        }

        .links a:hover {
            background-color: #5a6268;
        }

        @media (max-width: 600px) {
            .card {
                padding: 25px;
            }

            .links {
                flex-direction: column;
                gap: 10px;
            }
        }
    </style>
</head>
<body>

<div class="card">
    <h2>Add Reservation</h2>
    <form action="AddReservationServlet" method="post">
        <label for="customerName">Customer Name:</label>
        <input type="text" name="customerName" id="customerName" required>

        <label for="roomNumber">Room Number:</label>
        <input type="text" name="roomNumber" id="roomNumber" required>

        <label for="checkIn">Check-In Date:</label>
        <input type="date" name="checkIn" id="checkIn" required>

        <label for="checkOut">Check-Out Date:</label>
        <input type="date" name="checkOut" id="checkOut" required>

        <label for="totalAmount">Total Amount:</label>
        <input type="number" name="totalAmount" id="totalAmount" step="0.01" required>

        <input type="submit" value="Book Reservation">
    </form>

    <div class="links">
        <a href="DisplayReservationsServlet"><i class="fas fa-list-ul"></i> View Reservations</a>
        <a href="index.jsp"><i class="fas fa-home"></i> Back to Home</a>
    </div>
</div>

</body>
</html>
