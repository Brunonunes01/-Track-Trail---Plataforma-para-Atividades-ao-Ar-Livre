/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.trackTrail.dao;

import br.com.trackTrail.model.Rota;
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
public class RotaDAO implements GenericDAO{
    
    private Connection conexao;
    
    public RotaDAO() throws Exception{
       conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
       Rota oRota = (Rota) objeto;
       Boolean retorno = false;
       if (oRota.getIdRota() == 0) {
           retorno = this.inserir(oRota);
           
       }else {
           retorno = this.alterar(oRota);
       }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
      Rota oRota = (Rota) objeto;
      PreparedStatement stmt = null;
      String sql = "insert into rota (nome, localizacao, distancia, dificuldade, duracao) values (?,?,?,?,?)";
      try{
          stmt = conexao.prepareStatement(sql);
          stmt.setString(1, oRota.getNome());
          stmt.setString(2, oRota.getLocalizacao());
          stmt.setDouble(3, oRota.getDistancia());
          stmt.setString(4, oRota.getDificuldade());
          stmt.setDouble(5, oRota.getDuracao());
          stmt.execute();
          conexao.commit();
          return true;
      } catch (Exception ex){
      try {
          System.out.println("Problemas ao cadastrar a Rota! Erro: "+ex.getMessage());
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
        Rota oRota = (Rota) objeto;
    PreparedStatement stmt = null;
    String sql = "update rota set nome=?, localizacao=?, distancia=?, dificuldade=?, duracao=? where idrota=?";
    
    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setString(1, oRota.getNome());
        stmt.setString(2, oRota.getLocalizacao());
        stmt.setDouble(3, oRota.getDistancia());
        stmt.setString(4, oRota.getDificuldade());
        stmt.setDouble(5, oRota.getDuracao());
        stmt.setInt(6, oRota.getIdRota());
        stmt.execute();
        conexao.commit();
        return true;
    } catch (Exception ex) {
        try {
            System.out.println("Problemas ao alterar a Rota! Erro: " + ex.getMessage());
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
         int idRota = numero;
    PreparedStatement stmt = null;
    
    String sql = "delete from rota where idrota=?";
    
    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idRota);
        stmt.execute();
        conexao.commit();
        return true;
        
    } catch (Exception ex) {
        System.out.println("Problemas ao excluir o Rota! Erro: " + ex.getMessage());
        try {
            conexao.rollback(); // Desfaz a transação em caso de erro
        } catch (SQLException e) {
            System.out.println("Erro no rollback: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }
    }

    @Override
    public Object carregar(int numero) {
          int idRota = numero;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    Rota oRota = null;
    String sql = "select * from rota where idRota=?";

    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idRota);
        rs = stmt.executeQuery();

        while (rs.next()) {
            oRota = new Rota();
            oRota.setIdRota(rs.getInt("idRota"));
            oRota.setNome(rs.getString("nome"));
            oRota.setLocalizacao(rs.getString("localizacao"));
            oRota.setDistancia(rs.getDouble("distancia"));
            oRota.setDificuldade(rs.getString("dificuldade"));
            oRota.setDuracao(rs.getDouble("duracao"));
        }

        return oRota;
    } catch (Exception ex) {
        System.out.println("Problemas ao carregar Rota! Erro:" + ex.getMessage());
        return false;
    }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select * from rota order by idRota";
        try {
            stmt = conexao.prepareStatement(sql);
            rs=stmt.executeQuery();
            while (rs.next()) {
                Rota oRota = new Rota();
                oRota.setIdRota(rs.getInt("idRota"));
                oRota.setNome(rs.getString("nome"));
                oRota.setLocalizacao(rs.getString("localizacao"));
                oRota.setDistancia(rs.getDouble("distancia"));
                oRota.setDificuldade(rs.getString("dificuldade"));
                oRota.setDuracao(rs.getDouble("duracao"));
                resultado.add(oRota);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar Rota! Erro: "
                    +ex.getMessage());
        }
        return resultado;
    }
    }