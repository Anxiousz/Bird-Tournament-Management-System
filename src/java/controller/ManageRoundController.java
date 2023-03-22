/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import achievement.AchievementDAO;
import achievement.AchievementDTO;
import candidates.CandidatesDAO;
import candidates.CandidatesDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import round.RoundDAO;
import round.RoundDTO;

@WebServlet(name = "ManageRoundController", urlPatterns = {"/ManageRoundController"})
public class ManageRoundController extends HttpServlet {

    private final String ERROR = "error.jsp";
    private final String TOURNAMENT_DETAIL = "ManageTournamentDetailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int tournamentID = Integer.parseInt(request.getParameter("tournamentID"));
            String rname = request.getParameter("roundName");
            int rid = Integer.parseInt(request.getParameter("roundID"));
            String rstatus = request.getParameter("roundStatus");
            if(rstatus.equals("Coming soon")){
                rstatus = "0";
            }else if (rstatus.equals("On Going")){
                rstatus = "1";
            }else if (rstatus.equals("Finish")){
                rstatus = "2";
            }else{
            }
            RoundDTO round = null;
            if (rstatus.equals("0")) {
                RoundDAO rdao = new RoundDAO();
                round = rdao.getRoundByID(rid);
                if (round == null) {
                    url = ERROR;
                }
                    if(!rname.equals("Qualified")){
                        if(rdao.getPreviousRStatus(tournamentID, rid)==2){
                            request.setAttribute("prerfinish", "true");
                        }else{
                            request.setAttribute("prerfinish", "false");
                        }
                    }else{
                        request.setAttribute("prerfinish", "true");
                    }
                request.setAttribute("round", round);
                url = TOURNAMENT_DETAIL;
            } else if (rstatus.equals("1")) {
                RoundDAO rdao = new RoundDAO();
                CandidatesDAO cdao = new CandidatesDAO();
                round = rdao.getRoundByID(rid);
                if (round == null) {
                    url = ERROR;
                } else {
                    List<CandidatesDTO> Rcands = cdao.getCandidatesByRID(1,rid);
                    if (Rcands.isEmpty()) {
                            cdao.updateRoundCandidates(rid, tournamentID, 1);
                            if (!rname.equals("Qualified")) {
                                cdao.resetResultCandidates(rid, tournamentID, 1);
                            }
                        rdao.updateAttendPassCandidates(cdao.numberCAttend(rid), cdao.numberCPass(rid), rid);
                        Rcands = cdao.getCandidatesByRID(1,rid);
                        round = rdao.getRoundByID(rid);
                    }
                    if (Rcands.isEmpty()) {
                        request.setAttribute("error", "there is not any bird in this round");
                    }
                    if(cdao.getNumberScored(rid)<4){
                        request.setAttribute("emptyscored", "true");
                    }else{
                        request.setAttribute("emptyscored", "false");
                    }
                    request.setAttribute("round", round);
                    request.setAttribute("cands", Rcands);
                    request.setAttribute("nexton", "false");
                    url = TOURNAMENT_DETAIL;
                }
            } else if (rstatus.equals("2")) {
                RoundDAO rdao = new RoundDAO();
                CandidatesDAO cdao = new CandidatesDAO();
                round = rdao.getRoundByID(rid);
                if (round == null) {
                    url = ERROR;
                } else {
                    List<CandidatesDTO> Fcands = cdao.getFinishCandidates(rid);
                    if (Fcands.isEmpty()) {
                        if (round.getBirdPass() == 0) {
                            if (cdao.getNumberScored(rid) >= 35) {
                                cdao.updateResultByTop(30, rid, "pass");
                                cdao.updateFailedCandidates("fail", 2, rid);
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(rid), cdao.numberCPass(rid),rid);
                            } else if (cdao.getNumberScored(rid) >= 25 || cdao.getNumberScored(rid) >= 20 && cdao.numberCAttend(rid)>=25) {
                                if (rdao.getNumberOfRound(tournamentID) > 4) {
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(tournamentID, "Top30");
                                    }
                                }
                                
                                cdao.updateResultByTop(20, rid, "pass");
                                cdao.updateFailedCandidates("fail", 2, rid);
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(rid), cdao.numberCPass(rid), rid);
                            } else if (cdao.getNumberScored(rid) >= 15 || cdao.getNumberScored(rid) >= 10 && cdao.numberCAttend(rid)>=15) {
                                    if (rdao.getNumberOfRound(tournamentID) > 3) {
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(tournamentID, "Top30");
                                        rdao.deleteByName(tournamentID, "Top20");
                                    } else if (rname.equals("Top30")) {
                                        rdao.deleteByName(tournamentID, "Top20");
                                    }
                                }
                                cdao.updateResultByTop(10, rid, "pass");
                                cdao.updateFailedCandidates("fail", 2, rid);
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(rid), cdao.numberCPass(rid), rid);
                            } else if (cdao.getNumberScored(rid) >= 10 || cdao.getNumberScored(rid) >= 2 && cdao.numberCAttend(rid)>=10) {
                                if (rdao.getNumberOfRound(tournamentID) > 2) {
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(tournamentID, "Top30");
                                        rdao.deleteByName(tournamentID, "Top20");
                                        rdao.deleteByName(tournamentID, "Top10");
                                    } else if (rname.equals("Top30")) {
                                        rdao.deleteByName(tournamentID, "Top20");
                                        rdao.deleteByName(tournamentID, "Top10");
                                    } else if (rname.equals("Top20")) {
                                        rdao.deleteByName(tournamentID, "Top10");
                                    }
                                }
                                cdao.updateResultByTop(4, rid, "pass");
                                cdao.updateFailedCandidates("fail", 2, rid);
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(rid), cdao.numberCPass(rid), rid);
                            } else if (cdao.getNumberScored(rid) <= 4) {
                                if(cdao.getNumberScored(rid)==1){
                                    
                                }
                                AchievementDAO adao = new AchievementDAO();
                                List<CandidatesDTO> top4 = cdao.getIDListByTop(cdao.getNumberScored(rid), rid);
                                for (int i = 1; i <= top4.size(); i++) {
                                    cdao.updateResultByID(Integer.toString(i), top4.get(i - 1).getCandidatesID());
                                    int birdid = cdao.getBirdId(top4.get(i - 1).getCandidatesID());
                                    String medals = adao.getMedalsByBid(birdid);
                                    if (medals == null) {
                                        adao.updateMedals("Top1:0;Top2:0;Top3:0;Top4:0", birdid);
                                        medals = adao.getMedalsByBid(birdid);
                                    }if(medals != null){
                                        String[] topValues = medals.split(";");
                                        String[] parts = topValues[i - 1].split(":");
                                        String top = parts[0];
                                        int value = Integer.parseInt(parts[1]);
                                        value++;
                                        topValues[i - 1] = top + ":" + value;
                                        medals = String.join(";", topValues);
                                        adao.updateMedals(medals, birdid);
                                        adao.updateTotalScore(i, birdid);
                                    }
                                }
                                adao.updateRanking();
                                cdao.updateFailedCandidates("fail", 2, rid);
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(rid), cdao.numberCPass(rid), rid);
                            }
                            Fcands = cdao.getFinishCandidates(rid);
                            round = rdao.getRoundByID(rid);
                            
                        }

                    }
                    if (Fcands.isEmpty()) {
                        request.setAttribute("error", "result have not set");
                    } else {
                        if (rdao.getNextRStatus(tournamentID, rid) == 1 || rdao.getNextRStatus(tournamentID, rid) == 2) {
                            List<CandidatesDTO> fpcands = cdao.getFinishPassedCandidates(rid);
                            Fcands.addAll(0,cdao.getFinishPassedCandidates(rid));
                            request.setAttribute("nexton", "true");

                        } else if (rdao.getNextRStatus(tournamentID, rid) == 0) {
                            request.setAttribute("nexton", "false");
                        }
                    }

                    
                    if (round.getRoundName().equals("Top4") && round.getRoundStatus() == 2) {
                        request.setAttribute("finishTournament", "true");
                    } else {
                        request.setAttribute("finishTournament", "false");
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
