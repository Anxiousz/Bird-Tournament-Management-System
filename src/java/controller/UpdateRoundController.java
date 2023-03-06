/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import round.RoundDAO;
import tournament.TournamentDAO;

/**
 *
 * @author thang
 */
@WebServlet(name = "UpdateRoundController", urlPatterns = {"/UpdateRoundController"})
public class UpdateRoundController extends HttpServlet {
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
            String tid = request.getParameter("tournamentID");
            String rid = request.getParameter("roundID");
            String rname = request.getParameter("roundName");
            String typeofround = request.getParameter("typeOfRound");
            String birdattend = request.getParameter("birdAttend");
            String rstatus = request.getParameter("roundStatus");
            String birdPass = request.getParameter("birdPass");
            String action = request.getParameter("action");
            int roundtatus = -1;
            if(rstatus.equals("Coming soon")){
                roundtatus = 0;
            }else if (rstatus.equals("On Going")){
                roundtatus = 1;
            }else if (rstatus.equals("Finish")){
                roundtatus = 2;
            }else{
            }
        try  {
           
            
            if(action.equals("Update Round")){
                RoundDAO rdao =new RoundDAO();
                if(rdao.updateRound(typeofround, Integer.parseInt(birdattend), Integer.parseInt(birdPass),roundtatus,Integer.parseInt(rid))){
                   url = TOURNAMENT_DETAIL;
                }else{
                    url = ERROR;
                }
                
            }
           
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            if(url==ERROR){
                request.getRequestDispatcher(url).forward(request, response);
            }else{
                url="RoundController?roundID="+rid+"&roundStatus="+roundtatus+"&roundName="+rname+"&tournamentID="+tid;
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