/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.trackTrail.controller.rota;

import br.com.trackTrail.dao.GenericDAO;
import br.com.trackTrail.dao.RotaDAO;
import br.com.trackTrail.model.Rota;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aluno
 */
@WebServlet(name = "RotaCadastrar", urlPatterns = {"/RotaCadastrar"})
public class RotaCadastrar extends HttpServlet {

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
       response.setContentType("text/html;charset=iso-8859-1");
        int idRota = Integer.parseInt(request.getParameter("idrota"));
        String nome = request.getParameter("nome");
        String localizacao = request.getParameter("localizacao");
        Double distancia = Double.parseDouble(request.getParameter("distancia"));
        String dificuldade = request.getParameter("dificuldade");
        Double duracao = Double.parseDouble(request.getParameter("duracao"));
        String mensagem = null;
        Rota oRota = new Rota();
        oRota.setIdRota(idRota);
        oRota.setNome(nome);
        oRota.setLocalizacao(localizacao);
        oRota.setDistancia(distancia);
        oRota.setDificuldade(dificuldade);
        oRota.setDuracao(duracao);
        try{
            GenericDAO dao = new RotaDAO();
            if (dao.cadastrar(oRota)){
                mensagem = "Rota cadastrado com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Rota.Verifique os dados informados e tente novamente!";
                }
            request.setAttribute("mensagem", mensagem);
            response.sendRedirect("RotaListar");
            } catch (Exception ex){
                System.out.println("Problemas no Servlet ao cadastrar Rota! Erro: " + ex.getMessage());
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
