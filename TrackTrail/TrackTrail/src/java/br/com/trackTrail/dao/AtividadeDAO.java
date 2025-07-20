/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.trackTrail.dao;


import br.com.trackTrail.model.Atividade;
import br.com.trackTrail.utils.SingleConnection;
import java.sql.Connection;
import java.util.List;
import java.util.ArrayList;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;


/**
 *
 * @author Bruno
 */
public class AtividadeDAO implements GenericDAO{
    
    private Connection conexao;
    
    public AtividadeDAO() throws Exception{
       conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
       Atividade oAtividade = (Atividade) objeto;
       Boolean retorno = false;
       if (oAtividade.getIdAtividade() == 0) {
           retorno = this.inserir(oAtividade);
           
       }else {
           retorno = this.alterar(oAtividade);
       }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
      Atividade oAtividade = (Atividade) objeto;
      PreparedStatement stmt = null;
      String sql = "insert into atividade (nomeatividade) values (?)";
      try{
          stmt = conexao.prepareStatement(sql);
          stmt.setString(1, oAtividade.getNomeAtividade());
          stmt.execute();
          conexao.commit();
          return true;
      } catch (Exception ex){
      try {
          System.out.println("Problemas ao cadastrar a Atividade! Erro: "+ex.getMessage());
          ex.printStackTrace();
          conexao.rollback();
      } catch (SQLException e){
          System.out.println("Erro:"+e.getMessage());
          e.printStackTrace();
      }
      return false;
      }
    }

    @Override
    public Boolean alterar(Object objeto) {
        Atividade oAtividade = (Atividade) objeto;
    PreparedStatement stmt = null;
    String sql = "update atividade set nomeatividade=? where idatividade=?";
    
    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setString(1, oAtividade.getNomeAtividade());
        stmt.setInt(2, oAtividade.getIdAtividade());
        stmt.execute();
        conexao.commit();
        return true;
    } catch (Exception ex) {
        try {
            System.out.println("Problemas ao alterar a Atividade! Erro: " + ex.getMessage());
            ex.printStackTrace();
            conexao.rollback();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            e.printStackTrace();
        }
    }
    return false;
    }

    @Override
    public Boolean excluir(int numero) {
         int idAtividade = numero;
    PreparedStatement stmt = null;
    
    String sql = "delete from atividade where idatividade=?";
    
    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idAtividade);
        stmt.execute();
        conexao.commit();
        return true;
        
    } catch (Exception ex) {
        System.out.println("Problemas ao excluir o Atividade! Erro: " + ex.getMessage());
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
          int idAtividade = numero;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    Atividade oAtividade = null;
    String sql = "select * from atividade where idAtividade=?";

    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idAtividade);
        rs = stmt.executeQuery();

        while (rs.next()) {
            oAtividade = new Atividade();
            oAtividade.setIdAtividade(rs.getInt("idAtividade"));
            oAtividade.setNomeAtividade(rs.getString("nomeatividade"));
        }

        return oAtividade;
    } catch (Exception ex) {
        System.out.println("Problemas ao carregar Atividade! Erro:" + ex.getMessage());
        return false;
    }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select * from atividade order by idAtividade";
        try {
            stmt = conexao.prepareStatement(sql);
            rs=stmt.executeQuery();
            while (rs.next()) {
                Atividade oAtividade = new Atividade();
                oAtividade.setIdAtividade(rs.getInt("idAtividade"));
                oAtividade.setNomeAtividade(rs.getString("nomeatividade"));
                resultado.add(oAtividade);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar Atividade! Erro: "
                    +ex.getMessage());
        }
        return resultado;
    }
    }
    

