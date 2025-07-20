/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.trackTrail.controller.atividadeRealizada;

import br.com.trackTrail.dao.AtividadeRealizadaDAO;
import br.com.trackTrail.dao.GenericDAO;
import br.com.trackTrail.model.Atividade;
import br.com.trackTrail.model.AtividadeRealizada;
import br.com.trackTrail.model.Rota;
import br.com.trackTrail.model.Usuario;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author bruno
 */
@WebServlet(name = "AtividadeRealizadaCadastrar", urlPatterns = {"/AtividadeRealizadaCadastrar"})
public class AtividadeRealizadaCadastrar extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        String mensagem = null;
        
        try {
            // Captura dos parâmetros do formulário
            int idAtividadeRealizada = Integer.parseInt(request.getParameter("idatividaderealizada"));
            int idUsuario = Integer.parseInt(request.getParameter("idusuario"));
            int idAtividade = Integer.parseInt(request.getParameter("idatividade"));
            int idRota = Integer.parseInt(request.getParameter("idrota"));
            String dataRealizacaoStr = request.getParameter("datarealizacao");
            double distanciaPercorrida = Double.parseDouble(request.getParameter("distanciapercorrida"));
            String situacao = request.getParameter("situacao");
            
            // Log para debug
            System.out.println("Processando cadastro de AtividadeRealizada:");
            System.out.println("ID: " + idAtividadeRealizada);
            System.out.println("Usuario ID: " + idUsuario);
            System.out.println("Atividade ID: " + idAtividade);
            System.out.println("Rota ID: " + idRota);
            System.out.println("Data: " + dataRealizacaoStr);
            System.out.println("Distância: " + distanciaPercorrida);
            System.out.println("Situação: " + situacao);
            
            // Validações básicas
            if (idUsuario <= 0) {
                mensagem = "Por favor, selecione um usuário válido.";
                response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
                return;
            }
            
            if (idAtividade <= 0) {
                mensagem = "Por favor, selecione uma atividade válida.";
              response.sendRedirect("AtividadeRealizadaListar?mensagem=" + 
                     java.net.URLEncoder.encode(mensagem, "UTF-8"));
                return;
            }
            
            if (idRota <= 0) {
                mensagem = "Por favor, selecione uma rota válida.";
                response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
                return;
            }
            
            if (distanciaPercorrida < 0) {
                mensagem = "A distância percorrida deve ser um valor positivo.";
                response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
                return;
            }
            
            // Conversão da data
            LocalDate dataRealizacao = null;
            if (dataRealizacaoStr != null && !dataRealizacaoStr.trim().isEmpty()) {
                try {
                    dataRealizacao = LocalDate.parse(dataRealizacaoStr, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                } catch (DateTimeParseException e) {
                    mensagem = "Formato de data inválido. Use o formato dd/mm/aaaa.";
                    response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
                    return;
                }
            } else {
                mensagem = "Por favor, informe a data de realização.";
                response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
                return;
            }
            
            // Criação do objeto AtividadeRealizada
            AtividadeRealizada oAtividadeRealizada = new AtividadeRealizada();
            oAtividadeRealizada.setIdAtividadeRealizada(idAtividadeRealizada);
            oAtividadeRealizada.setDataRealizacao(dataRealizacao);
            oAtividadeRealizada.setDistanciaPercorrida(distanciaPercorrida);
            oAtividadeRealizada.setSituacao(situacao != null && !situacao.trim().isEmpty() ? situacao : "A");
            
            // Criação dos objetos relacionados (apenas com IDs)
            Usuario oUsuario = new Usuario();
            oUsuario.setIdUsuario(idUsuario);
            oAtividadeRealizada.setUsuario(oUsuario);
            
            Atividade oAtividade = new Atividade();
            oAtividade.setIdAtividade(idAtividade);
            oAtividadeRealizada.setAtividade(oAtividade);
            
            Rota oRota = new Rota();
            oRota.setIdRota(idRota);
            oAtividadeRealizada.setRota(oRota);
            
            // Persistência no banco de dados
            GenericDAO dao = new AtividadeRealizadaDAO();
            if (dao.cadastrar(oAtividadeRealizada)) {
                if (idAtividadeRealizada == 0) {
                    mensagem = "Atividade Realizada cadastrada com sucesso!";
                } else {
                    mensagem = "Atividade Realizada alterada com sucesso!";
                }
            } else {
                mensagem = "Problemas ao cadastrar Atividade Realizada. Verifique os dados informados e tente novamente!";
            }
            
            // Redireciona para a listagem com mensagem
            response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
            
        } catch (NumberFormatException ex) {
            mensagem = "Erro nos dados numéricos informados. Verifique os valores e tente novamente.";
            System.out.println("Erro de conversão numérica: " + ex.getMessage());
            response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
            
        } catch (Exception ex) {
            mensagem = "Erro interno do servidor. Tente novamente mais tarde.";
            System.out.println("Problemas no Servlet ao cadastrar AtividadeRealizada! Erro: " + ex.getMessage());
            ex.printStackTrace();
            response.sendRedirect("AtividadeRealizadaListar?mensagem=" + mensagem);
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
        return "Servlet para cadastrar e alterar atividades realizadas";
    }// </editor-fold>
}