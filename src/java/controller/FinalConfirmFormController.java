/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import bird.BirdDAO;
import bird.BirdDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import registrationform.RegistrationFormDAO;
import registrationform.RegistrationFormDTO;

/**
 *
 * @author anh12
 */
@WebServlet(name = "FinalConfirmFormController", urlPatterns = {"/FinalConfirmFormController"})
public class FinalConfirmFormController extends HttpServlet {

    private static final String SUCCESS = "finalConfirmedForm.jsp";
    private static final String ERROR = "error.jsp";

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
            BirdDAO bird = new BirdDAO();
            RegistrationFormDAO regis = new RegistrationFormDAO();
            HttpSession s = request.getSession();
            String url = null;
            try {
                int tID = Integer.valueOf(request.getParameter("tID"));
                int aID = Integer.valueOf(request.getParameter("aID"));
                String birdName = request.getParameter("bName");
                String location = request.getParameter("location");
                int fee = Integer.valueOf(request.getParameter("fee"));
                int formStatus = 1;
                BirdDTO b = bird.search_bird(aID, birdName);
                int birdID = b.getBirdID();
                BirdDTO bird_form = bird.getByID(birdID);
                boolean final_form = regis.insertForm(birdID, aID, birdID, location, fee, formStatus);
                if (final_form == true) {
                    url = SUCCESS;
                    s.setAttribute("FINAL_FORM", final_form);
                    s.setAttribute("BIRD_FORM", bird_form);
                } else {
                    url = ERROR;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
