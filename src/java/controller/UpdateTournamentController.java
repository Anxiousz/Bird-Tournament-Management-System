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
import tournament.TournamentDAO;

/**
 *
 * @author anh12
 */
@WebServlet(name = "UpdateTournamentController", urlPatterns = {"/UpdateTournamentController"})
public class UpdateTournamentController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            String url = ERROR;
        try  {
            String tid = request.getParameter("tournamentID");
            String tstatus = request.getParameter("tournamentStatus");
            String dateTime = request.getParameter("dateTime");
            String location = request.getParameter("location");
            String fee = request.getParameter("fee");
            String prize = request.getParameter("prize");
            String action = request.getParameter("action");
            int tourstatus = -1;
            if(tstatus.equals("Coming soon")){
                tourstatus = 0;
            }else if (tstatus.equals("On Going")){
                tourstatus = 3;
            }else if (tstatus.equals("Finish")){
                tourstatus = 4;
            }else if (tstatus.equals("Pause")){
                tourstatus = 5;
            }else{
            }
            String last3 = fee.substring(fee.length() - 3);
            if( last3.equals("VND")){
                fee = fee.substring(0,fee.length() - 3);
            }
            if(action.equals("Update Tournament")){
                TournamentDAO tdao =new TournamentDAO();
                if(tdao.updateTournament(tourstatus, dateTime, location, fee, prize,Integer.parseInt(tid))){
                   url = TOURNAMENT_DETAIL;
                }else{
                    url = ERROR;
                }
                
            }
           
        }catch (Exception e){
            e.printStackTrace();
        }finally{
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