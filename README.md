# 🏨 Hotel Management System

**Subject Name**: Advanced Java  
**Subject Code**: BCS613D  
**Name**: Mallika K 
**USN**: 4AL22CS083  
**Semester/Section**: VI / B  

A comprehensive web-based Hotel Management System for managing hotel room reservations, customers, and revenue reports. Built using **JSP**, **Servlets**, and **MySQL**, the application follows **MVC architecture** and supports essential CRUD operations, reporting, and data filtering.

---

## 🚀 Features

- **CRUD Operations**: Add, Update, Delete, and Display Reservations  
- **Reports Module**:  
  - Rooms booked in a date range  
  - Total Revenue for a selected date range  
  - Customer-wise reservations within a date range  
- **Validation**:  
  - Form input validation for dates and required fields  
- **Responsive UI**: Clean and user-friendly interface  
- **MVC Pattern**: JSP + Servlet + JDBC architecture  
- **MySQL Integration**: Structured and scalable schema  

---

## 📋 Prerequisites

Ensure the following tools are installed:

- JDK 8 or later  
- Apache Tomcat 9+  
- MySQL or XAMPP Server  
- MySQL Connector/J (JDBC Driver)  
- Eclipse (or any Java IDE)  
- Modern Web Browser (Chrome / Edge / Firefox)  

---

## 🗂️ Project Structure

HotelManagementSystem/
├── src/
│ ├── model/
│ │ └── Reservation.java
│ ├── dao/
│ │ └── ReservationDAO.java
│ └── servlet/
│ ├── AddReservationServlet.java
│ ├── UpdateReservationServlet.java
│ ├── DeleteReservationServlet.java
│ ├── DisplayReservationsServlet.java
│ └── ReportServlet.java
├── WebContent/
│ ├── addreservation.jsp
│ ├── updatereservation.jsp
│ ├── deletereservation.jsp
│ ├── reservationdisplay.jsp
│ ├── reportform.jsp
│ └── reportresult.jsp
├── WEB-INF/
│ └── web.xml
└── README.md


---

## 🗄️ Database Setup

### 1. Create the Database


CREATE DATABASE IF NOT EXISTS hotel_management;
USE hotel_management;


2. Create the Table

CREATE TABLE IF NOT EXISTS Reservations (
    reservationId INT PRIMARY KEY AUTO_INCREMENT,
    customerName VARCHAR(100) NOT NULL,
    roomNumber INT NOT NULL,
    checkIn DATE NOT NULL,
    checkOut DATE NOT NULL,
    totalAmount DOUBLE NOT NULL
);



3. Insert Sample Data

INSERT INTO Reservations (customerName, roomNumber, checkIn, checkOut, totalAmount) VALUES
('Mansi Gowda', 101, '2025-05-10', '2025-05-12', 2500.00),
('Samay Shetty', 102, '2025-05-15', '2025-05-18', 4000.00),
('Shravya Nair', 103, '2025-05-11', '2025-05-13', 3200.00);


⚙️ Setup & Deployment


Step 1: Configure the Project
Open Eclipse

Create a Dynamic Web Project

Copy your project structure into the workspace



Step 2: Add JDBC Driver
Download MySQL Connector/J
Add .jar to WEB-INF/lib
Right-click → Build Path → Add to Build Path



Step 3: Update Database Credentials
In ReservationDAO.java, modify the connection string:
Connection conn = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/hotel_management", 
    "root", 
    ""
);



Step 4: Run on Tomcat
Right-click project → Run on Server

Select Tomcat 9+

Make sure MySQL is running

Step 5: Access the App
Open browser and go to:
http://localhost:8080/HotelManagementSystem/



💡 Usage
✅ Add Reservation
Visit addreservation.jsp

Fill details and submit

✅ Update Reservation
Go to updatereservation.jsp

Enter ID, update values, and submit

✅ Delete Reservation
Visit deletereservation.jsp

Enter ID and click Delete

✅ View Reservations
Open reservationdisplay.jsp

All records will be listed

✅ Generate Reports
Navigate to reportform.jsp

Choose report type:

Date Range (Rooms Booked)

Customer-wise Reservation

Revenue Report




🎓 Learning Outcomes
✨ Practical experience with JSP, Servlets, JDBC

🧱 Implemented real-world MVC structure

📊 Built reporting modules with filters

✅ Hands-on with form validation, SQL operations, and deployment
