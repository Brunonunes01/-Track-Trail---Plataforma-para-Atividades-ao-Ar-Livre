/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.trackTrail.dao;


import br.com.trackTrail.model.Usuario;
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
public class UsuarioDAO implements GenericDAO{
    
    private Connection conexao;
    
    public UsuarioDAO() throws Exception{
       conexao = SingleConnection.getConnection();
    }

    @Override
    public Boolean cadastrar(Object objeto) {
       Usuario oUsuario = (Usuario) objeto;
       Boolean retorno = false;
       if (oUsuario.getIdUsuario() == 0) {
           retorno = this.inserir(oUsuario);
           
       }else {
           retorno = this.alterar(oUsuario);
       }
        return retorno;
    }

    @Override
    public Boolean inserir(Object objeto) {
      Usuario oUsuario = (Usuario) objeto;
      PreparedStatement stmt = null;
      String sql = "insert into usuario (nome, email, senha) values (?,?,?)";
      try{
          stmt = conexao.prepareStatement(sql);
          stmt.setString(1, oUsuario.getNome());
          stmt.setString(2, oUsuario.getEmail());
          stmt.setString(3, oUsuario.getSenha());
          stmt.execute();
          conexao.commit();
          return true;
      } catch (Exception ex){
      try {
          System.out.println("Problemas ao cadastrar a Usuario! Erro: "+ex.getMessage());
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
        Usuario oUsuario = (Usuario) objeto;
    PreparedStatement stmt = null;
    String sql = "update usuario set nome=?, email=?, senha=? where idusuario=?";
    
    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setString(1, oUsuario.getNome());
        stmt.setString(2, oUsuario.getEmail());
        stmt.setString(3, oUsuario.getSenha());
        stmt.setInt(4, oUsuario.getIdUsuario());
        stmt.execute();
        conexao.commit();
        return true;
    } catch (Exception ex) {
        try {
            System.out.println("Problemas ao alterar a Usuario! Erro: " + ex.getMessage());
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
         int idUsuario = numero;
    PreparedStatement stmt = null;
    
    String sql = "delete from usuario where idusuario=?";
    
    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idUsuario);
        stmt.execute();
        conexao.commit();
        return true;
        
    } catch (Exception ex) {
        System.out.println("Problemas ao excluir o Usuario! Erro: " + ex.getMessage());
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
          int idUsuario = numero;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    Usuario oUsuario = null;
    String sql = "select * from usuario where idUsuario=?";

    try {
        stmt = conexao.prepareStatement(sql);
        stmt.setInt(1, idUsuario);
        rs = stmt.executeQuery();

        while (rs.next()) {
            oUsuario = new Usuario();
            oUsuario.setIdUsuario(rs.getInt("idUsuario"));
            oUsuario.setNome(rs.getString("nome"));
            oUsuario.setEmail(rs.getString("email"));
            oUsuario.setSenha(rs.getString("senha"));
        }

        return oUsuario;
    } catch (Exception ex) {
        System.out.println("Problemas ao carregar Usuario! Erro:" + ex.getMessage());
        return false;
    }
    }

    @Override
    public List<Object> listar() {
        List<Object> resultado = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "Select * from usuario order by idUsuario";
        try {
            stmt = conexao.prepareStatement(sql);
            rs=stmt.executeQuery();
            while (rs.next()) {
                Usuario oUsuario = new Usuario();
                oUsuario.setIdUsuario(rs.getInt("idUsuario"));
                oUsuario.setNome(rs.getString("nome"));
                oUsuario.setEmail(rs.getString("email"));
                oUsuario.setSenha(rs.getString("senha"));
                resultado.add(oUsuario);
            }
        } catch (SQLException ex) {
            System.out.println("Problemas ao listar Usuario! Erro: "
                    +ex.getMessage());
        }
        return resultado;
    }
    }
    

