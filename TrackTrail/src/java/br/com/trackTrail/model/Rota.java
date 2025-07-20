/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.trackTrail.model;

/**
 *
 * @author Aluno
 */
public class Rota {
    private int idRota;
    private String nome;
    private String localizacao;
    private double distancia;
    private String dificuldade;
    private double duracao;

    public Rota() {
        this.idRota =0;
        this.nome = "";
        this.localizacao ="";
        this.distancia = 0.0;
        this.dificuldade ="";
        this.duracao =0.0;
    }

    public Rota(int idRota, String nome, String localizacao, double distancia, String dificuldade, double duracao) {
        this.idRota = idRota;
        this.nome = nome;
        this.localizacao = localizacao;
        this.distancia = distancia;
        this.dificuldade = dificuldade;
        this.duracao = duracao;
    }

    public int getIdRota() {
        return idRota;
    }

    public void setIdRota(int idRota) {
        this.idRota = idRota;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLocalizacao() {
        return localizacao;
    }

    public void setLocalizacao(String localizacao) {
        this.localizacao = localizacao;
    }

    public double getDistancia() {
        return distancia;
    }

    public void setDistancia(double distancia) {
        this.distancia = distancia;
    }

    public String getDificuldade() {
        return dificuldade;
    }

    public void setDificuldade(String dificuldade) {
        this.dificuldade = dificuldade;
    }

    public double getDuracao() {
        return duracao;
    }

    public void setDuracao(double duracao) {
        this.duracao = duracao;
    }

    }

 
    
    

