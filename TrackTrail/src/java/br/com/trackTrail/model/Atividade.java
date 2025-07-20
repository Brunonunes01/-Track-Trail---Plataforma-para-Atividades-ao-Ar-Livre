/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.trackTrail.model;

/**
 *
 * @author bruno
 */
public class Atividade {
    private int idAtividade;
    private String nomeAtividade;

    public Atividade() {
        this.idAtividade = 0;
        this.nomeAtividade = "";
    }

    public Atividade(int idAtividade, String nomeAtividade) {
        this.idAtividade = idAtividade;
        this.nomeAtividade = nomeAtividade;
    }

    public int getIdAtividade() {
        return idAtividade;
    }

    public void setIdAtividade(int idAtividade) {
        this.idAtividade = idAtividade;
    }

    public String getNomeAtividade() {
        return nomeAtividade;
    }

    public void setNomeAtividade(String nomeAtividade) {
        this.nomeAtividade = nomeAtividade;
    }
}
