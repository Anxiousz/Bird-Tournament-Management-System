package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LoadCandidatesController", urlPatterns = {"/LoadCandidatesController"})
public class LoadCandidatesController extends HttpServlet {

    private final String ERROR = "error.jsp";
    private final String TOUR = "candidateTournamnet.jsp";
    private final String TOURNAMENT_DETAIL = "ManageTournamentController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String url = ERROR;
            try {
                String action = request.getParameter("action");
                String tournamentID = request.getParameter("tournamentID");
                String rname = request.getParameter("roundName");
                String rid = request.getParameter("roundID");
                String rstatus = request.getParameter("roundStatus");
                if (action.equals("Participant")) {
//                    CandidatesDAO dao = new CandidatesDAO();
                    //  List<CandidatesDTO> cands = dao.getCandidates(-1, Integer.parseInt(tournamentID), -1);
//                    if (cands.size() > 0) {
//                        url = TOUR;
//                        request.setAttribute("cands", cands);
//                    } else {
//                        url = ERROR;
//                    }
                }
            } catch (Exception e) {
                log("Error at LoginController: " + e.toString());
            } finally {
                request.getRequestDispatcher(url).forward(request, response);
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
