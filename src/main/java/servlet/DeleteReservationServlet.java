package servlet;

import dao.ReservationDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteReservationServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int reservationId = Integer.parseInt(request.getParameter("id"));

            ReservationDAO dao = new ReservationDAO();
            dao.deleteReservation(reservationId);

            // ✅ Redirect to DisplayReservationsServlet (not JSP directly)
            response.sendRedirect("DisplayReservationsServlet?message=Reservation+deleted+successfully");;

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

}
