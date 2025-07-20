/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.trackTrail.model;

import java.time.LocalDate;

/**
 *
 * @author bruno
 */
public class AtividadeRealizada {
    private int idAtividadeRealizada;
    private Usuario usuario;
    private Atividade atividade;
    private Rota rota;
    private  java.time.LocalDate dataRealizacao;
    private double distanciaPercorrida;
    private String situacao;

    public AtividadeRealizada(int idAtividadeRealizada, Usuario usuario, Atividade atividade, Rota rota, LocalDate dataRealizacao, double distanciaPercorrida, String situacao) {
        this.idAtividadeRealizada = idAtividadeRealizada;
        this.usuario = usuario;
        this.atividade = atividade;
        this.rota = rota;
        this.dataRealizacao = dataRealizacao;
        this.distanciaPercorrida = distanciaPercorrida;
        this.situacao = situacao;
    }

    public AtividadeRealizada() {
         this.idAtividadeRealizada = 0;
        this.usuario = new Usuario();
        this.atividade = new Atividade();
        this.rota = new Rota();
        this.dataRealizacao = null;
        this.distanciaPercorrida = 0.0;
        this.situacao ="A";
    }

    public int getIdAtividadeRealizada() {
        return idAtividadeRealizada;
    }

    public void setIdAtividadeRealizada(int idAtividadeRealizada) {
        this.idAtividadeRealizada = idAtividadeRealizada;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Atividade getAtividade() {
        return atividade;
    }

    public void setAtividade(Atividade atividade) {
        this.atividade = atividade;
    }

    public Rota getRota() {
        return rota;
    }

    public void setRota(Rota rota) {
        this.rota = rota;
    }

    public LocalDate getDataRealizacao() {
        return dataRealizacao;
    }

    public void setDataRealizacao(LocalDate dataRealizacao) {
        this.dataRealizacao = dataRealizacao;
    }

    public double getDistanciaPercorrida() {
        return distanciaPercorrida;
    }

    public void setDistanciaPercorrida(double distanciaPercorrida) {
        this.distanciaPercorrida = distanciaPercorrida;
    }

    public String getSituacao() {
        return situacao;
    }

    public void setSituacao(String situacao) {
        this.situacao = situacao;
    }

   
    }

   

