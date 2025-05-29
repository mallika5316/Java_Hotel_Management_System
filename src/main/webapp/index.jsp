<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hotel Management System</title>
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
            padding: 60px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            text-align: center;
            width: 90%;
            max-width: 750px;
        }

        h1 {
            font-size: 2.8rem;
            color: #222;
            margin-bottom: 10px;
        }

        p {
            font-size: 1.1rem;
            color: #666;
            margin-bottom: 40px;
        }

        .btn-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .btn {
            background: #4b6cb7;
            background: linear-gradient(to right, #182848, #4b6cb7);
            color: white;
            padding: 20px 28px;
            border-radius: 15px;
            text-decoration: none;
            font-size: 1rem;
            font-weight: 600;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 180px;
            height: 140px;
            box-shadow: 0 10px 20px rgba(72, 100, 172, 0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn i {
            font-size: 2.2rem;
            margin-bottom: 12px;
        }

        .btn:hover {
            transform: translateY(-5px);
            box-shadow: 0 14px 25px rgba(72, 100, 172, 0.4);
        }

        @media (max-width: 600px) {
            .btn {
                width: 100%;
                height: auto;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h1>Hotel Management System</h1>
        <p>Effortless Reservation Handling, Clear Reports, Smooth Experience</p>
        <div class="btn-container">
            <a href="reservationadd.jsp" class="btn" title="Add Reservation">
                <i class="fas fa-calendar-plus"></i>
                Add Reservation
            </a>
            <a href="DisplayReservationsServlet" class="btn" title="View Reservations">
                <i class="fas fa-list-ul"></i>
                View Reservations
            </a>
            <a href="reportform.jsp" class="btn" title="Generate Report">
                <i class="fas fa-chart-pie"></i>
                Reports
            </a>
        </div>
    </div>
</body>
</html>
