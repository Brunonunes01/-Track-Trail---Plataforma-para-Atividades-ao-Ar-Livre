package br.com.trackTrail.dao;



import br.com.trackTrail.model.Atividade;
import br.com.trackTrail.model.AtividadeRealizada;
import br.com.trackTrail.model.Rota;
import br.com.trackTrail.model.Usuario;
import br.com.trackTrail.utils.SingleConnection;
import java.sql.SQLException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class AtividadeRealizadaDAO implements GenericDAO {
    
    private Connection conexao;
    
    public AtividadeRealizadaDAO() throws Exception{
        conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
        AtividadeRealizada oAtividadeRealizada = (AtividadeRealizada) objeto;
        Boolean retorno=false;
        if (oAtividadeRealizada.getIdAtividadeRealizada()== 0) {
            retorno = this.inserir(oAtividadeRealizada);
        }else{
            retorno = this.alterar(oAtividadeRealizada);
        }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
        AtividadeRealizada oAtividadeRealizada = (AtividadeRealizada) objeto;
        PreparedStatement stmt = null;
       String sql = "insert into atividaderealizada (idusuario,idatividade,idrota, datarealizacao, distanciapercorrida, situacao) values (?,?,?,?,?,?)";
//                                                                                                                                    ↑ Faltava este placeholder
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oAtividadeRealizada.getUsuario().getIdUsuario());
            stmt.setInt(2, oAtividadeRealizada.getAtividade().getIdAtividade());
            stmt.setInt(3, oAtividadeRealizada.getRota().getIdRota());
            stmt.setObject(4, oAtividadeRealizada.getDataRealizacao());
            stmt.setDouble(5, oAtividadeRealizada.getDistanciaPercorrida());
            stmt.setString(6, oAtividadeRealizada.getSituacao());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex) {
            try {
                System.out.println("Problemas ao cadastrar a Atividade Realizada! Erro: "+ex.getMessage());
                ex.printStackTrace();
                conexao.rollback();
            } catch (SQLException e) {
                System.out.println("Erro:"+e.getMessage());
                e.printStackTrace();
            }
            return false;
        }
    }

    @Override
    public Boolean alterar(Object objeto) {
        AtividadeRealizada  oAtividadeRealizada = (AtividadeRealizada) objeto;
        PreparedStatement stmt = null;
        String sql = "update atividaderealizada set idusuario=?,idatividade=?,idrota=?, datarealizacao=?, distanciapercorrida=?, situacao=?  where idatividaderealizada=?";
        try {
            stmt = conexao.prepareStatement(sql);
            stmt.setInt(1, oAtividadeRealizada.getUsuario().getIdUsuario());
            stmt.setInt(2, oAtividadeRealizada.getAtividade().getIdAtividade());
            stmt.setInt(3, oAtividadeRealizada.getRota().getIdRota());
            stmt.setObject(4, oAtividadeRealizada.getDataRealizacao());
            stmt.setDouble(5, oAtividadeRealizada.getDistanciaPercorrida());
            stmt.setString(6, oAtividadeRealizada.getSituacao());
            stmt.setInt(7, oAtividadeRealizada.getIdAtividadeRealizada());
            stmt.execute();
            conexao.commit();
            return true;
        } catch (Exception ex){
            try{
                System.out.println("Problemas ao alterar a Atividade Realizada! Erro: "+ex.getMessage());
                ex.printStackTrace();
                conexao.rollback();
            } catch (SQLException e) {
                System.out.println("Erro:"+e.getMessage());
                e.printStackTrace();
            }
            return false;
        }
    }

