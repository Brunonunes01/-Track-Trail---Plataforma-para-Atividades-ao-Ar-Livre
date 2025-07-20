/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.trackTrail.controller.atividadeRealizada;

import br.com.trackTrail.dao.AtividadeDAO;
import br.com.trackTrail.dao.AtividadeRealizadaDAO;
import br.com.trackTrail.dao.RotaDAO;
import br.com.trackTrail.dao.UsuarioDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno
 */
@WebServlet(name = "AtividadeRealizadaCarregar", urlPatterns = {"/AtividadeRealizadaCarregar"})
public class AtividadeRealizadaCarregar extends HttpServlet {

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
        try {
            int idAtividadeRealizada = Integer.parseInt(request.getParameter("idAtividadeRealizada"));
            
            // Cria objeto de AtividadeRealizadaDAO - camada dao
            AtividadeRealizadaDAO oAtividadeRealizadaDAO = new AtividadeRealizadaDAO();
            
            // Cria variável no servidor para armazenar objeto de AtividadeRealizada com os dados carregados
            request.setAttribute("atividadeRealizada", oAtividadeRealizadaDAO.carregar(idAtividadeRealizada));
            
            // Busca uma lista de usuários para alimentar a caixa de seleção na view (jsp)
            UsuarioDAO oUsuarioDAO = new UsuarioDAO();
            request.setAttribute("usuarios", oUsuarioDAO.listar());
            
            // Busca uma lista de atividades para alimentar a caixa de seleção na view (jsp)
            AtividadeDAO oAtividadeDAO = new AtividadeDAO();
            request.setAttribute("atividades", oAtividadeDAO.listar());
            
            // Busca uma lista de rotas para alimentar a caixa de seleção na view (jsp)
            RotaDAO oRotaDAO = new RotaDAO();
            request.setAttribute("rotas", oRotaDAO.listar());
            
            // Despacha os objetos de atividade realizada e as listas para a página jsp
            request.getRequestDispatcher("/cadastros/atividadeRealizada/atividadeRealizadaCadastrar.jsp").forward(request, response);
            
        } catch (Exception ex) {
            System.out.println("Erro carregar atividade realizada: " + ex.getMessage());
            ex.printStackTrace();
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
        return "Servlet para carregar atividade realizada para edição";
    }// </editor-fold>
}