package br.com.trackTrail.controller.atividadeRealizada;




import br.com.trackTrail.dao.AtividadeRealizadaDAO;
import br.com.trackTrail.dao.GenericDAO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author brunomomoi
 */
@WebServlet(name = "AtividadeRealizadaExcluir", urlPatterns = {"/AtividadeRealizadaExcluir"})
public class AtividadeRealizadaExcluir extends HttpServlet {

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
        int idAtividadeRealizada = Integer.parseInt(request.getParameter("idAtividadeRealizada"));
        String mensagem = null;
        try {
            GenericDAO dao = new AtividadeRealizadaDAO();
            if (dao.excluir(idAtividadeRealizada)) {
                mensagem = "Atividade Realizada excluída com Sucesso!";
            } else {
                mensagem = "Problemas ao excluir Atividade Realizada";
            }
            request.setAttribute("mensagem", mensagem);
            response.sendRedirect("AtividadeRealizadaListar");
        } catch (Exception ex){
            System.out.println("Problemas no servlet ao excluir Atividade Realizada! Erro: "+ ex.getMessage());
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
        return "Short description";
    }// </editor-fold>
}