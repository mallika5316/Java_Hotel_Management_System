package servlet;

import dao.ReservationDAO;
import model.Reservation;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ReportServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reportType = request.getParameter("reportType");
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        String customerName = request.getParameter("customerName");

        ReservationDAO dao = new ReservationDAO();
        List<Reservation> result = new ArrayList<>();
        double totalRevenue = 0;
        //String reportType = request.getParameter("reportType");

        if (reportType == null || reportType.trim().isEmpty()) {
            request.setAttribute("error", "Please select a report type.");
            RequestDispatcher rd = request.getRequestDispatcher("reportform.jsp");
            rd.forward(request, response);
            return;
        }


        try {
            switch (reportType) {
                case "dateRange":
                    result = dao.getReservationsByDateRange(startDate, endDate);
                    break;
                case "revenue":
                    result = dao.getReservationsByDateRange(startDate, endDate);
                    for (Reservation r : result) {
                        totalRevenue += r.getTotalAmount();
                    }
                    request.setAttribute("totalRevenue", totalRevenue);
                    break;
                case "customer":
                    result = dao.getReservationsByCustomer(customerName);
                    break;
            }
            request.setAttribute("reservations", result);
            request.setAttribute("reportType", reportType);
            RequestDispatcher rd = request.getRequestDispatcher("reportresult.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
