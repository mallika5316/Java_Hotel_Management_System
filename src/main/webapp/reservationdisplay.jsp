<%@ page import="java.util.List" %>
<%@ page import="model.Reservation" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Reservations</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 60px 20px;
            color: #333;
        }

        .card {
            background: #f7faff;
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
            width: 100%;
            max-width: 1200px;
        }

        h2 {
            color: #222;
            font-size: 2.4rem;
            margin-bottom: 30px;
            text-align: center;
        }

        .reservation-table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 25px rgba(72, 100, 172, 0.2);
        }

        th, td {
            padding: 16px 20px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #4b6cb7;
            color: #fff;
            font-size: 1rem;
        }

        td {
            background-color: #fff;
        }

        tr:hover td {
            background-color: #f0f8ff;
        }

        .actions a {
            color: #4b6cb7;
            margin: 0 8px;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.2s ease;
        }

        .actions a:hover {
            color: #182848;
        }

        .actions i {
            margin-right: 6px;
        }

        .button {
            background: linear-gradient(to right, #182848, #4b6cb7);
            color: white;
            padding: 14px 28px;
            margin-top: 40px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: bold;
            display: inline-block;
            transition: background-color 0.3s ease;
            box-shadow: 0 10px 20px rgba(72, 100, 172, 0.3);
        }

        .button:hover {
            background: linear-gradient(to right, #0f1f3e, #3d5ec9);
        }

        .toast {
            position: fixed;
            top: 20px;
            right: 20px;
            background: #2ecc71;
            color: #fff;
            padding: 14px 22px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            display: none;
            z-index: 1000;
        }

        @media screen and (max-width: 768px) {
            .reservation-table, th, td {
                font-size: 0.9rem;
            }

            .card {
                padding: 30px 20px;
            }

            .button {
                width: 100%;
                text-align: center;
            }
        }
    </style>

    <script>
        window.onload = function () {
            const urlParams = new URLSearchParams(window.location.search);
            const message = urlParams.get("message");
            if (message) {
                const toast = document.getElementById("toast");
                toast.innerText = decodeURIComponent(message);
                toast.style.display = "block";
                setTimeout(() => toast.style.display = "none", 3000);
                const url = window.location.href.split("?")[0];
                window.history.replaceState(null, null, url);
            }
        };
    </script>
</head>
<body>
<div class="card">
    <h2>All Reservations</h2>

    <table class="reservation-table">
        <tr>
            <th>ID</th>
            <th>Customer Name</th>
            <th>Room Number</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Total Amount</th>
            <th>Actions</th>
        </tr>
        <%
            if (reservations != null) {
                for (Reservation r : reservations) {
        %>
        <tr>
            <td><%= r.getReservationId() %></td>
            <td><%= r.getCustomerName() %></td>
            <td><%= r.getRoomNumber() %></td>
            <td><%= r.getCheckIn() %></td>
            <td><%= r.getCheckOut() %></td>
            <td>₹<%= r.getTotalAmount() %></td>
            <td class="actions">
                <a href="ReportCriteriaServlet?id=<%= r.getReservationId() %>">
                    <i class="fas fa-pen-to-square"></i> Update
                </a>
                <a href="DeleteReservationServlet?id=<%= r.getReservationId() %>"
                   onclick="return confirm('Are you sure you want to delete this reservation?')">
                    <i class="fas fa-trash"></i> Delete
                </a>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <a href="index.jsp" class="button"><i class="fas fa-home"></i> Home</a>
</div>

<div class="toast" id="toast"></div>
</body>
</html>
