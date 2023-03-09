/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import candidates.CandidatesDAO;
import candidates.CandidatesDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import round.RoundDAO;
import round.RoundDTO;

@WebServlet(name = "RoundController", urlPatterns = {"/RoundController"})
public class RoundController extends HttpServlet {

    private final String ERROR = "error.jsp";
    private final String TOURNAMENT_DETAIL = "TournamentDetailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String tournamentID = request.getParameter("ID");
            String rname = request.getParameter("roundName");
            String rid = request.getParameter("roundID");
            String rstatus = request.getParameter("roundStatus");
            RoundDTO round = null;
            if (rstatus.equals("0")) {
                RoundDAO rdao = new RoundDAO();
                round = rdao.getRoundByID(Integer.parseInt(rid));
                if (round == null) {
                    url = ERROR;
                }
                request.setAttribute("uround", round);
                url = TOURNAMENT_DETAIL;
            } else if (rstatus.equals("1")) {
                RoundDAO rdao = new RoundDAO();
                CandidatesDAO cdao = new CandidatesDAO();
                round = rdao.getRoundByID(Integer.parseInt(rid));
                if (round == null) {
                    url = ERROR;
                } else {
                    List<CandidatesDTO> Rcands = cdao.getCandidatesByRID(1, Integer.parseInt(rid));
                    if (Rcands.isEmpty()) {
                        request.setAttribute("error", "there is not any bird in this round");
                    }
                    request.setAttribute("uround", round);
                    request.setAttribute("ucands", Rcands);
                    url = TOURNAMENT_DETAIL;
                }
            } else if (rstatus.equals("2")) {
                RoundDAO rdao = new RoundDAO();
                CandidatesDAO cdao = new CandidatesDAO();
                round = rdao.getRoundByID(Integer.parseInt(rid));
                if (round == null) {
                    url = ERROR;
                } else {
                    List<CandidatesDTO> Fcands = cdao.getFinishCandidates(Integer.parseInt(rid));
                    if (Fcands.isEmpty()) {
                        request.setAttribute("error", "result have not set");
                    }
                    if (rdao.getNumberOfRound(Integer.parseInt(tournamentID)) == 1) {
                        request.setAttribute("uplstatus", "true");
                    } else if (rname.equals("Top4") && cdao.getNumberFailed(Integer.parseInt(rid)) > 0) {
                        request.setAttribute("uplstatus", "true");
                    }
                    if (round.getRoundName().equals("Top4") && round.getRoundStatus() == 2) {
                        request.setAttribute("ufinishTournament", "true");
                    } else {
                        request.setAttribute("ufinishTournament", "false");
                    }
                    request.setAttribute("uround", round);
                    request.setAttribute("ucands", Fcands);
                    url = TOURNAMENT_DETAIL;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
