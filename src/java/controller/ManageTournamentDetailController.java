/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import account.AccountDAO;
import account.AccountDTO;
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
import registrationform.RegistrationFormDAO;
import registrationform.RegistrationFormDTO;
import round.RoundDAO;
import round.RoundDTO;
import tournament.TournamentDAO;
import tournament.TournamentDTO;

/**
 *
 * @author thang
 */
@WebServlet(name = "ManageTournamentDetailController", urlPatterns = {"/ManageTournamentDetailController"})
public class ManageTournamentDetailController extends HttpServlet {

    private final String ERROR = "error.jsp";
    private final String SUCCESS = "LoadTournamentController";
    private final String TOURNAMENT_DETAIL = "manageTournamentDetail.jsp";
    

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
        TournamentDTO tour = null;
        String rid = request.getParameter("roundID");
        String rname = request.getParameter("roundName");
        String rstatus = request.getParameter("roundStatus");
        String tournamentID = request.getParameter("tournamentID");
        try {
            
            TournamentDAO tdao = new TournamentDAO();
            tour = tdao.getDetail(Integer.parseInt(tournamentID));
            if (tour != null) {
                RoundDAO roudao = new RoundDAO();
                request.setAttribute("tour", tour);
                RegistrationFormDAO rdao = new RegistrationFormDAO();
                int num = rdao.getNumberRegistered(1, Integer.parseInt(tournamentID));
                    if(num == 0){
                        num = rdao.getNumberRegistered(2, Integer.parseInt(tournamentID));
                    }
                    request.setAttribute("numberPlayer", num);
                if (tour.getTournamentStatus() == 0) {
                    url = TOURNAMENT_DETAIL;
                } else if (tour.getTournamentStatus() == 5) {
                    List<RoundDTO> rounds = roudao.getAllByTID(Integer.parseInt(tournamentID));
                    request.setAttribute("rounds", rounds);
                    url = TOURNAMENT_DETAIL;
                } else if (tour.getTournamentStatus() == 4) {
                    List<RoundDTO> rounds = roudao.getAllByTID(Integer.parseInt(tournamentID));
                    request.setAttribute("rounds", rounds);
                    url = TOURNAMENT_DETAIL;
                } else if (tour.getTournamentStatus() == 3) {
                    List<RoundDTO> rounds = roudao.getAllByTID(Integer.parseInt(tournamentID));
                    if (rounds.isEmpty()) {
                        RoundDTO roud = null;
                        int numberOfPlayer = rdao.getNumberRegistered(2, Integer.parseInt(tournamentID));
                        if (numberOfPlayer >= 40) {
                            String[] names = {"Qualified", "Top30", "Top20", "Top10", "Top4"};
                            for (String name : names) {
                                roud = new RoundDTO();
                                tour = new TournamentDTO();
                                tour.setTournamentID(Integer.parseInt(tournamentID));
                                roud.setTournament(tour);
                                roud.setRoundName(name);
                                roud.setRoundStatus(0);
                                roudao.insertRound(roud);
                            }
                        } else if (numberOfPlayer >= 30) {
                            String[] names = {"Qualified", "Top20", "Top10", "Top4"};
                            for (String name : names) {
                                roud = new RoundDTO();
                                tour = new TournamentDTO();
                                tour.setTournamentID(Integer.parseInt(tournamentID));
                                roud.setTournament(tour);
                                roud.setRoundName(name);
                                roud.setRoundStatus(0);
                                roudao.insertRound(roud);
                            }
                        } else if (numberOfPlayer >= 20) {
                            String[] names = {"Qualified", "Top10", "Top4"};
                            for (String name : names) {
                                roud = new RoundDTO();
                                tour = new TournamentDTO();
                                tour.setTournamentID(Integer.parseInt(tournamentID));
                                roud.setTournament(tour);
                                roud.setRoundName(name);
                                roud.setRoundStatus(0);
                                roudao.insertRound(roud);
                            }
                            
                        } else if (numberOfPlayer >= 10) {
                            String[] names = {"Qualified", "Top4"};
                            for (String name : names) {
                                roud = new RoundDTO();
                                tour = new TournamentDTO();
                                tour.setTournamentID(Integer.parseInt(tournamentID));
                                roud.setTournament(tour);
                                roud.setRoundName(name);
                                roud.setRoundStatus(0);
                                roudao.insertRound(roud);
                            }
                        } else {
                            url = TOURNAMENT_DETAIL;
                        }
                        rounds = roudao.getAllByTID(Integer.parseInt(tournamentID));
                        request.setAttribute("rounds", rounds);
                        url = TOURNAMENT_DETAIL;
                    } else {
                        request.setAttribute("rounds", rounds);
                        url = TOURNAMENT_DETAIL;
                    }
                }

            } else {
                url = ERROR;
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