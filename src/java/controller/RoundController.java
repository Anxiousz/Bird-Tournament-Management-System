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

/**
 *
 * @author thang
 */
@WebServlet(name = "RoundController", urlPatterns = {"/RoundController"})
public class RoundController extends HttpServlet {

    private final String ERROR = "error.jsp";
    private final String TOURNAMENT_DETAIL = "ManageTournamentDetailController";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String tournamentID = request.getParameter("tournamentID");
            String rname = request.getParameter("roundName");
            String rid = request.getParameter("roundID");
            String rstatus = request.getParameter("roundStatus");
            RoundDTO round = null;
                if (rstatus.equals("0")) {
                    RoundDAO dao = new RoundDAO();
                    round = dao.getRoundByID(Integer.parseInt(rid));
                    if (round == null) {
                        url = ERROR;
                    }
                    request.setAttribute("round", round);
                    url = TOURNAMENT_DETAIL;
                } else if (rstatus.equals("1")) {
                    RoundDAO dao = new RoundDAO();
                    CandidatesDAO cdao = new CandidatesDAO();
                    round = dao.getRoundByID(Integer.parseInt(rid));
                    if (round == null) {
                        url = ERROR;
                    } else {
                        List<CandidatesDTO> Rcands = cdao.getCandidatesByRID(1, Integer.parseInt(rid));
                        if (Rcands.isEmpty()) {
                            List<CandidatesDTO> Acands = cdao.getApprovedCandidates(1, Integer.parseInt(tournamentID));
                            for (CandidatesDTO candi : Acands) {
                                cdao.updateRoundCandidates(Integer.parseInt(rid), candi.getCandidatesID());
                                if (!rname.equals("Qualified")) {
                                    cdao.resetResultCandidates(Integer.parseInt(rid));
                                }
                            }
                            dao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                            Rcands = cdao.getCandidatesByRID(1, Integer.parseInt(rid));
                            round = dao.getRoundByID(Integer.parseInt(rid));
                        }
                        if (Rcands.isEmpty()) {
                            request.setAttribute("error", "there are not any bird in this round");
                        }
                        request.setAttribute("round", round);
                        request.setAttribute("cands", Rcands);
                        request.setAttribute(rname, dao);
                        url = TOURNAMENT_DETAIL;
                    }
                } else if (rstatus.equals("2")) {
                    RoundDAO dao = new RoundDAO();
                    CandidatesDAO cdao = new CandidatesDAO();
                    round = dao.getRoundByID(Integer.parseInt(rid));
                    if (round == null) {
                        url = ERROR;
                    } else {
                        List<CandidatesDTO> Fcands = cdao.getFinishCandidates(Integer.parseInt(rid));
                        if (Fcands.isEmpty()) {
                            if (round.getBirdPass() == 0) {
                                if (cdao.numberCAttend(Integer.parseInt(rid)) >= 40) {
                                    cdao.updateResultByTop(30, Integer.parseInt(rid), "pass");
                                    cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                    dao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                                } else if (cdao.numberCAttend(Integer.parseInt(rid)) >= 30) {
                                    cdao.updateResultByTop(20, Integer.parseInt(rid), "pass");
                                    cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                    dao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                                } else if (cdao.numberCAttend(Integer.parseInt(rid)) >= 20) {
                                    cdao.updateResultByTop(10, Integer.parseInt(rid), "pass");
                                    cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                    dao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                                } else if (cdao.numberCAttend(Integer.parseInt(rid)) >= 10) {
                                    cdao.updateResultByTop(4, Integer.parseInt(rid), "pass");
                                    cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                    dao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                                } else if (cdao.numberCAttend(Integer.parseInt(rid)) <= 4) {
                                    List<CandidatesDTO> top4 = cdao.getIDListByTop(cdao.numberCAttend(Integer.parseInt(rid)), Integer.parseInt(rid));
                                    for (int i = 1; i <= top4.size(); i++) {
                                        cdao.updateResultByID(Integer.toString(i), top4.get(i - 1).getCandidatesID());
                                    }
                                    dao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCAttend(Integer.parseInt(rid)), Integer.parseInt(rid));
                                }
                                Fcands = cdao.getFinishCandidates(Integer.parseInt(rid));
                                round = dao.getRoundByID(Integer.parseInt(rid));
                            }

                        }
                        if (Fcands.isEmpty()) {
                            request.setAttribute("error", "result have not set");
                        }
                        request.setAttribute("round", round);
                        request.setAttribute("cands", Fcands);
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