@Override
public Boolean excluir(int numero) {
    int idAtividadeRealizada = numero;
    PreparedStatement stmt = null;
    String sql = "update atividaderealizada set situacao=? where idatividaderealizada=?";
    try {
        AtividadeRealizada oAtividadeRealizada = (AtividadeRealizada) this.carregar(idAtividadeRealizada);
        
        // Verificar se a atividade realizada foi encontrada
        if (oAtividadeRealizada == null) {
            System.out.println("Atividade Realizada não encontrada com ID: " + idAtividadeRealizada);
            return false;
        }
        
        stmt = conexao.prepareStatement(sql);
        if (oAtividadeRealizada.getSituacao().equals("A")) {
            stmt.setString(1, "I"); // se situacao atual for Ativa --> Inativar
        } else {
            stmt.setString(1, "A"); // se situacao atual for Inativo --> Ativar
        }
        stmt.setInt(2, idAtividadeRealizada);
        stmt.execute();
        conexao.commit();
        return true;
        
    } catch (Exception ex) {
        System.out.println("Problemas ao excluir a Atividade Realizada! Erro: " + ex.getMessage());
        ex.printStackTrace();
        try {
            conexao.rollback();
        } catch (SQLException e) {
            System.out.println("Erro no rollback: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
}
@Override
public Object carregar(int numero) {
    int idAtividadeRealizada = numero;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    AtividadeRealizada oAtividadeRealizada = null;
    String sql = "select * from atividaderealizada where idatividaderealizada=?";

    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idAtividadeRealizada);
        rs = stmt.executeQuery();

        if (rs.next()) { // ✅ MUDANÇA: usar if em vez de while
            oAtividadeRealizada = new AtividadeRealizada();
            oAtividadeRealizada.setIdAtividadeRealizada(rs.getInt("idatividaderealizada"));
            
            // ✅ CORREÇÃO: Tratar LocalDate corretamente
            java.sql.Date sqlDate = rs.getDate("datarealizacao");
            if (sqlDate != null) {
                oAtividadeRealizada.setDataRealizacao(sqlDate.toLocalDate());
            }
            
            oAtividadeRealizada.setDistanciaPercorrida(rs.getDouble("distanciapercorrida"));
            oAtividadeRealizada.setSituacao(rs.getString("situacao"));
            
            // Carregar objetos relacionados
            UsuarioDAO oUsuarioDAO = new UsuarioDAO();
            oAtividadeRealizada.setUsuario((Usuario) oUsuarioDAO.carregar(rs.getInt("idusuario")));
            
            AtividadeDAO oAtividadeDAO = new AtividadeDAO();
            oAtividadeRealizada.setAtividade((Atividade) oAtividadeDAO.carregar(rs.getInt("idatividade")));
            
            RotaDAO oRotaDAO = new RotaDAO();
            oAtividadeRealizada.setRota((Rota) oRotaDAO.carregar(rs.getInt("idrota")));
        }

        return oAtividadeRealizada;
        
    } catch (Exception ex) {
        System.out.println("Problemas ao carregar Atividade Realizada! Erro:" + ex.getMessage());
        ex.printStackTrace();
        return null; // ✅ CORREÇÃO: retornar null em vez de false
    }
}

    @Override
    public List<Object> listar() {
    List<Object> resultado = new ArrayList<>();
    PreparedStatement stmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM AtividadeRealizada ORDER BY idatividadeRealizada";
    try {
        stmt = conexao.prepareStatement(sql);
        rs = stmt.executeQuery();
        while (rs.next()) {
            AtividadeRealizada oAtividadeRealizada = new AtividadeRealizada();
            oAtividadeRealizada.setIdAtividadeRealizada(rs.getInt("idAtividadeRealizada"));
            oAtividadeRealizada.setDataRealizacao(rs.getDate("datarealizacao").toLocalDate());
            oAtividadeRealizada.setDistanciaPercorrida(rs.getDouble("distanciapercorrida"));
            oAtividadeRealizada.setSituacao(rs.getString("situacao"));

            // Carregar Usuario
            UsuarioDAO oUsuarioDAO = new UsuarioDAO();
            oAtividadeRealizada.setUsuario((Usuario) oUsuarioDAO.carregar(rs.getInt("idusuario")));

            // Carregar Atividade
            AtividadeDAO oAtividadeDAO = new AtividadeDAO();
            oAtividadeRealizada.setAtividade((Atividade) oAtividadeDAO.carregar(rs.getInt("idatividade")));

            // Carregar Rota
            RotaDAO oRotaDAO = new RotaDAO();
            oAtividadeRealizada.setRota((Rota) oRotaDAO.carregar(rs.getInt("idrota")));

            resultado.add(oAtividadeRealizada);
        }
    } catch (SQLException ex) {
        System.out.println("Problemas ao listar AtividadeRealizada! Erro: " + ex.getMessage());
        ex.printStackTrace();
    } catch (Exception e) {
        System.out.println("Erro ao carregar dados relacionados: " + e.getMessage());
        e.printStackTrace();
    }
    return resultado;
    }
}
