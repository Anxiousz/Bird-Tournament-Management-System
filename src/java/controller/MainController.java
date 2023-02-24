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

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    //link to jsp
    private static final String HOME_USER_PAGE = "userPage.jsp";
    private static final String HOME_GUEST_PAGE = "guestPage.jsp";
    //value of action
    private static final String LOGIN = "Login";
    private static final String REGISTER = "Register";
    private static final String LOGOUT = "Logout";
    private static final String HOME_USER = "HOME_USER";
    private static final String TOURNAMENT = "TOURNAMENT";
    private static final String HOME_GUEST = "HOME_GUEST";
    private static final String ON_GOING_TOURNAMENT = "ON_GOING_TOURNAMENT";
    private static final String OLD_TOURNAMENT = "OLD_TOURNAMENT";
    private static final String DELAY_TOURNAMENT = "DELAY_TOURNAMENT";
    private static final String TOURNAMENT_DETAIL = "TOURNAMENT_DETAIL";

    //link to servlet
    private static final String LOAD_HOME_PAGE = "LoadHomePageController";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String REGISTER_CONTROLLER = "RegisterController";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String ALL_TOURNAMENT_CONTROLLER = "AllTournamentController";
    private static final String ON_GOING_TOURNAMENT_CONTROLLER = "OnGoingTournamentController";
    private static final String OLD_TOURNAMENT_CONTROLLER = "OldTournamentController";
    private static final String DELAY_TOURNAMENT_CONTROLLER = "DelayTournamentController";
    private static final String TOURNAMENT_DETAIL_CONTROLLER = "TournamentDetailController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOAD_HOME_PAGE;
        try {
            String action = request.getParameter("action");
            switch (action) {
                case "":
                    url = LOAD_HOME_PAGE;
                    break;
                case LOGIN:
                    url = LOGIN_CONTROLLER;
                    break;
                case REGISTER:
                    url = REGISTER_CONTROLLER;
                    break;
                case LOGOUT:
                    url = LOGOUT_CONTROLLER;
                    break;
                case HOME_USER:
                    url = HOME_USER_PAGE;
                    break;
                case HOME_GUEST:
                    url = HOME_GUEST_PAGE;
                    break;
                case TOURNAMENT:
                    url = ALL_TOURNAMENT_CONTROLLER;
                    break;
                case ON_GOING_TOURNAMENT:
                    url = ON_GOING_TOURNAMENT_CONTROLLER;
                    break;
                case OLD_TOURNAMENT:
                    url = OLD_TOURNAMENT_CONTROLLER;
                    break;
                case DELAY_TOURNAMENT:
                    url = DELAY_TOURNAMENT_CONTROLLER;
                    break;
                case TOURNAMENT_DETAIL:
                    url = TOURNAMENT_DETAIL_CONTROLLER;
                    break;
            }
        } catch (Exception e) {
            log("Error at MainController" + e.toString());
            request.setAttribute("mess", e.toString());
        } finally {
            request.getSession().setAttribute("urlHistory", "MainController");
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
