package dao;

import model.Reservation;
import java.sql.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReservationDAO {
    private Connection connect() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteldb", "root", "");
    }
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/hoteldb", "root", "");
    }


    // ✅ Insert reservation
    public void insertReservation(Reservation r) throws Exception {
        Connection con = connect();
        PreparedStatement ps = con.prepareStatement("INSERT INTO Reservations (CustomerName, RoomNumber, CheckIn, CheckOut, TotalAmount) VALUES (?, ?, ?, ?, ?)");
        ps.setString(1, r.getCustomerName());
        ps.setString(2, r.getRoomNumber());
        ps.setDate(3, new java.sql.Date(r.getCheckIn().getTime()));
        ps.setDate(4, new java.sql.Date(r.getCheckOut().getTime()));
        ps.setDouble(5, r.getTotalAmount());
        ps.executeUpdate();
        con.close();
    }

    // ✅ Update reservation
    public void updateReservation(Reservation r) throws Exception {
        Connection con = connect();
        PreparedStatement ps = con.prepareStatement("UPDATE Reservations SET CustomerName=?, RoomNumber=?, CheckIn=?, CheckOut=?, TotalAmount=? WHERE ReservationID=?");
        ps.setString(1, r.getCustomerName());
        ps.setString(2, r.getRoomNumber());
        ps.setDate(3, new java.sql.Date(r.getCheckIn().getTime()));
        ps.setDate(4, new java.sql.Date(r.getCheckOut().getTime()));
        ps.setDouble(5, r.getTotalAmount());
        ps.setInt(6, r.getReservationId());
        ps.executeUpdate();
        con.close();
    }

    // ✅ Delete reservation
    public void deleteReservation(int reservationId) throws Exception {
        Connection con = connect();
        PreparedStatement ps = con.prepareStatement("DELETE FROM Reservations WHERE ReservationID=?");
        ps.setInt(1, reservationId);
        ps.executeUpdate();
        con.close();
    }

    // ✅ Get all reservations
    public List<Reservation> getAllReservations() {
        List<Reservation> reservations = new ArrayList<>();
        try (Connection conn = connect();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM reservations");
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("reservationId"));
                r.setCustomerName(rs.getString("customerName"));
                r.setRoomNumber(rs.getString("roomNumber"));
                r.setCheckIn(rs.getDate("checkIn"));  // Must be java.sql.Date
                r.setCheckOut(rs.getDate("checkOut"));
                r.setTotalAmount(rs.getDouble("totalAmount"));

                reservations.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return reservations;
    }

    // ✅ Get reservations by date range
    public List<Reservation> getReservationsByDateRange(String startDate, String endDate) throws Exception {
        List<Reservation> list = new ArrayList<>();
        Connection conn = getConnection();
        String sql = "SELECT * FROM reservations WHERE checkIn >= ? AND checkOut <= ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, startDate);
        stmt.setString(2, endDate);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Reservation r = new Reservation();
            r.setReservationId(rs.getInt("reservationId"));
            r.setCustomerName(rs.getString("customerName"));
            r.setRoomNumber(rs.getString("roomNumber"));
            r.setCheckIn(rs.getDate("checkIn"));
            r.setCheckOut(rs.getDate("checkOut"));
            r.setTotalAmount(rs.getDouble("totalAmount"));
            list.add(r);
        }

        rs.close();
        stmt.close();
        conn.close();
        return list;
    }
    
    
    public List<Reservation> getReservationsByCustomer(String customerName) throws Exception {
        List<Reservation> reservations = new ArrayList<>();

        String sql = "SELECT * FROM reservations WHERE customerName LIKE ?";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, "%" + customerName + "%"); // Use LIKE for partial match
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setReservationId(rs.getInt("reservationId"));
                r.setCustomerName(rs.getString("customerName"));
                r.setRoomNumber(rs.getString("roomNumber"));
                r.setCheckIn(rs.getDate("checkIn"));
                r.setCheckOut(rs.getDate("checkOut"));
                r.setTotalAmount(rs.getDouble("totalAmount"));
                reservations.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("Error retrieving reservations by customer name", e);
        }

        return reservations;
    }


    public Reservation getReservationById(int id) throws Exception {
        Reservation r = null;
        Connection con = getConnection();
        String sql = "SELECT * FROM Reservations WHERE ReservationID = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            r = new Reservation();
            r.setReservationId(rs.getInt("ReservationID"));
            r.setCustomerName(rs.getString("CustomerName"));
            r.setRoomNumber(rs.getString("RoomNumber"));
            r.setCheckIn(rs.getDate("CheckIn"));
            r.setCheckOut(rs.getDate("CheckOut"));
            r.setTotalAmount(rs.getDouble("TotalAmount"));
        }

        rs.close();
        ps.close();
        con.close();

        return r;
    }

    
}
