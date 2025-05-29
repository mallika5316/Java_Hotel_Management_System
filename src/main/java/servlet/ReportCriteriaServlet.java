package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class ReportCriteriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                ReservationDAO dao = new ReservationDAO();
                Reservation reservation = dao.getReservationById(id);
                
                if (reservation != null) {
                    request.setAttribute("reservation", reservation);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("updatereservation.jsp");
                    dispatcher.forward(request, response);
                    return;
                }
            }
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Reservation not found");
        } catch (Exception e) {
            throw new ServletException("Error retrieving reservation", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        String fromDate = request.getParameter("fromDate");
        String toDate = request.getParameter("toDate");

        request.setAttribute("reportType", reportType);
        request.setAttribute("fromDate", fromDate);
        request.setAttribute("toDate", toDate);

        RequestDispatcher dispatcher = request.getRequestDispatcher("reportresult.jsp");
        dispatcher.forward(request, response);
    }
}
