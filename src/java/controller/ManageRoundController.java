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
            String tournamentID = request.getParameter("tournamentID");
            String rname = request.getParameter("roundName");
            String rid = request.getParameter("roundID");
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
                round = rdao.getRoundByID(Integer.parseInt(rid));
                if (round == null) {
                    url = ERROR;
                }
                    if(!rname.equals("Qualified")){
                        if(rdao.getPreviousRStatus(Integer.parseInt(tournamentID), Integer.parseInt(rid))==2){
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
                round = rdao.getRoundByID(Integer.parseInt(rid));
                if (round == null) {
                    url = ERROR;
                } else {
                    List<CandidatesDTO> Rcands = cdao.getCandidatesByRID(1, Integer.parseInt(rid));
                    if (Rcands.isEmpty()) {
                            cdao.updateRoundCandidates(Integer.parseInt(rid), Integer.parseInt(tournamentID), 1);
                            if (!rname.equals("Qualified")) {
                                cdao.resetResultCandidates(Integer.parseInt(rid), Integer.parseInt(tournamentID), 1);
                            }
                        rdao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                        Rcands = cdao.getCandidatesByRID(1, Integer.parseInt(rid));
                        round = rdao.getRoundByID(Integer.parseInt(rid));
                    }
                    if (Rcands.isEmpty()) {
                        request.setAttribute("error", "there is not any bird in this round");
                    }
                    if(cdao.getNumberScored(Integer.parseInt(rid)) == 0){
                        request.setAttribute("emptyscored", "true");
                    }else{
                        request.setAttribute("emptyscored", "false");
                    }
                    request.setAttribute("round", round);
                    request.setAttribute("cands", Rcands);
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
                        if (round.getBirdPass() == 0) {
                            if (cdao.getNumberScored(Integer.parseInt(rid)) == 0) {
                                
                            } else if (cdao.getNumberScored(Integer.parseInt(rid)) >= 40) {
                                cdao.updateResultByTop(30, Integer.parseInt(rid), "pass");
                                cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                            } else if (cdao.getNumberScored(Integer.parseInt(rid)) >= 30 || cdao.getNumberScored(Integer.parseInt(rid)) >= 20 && cdao.numberCAttend(Integer.parseInt(rid))>=30) {
                                if (rdao.getNumberOfRound(Integer.parseInt(tournamentID)) > 4) {
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top30");
                                    }
                                }
                                
                                cdao.updateResultByTop(20, Integer.parseInt(rid), "pass");
                                cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                            } else if (cdao.getNumberScored(Integer.parseInt(rid)) >= 20 || cdao.getNumberScored(Integer.parseInt(rid)) >= 10 && cdao.numberCAttend(Integer.parseInt(rid))>=20) {
                                    if (rdao.getNumberOfRound(Integer.parseInt(tournamentID)) > 3) {
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top30");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top20");
                                    } else if (rname.equals("Top30")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top20");
                                    }
                                }
                                cdao.updateResultByTop(10, Integer.parseInt(rid), "pass");
                                cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                            } else if (cdao.getNumberScored(Integer.parseInt(rid)) >= 10 || cdao.getNumberScored(Integer.parseInt(rid)) >= 2 && cdao.numberCAttend(Integer.parseInt(rid))>=10) {
                                if (rdao.getNumberOfRound(Integer.parseInt(tournamentID)) > 2) {
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top30");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top20");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top10");
                                    } else if (rname.equals("Top30")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top20");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top10");
                                    } else if (rname.equals("Top20")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top10");
                                    }
                                }
                                cdao.updateResultByTop(4, Integer.parseInt(rid), "pass");
                                cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                            } else if (cdao.getNumberScored(Integer.parseInt(rid)) <= 4) {
                                if(cdao.getNumberScored(Integer.parseInt(rid))==1){
                                    if(cdao.numberCAttend(Integer.parseInt(rid))>=10){
                                    if (rname.equals("Qualified")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top30");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top20");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top10");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top4");
                                        rdao.updateRoundName("Top4", Integer.parseInt(rid));
                                        request.removeAttribute("roundName");
                                        request.setAttribute("roundName", "Top4");
                                    } else if (rname.equals("Top30")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top20");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top10");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top4");
                                        rdao.updateRoundName("Top4", Integer.parseInt(rid));
                                        request.removeAttribute("roundName");
                                        request.setAttribute("roundName", "Top4");
                                    } else if (rname.equals("Top20")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top10");
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top4");
                                        rdao.updateRoundName("Top4", Integer.parseInt(rid));
                                        request.removeAttribute("roundName");
                                        request.setAttribute("roundName", "Top4");
                                    } else if (rname.equals("Top10")) {
                                        rdao.deleteByName(Integer.parseInt(tournamentID), "Top4");
                                        rdao.updateRoundName("Top4", Integer.parseInt(rid));
                                        request.removeAttribute("roundName");
                                        request.setAttribute("roundName", "Top4");
                                    } 
                                }
                                }
                                AchievementDAO adao = new AchievementDAO();
                                List<CandidatesDTO> top4 = cdao.getIDListByTop(cdao.getNumberScored(Integer.parseInt(rid)), Integer.parseInt(rid));
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
                                cdao.updateFailedCandidates("fail", 2, Integer.parseInt(rid));
                                rdao.updateAttendPassCandidates(cdao.numberCAttend(Integer.parseInt(rid)), cdao.numberCPass(Integer.parseInt(rid)), Integer.parseInt(rid));
                            }
                            
                            Fcands = cdao.getFinishCandidates(Integer.parseInt(rid));
                            round = rdao.getRoundByID(Integer.parseInt(rid));
                        }

                    }
                    
                    if (Fcands.isEmpty()) {
                        request.setAttribute("error", "result have not set");
                    }else{
                        
                    }
                    
                    if (rdao.getNumberOfRound(Integer.parseInt(tournamentID)) == 1) {
                        request.setAttribute("plstatus", "true");
                    } else if (cdao.numberCPass(Integer.parseInt(rid)) == 1 && cdao.getNumberFailed(Integer.parseInt(rid)) > 0 || round.getRoundName().equals("Top4") && cdao.getNumberFailed(Integer.parseInt(rid)) > 0) {
                        request.setAttribute("plstatus", "true");
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
