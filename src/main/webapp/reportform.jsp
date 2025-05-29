<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e0f7fa, #b2ebf2);
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 40px;
        }
        h2 {
            color: #00796b;
            margin-bottom: 25px;
        }
        form {
            background-color: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            margin-bottom: 5px;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            margin-bottom: 15px;
        }
        input[type="radio"] {
            margin-right: 8px;
        }
        input[type="submit"] {
            background-color: #00796b;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #004d40;
        }
        .link-button {
            display: inline-block;
            text-decoration: none;
            background-color: #0288d1;
            color: white;
            padding: 10px 18px;
            border-radius: 6px;
            font-weight: bold;
            margin-top: 20px;
        }
        .link-button:hover {
            background-color: #01579b;
        }
    </style>

   <script>
        function toggleFields() {
            var reportType = document.querySelector('input[name="reportType"]:checked').value;
            document.getElementById("dateFields").style.display = 
                (reportType === "dateRange" || reportType === "customer" || reportType === "revenue") ? "block" : "none";
            document.getElementById("customerField").style.display = 
                (reportType === "customer") ? "block" : "none";
        }
        window.onload = () => {
            let radios = document.getElementsByName("reportType");
            radios.forEach(radio => radio.addEventListener("change", toggleFields));
            toggleFields(); // initialize visibility
        };
    </script>
</head>
<body>
<h2>Generate Report</h2>

<form action="ReportServlet" method="post">
    <label>Select Report Type:</label>
    <input type="radio" name="reportType" value="dateRange" required> Rooms Booked in a Date Range<br>
    <input type="radio" name="reportType" value="revenue"> Revenue Generated<br>
    <input type="radio" name="reportType" value="customer"> Reservations by Customer<br><br>

    <div id="dateFields">
        <label>Start Date:</label>
        <input type="date" name="startDate"><br>
        <label>End Date:</label>
        <input type="date" name="endDate"><br>
    </div>

    <div id="customerField">
        <label>Customer Name:</label>
        <input type="text" name="customerName"><br>
    </div>

    <input type="submit" value="Generate Report">
</form>

<a href="reservationdisplay.jsp" class="link-button">Back to Reservations</a>
<a href="index.jsp" class="link-button">Home</a>
</body>
</html>