/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.trackTrail.controller.atividadeRealizada;

import br.com.trackTrail.dao.AtividadeDAO;
import br.com.trackTrail.dao.RotaDAO;
import br.com.trackTrail.dao.UsuarioDAO;
import br.com.trackTrail.model.AtividadeRealizada;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno
 */
@WebServlet(name = "AtividadeRealizadaNovo", urlPatterns = {"/AtividadeRealizadaNovo"})
public class AtividadeRealizadaNovo extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try {
            // Cria objeto de AtividadeRealizada vazio e seta o id como zero
            AtividadeRealizada oAtividadeRealizada = new AtividadeRealizada();
            
            // Cria variável no servidor para armazenar objeto de atividade realizada
            request.setAttribute("atividadeRealizada", oAtividadeRealizada);
            
            // Busca uma lista de usuários para alimentar a caixa de seleção na view (jsp)
            UsuarioDAO oUsuarioDAO = new UsuarioDAO();
            request.setAttribute("usuarios", oUsuarioDAO.listar());
            
            // Busca uma lista de atividades para alimentar a caixa de seleção na view (jsp)
            AtividadeDAO oAtividadeDAO = new AtividadeDAO();
            request.setAttribute("atividades", oAtividadeDAO.listar());
            
            // Busca uma lista de rotas para alimentar a caixa de seleção na view (jsp)
            RotaDAO oRotaDAO = new RotaDAO();
            request.setAttribute("rotas", oRotaDAO.listar());
            
            // Log para debug
            System.out.println("Preparando formulário para nova atividade realizada");
            
            // Despacha os objetos para a página jsp
            request.getRequestDispatcher("/cadastros/atividadeRealizada/atividadeRealizadaCadastrar.jsp").forward(request, response);
            
        } catch (Exception ex) {
            System.out.println("Erro ao preparar formulário de nova atividade realizada: " + ex.getMessage());
            ex.printStackTrace();
            
            // Em caso de erro, redirecionar para a listagem com mensagem de erro
            response.sendRedirect(request.getContextPath() + "/AtividadeRealizadaListar?mensagem=Erro ao carregar formulário: " + ex.getMessage());
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AtividadeRealizadaNovo.class.getName()).log(Level.SEVERE, null, ex);
            // Redirecionar para página de erro ou listagem
            response.sendRedirect(request.getContextPath() + "/AtividadeRealizadaListar?mensagem=Erro interno do servidor");
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(AtividadeRealizadaNovo.class.getName()).log(Level.SEVERE, null, ex);
            // Redirecionar para página de erro ou listagem
            response.sendRedirect(request.getContextPath() + "/AtividadeRealizadaListar?mensagem=Erro interno do servidor");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Servlet para preparar formulário de nova atividade realizada";
    }// </editor-fold>
}