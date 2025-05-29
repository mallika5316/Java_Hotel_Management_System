<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Reservation Report</title>
</head>
<body>
    <h2>Generate Reservation Report</h2>
    <form action="ReportServlet" method="post">
        Start Date: <input type="date" name="startDate" required><br><br>
        End Date: <input type="date" name="endDate" required><br><br>
        <input type="submit" value="Generate Report">
    </form>
    <br><br>
    <a href="DisplayReservationsServlet">Back to All Reservations</a>
</body>
</html>
