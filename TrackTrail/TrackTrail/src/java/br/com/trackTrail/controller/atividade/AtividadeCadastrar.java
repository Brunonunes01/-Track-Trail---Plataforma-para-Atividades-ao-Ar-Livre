/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.trackTrail.controller.atividade;

import br.com.trackTrail.dao.AtividadeDAO;
import br.com.trackTrail.dao.GenericDAO;
import br.com.trackTrail.model.Atividade;
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
@WebServlet(name = "AtividadeCadastrar", urlPatterns = {"/AtividadeCadastrar"})
public class AtividadeCadastrar extends HttpServlet {

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
        int idAtividade = Integer.parseInt(request.getParameter("idatividade"));
        String nomeAtividade = request.getParameter("nomeatividade");
        String mensagem = null;
        Atividade oAtividade = new Atividade();
        oAtividade.setIdAtividade(idAtividade);
        oAtividade.setNomeAtividade(nomeAtividade);
        try{
            GenericDAO dao = new AtividadeDAO();
            if (dao.cadastrar(oAtividade)){
                mensagem = "Atividade cadastrada com sucesso!";
            } else {
                mensagem = "Problemas ao cadastrar Atividade.Verifique os dados informados e tente novamente!";
                }
            request.setAttribute("mensagem", mensagem);
            response.sendRedirect("AtividadeListar");
            } catch (Exception ex){
                System.out.println("Problemas no Servlet ao cadastrar Atividade! Erro: " + ex.getMessage());
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
