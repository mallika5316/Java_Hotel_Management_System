package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.text.SimpleDateFormat;

public class AddReservationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Reservation r = new Reservation();
            r.setCustomerName(request.getParameter("customerName"));
            r.setRoomNumber(request.getParameter("roomNumber"));

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            r.setCheckIn(sdf.parse(request.getParameter("checkIn")));
            r.setCheckOut(sdf.parse(request.getParameter("checkOut")));
            r.setTotalAmount(Double.parseDouble(request.getParameter("totalAmount")));

            ReservationDAO dao = new ReservationDAO();
            dao.insertReservation(r);

            response.sendRedirect("DisplayReservationsServlet");

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
