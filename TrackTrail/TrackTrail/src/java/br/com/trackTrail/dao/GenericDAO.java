
    
package br.com.trackTrail.dao;

import java.util.List;

/**
 *
 * @author Bruno
 */
public interface GenericDAO {
    
    public Boolean cadastrar(Object objeto);
    public Boolean inserir(Object objeto);
    public Boolean alterar(Object objeto);
    public Boolean excluir(int numero);
    public Object carregar(int numero);
    public List<Object> listar();
    
}

    

