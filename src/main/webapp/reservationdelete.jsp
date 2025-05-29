<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Reservation</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #f3f9ff, #e0f2f1);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 400px;
        }

        h2 {
            color: #00796b;
            margin-bottom: 25px;
        }

        label {
            font-size: 16px;
            color: #444;
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"] {
            width: 90%;
            padding: 10px 12px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-bottom: 20px;
        }

        input[type="submit"] {
            background-color: #00796b;
            color: white;
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #004d40;
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            color: #00796b;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2><i class="fas fa-trash-alt"></i> Delete Reservation</h2>

    <form action="DeleteReservationServlet" method="post">
        <label for="reservationId">Reservation ID to delete:</label>
        <input type="text" name="reservationId" id="reservationId" required/>

        <input type="submit" value="Delete"/>
    </form>

    <a class="back-link" href="index.jsp"><i class="fas fa-arrow-left"></i> Back to Home</a>
</div>

</body>
</html>
