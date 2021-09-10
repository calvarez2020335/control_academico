/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.domain;

import java.sql.Timestamp;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 28-ago-2021
 * @time 14:26:20 Codigo Tecnico: IN5BV Carnet: 2020296
 */
public class AsignacionAlumno {

    /*Declacracion de Variables*/
    private String asigancionId;
    private String carne;
    private int cursoId;
    private Timestamp fechaAsignacion;

    /*Constructor Vacio o Nulo*/
    public AsignacionAlumno() {
    }

    /*Constructor de Id*/
    public AsignacionAlumno(String asigancionId) {
        this.asigancionId = asigancionId;
    }

    /*Contructor de las demas variables*/
    public AsignacionAlumno(String carne, int cursoId, Timestamp fechaAsignacion) {
        this.carne = carne;
        this.cursoId = cursoId;
        this.fechaAsignacion = fechaAsignacion;
    }
    

    /*Contructor de Todas las Variables*/
    public AsignacionAlumno(String asigancionId, String carne, int cursoId, Timestamp fechaAsignacion) {    
        this.asigancionId = asigancionId;
        this.carne = carne;
        this.cursoId = cursoId;
        this.fechaAsignacion = fechaAsignacion;
    }

    /*Metodos GET y SET*/
    public String getAsigancionId() {
        return asigancionId;
    }

    public void setAsigancionId(String asigancionId) {
        this.asigancionId = asigancionId;
    }

    public String getCarne() {
        return carne;
    }

    public void setCarne(String carne) {
        this.carne = carne;
    }

    public int getCursoId() {
        return cursoId;
    }

    public void setCursoId(int cursoId) {
        this.cursoId = cursoId;
    }

    public Timestamp getFechaAsignacion() {
        return fechaAsignacion;
    }

    public void setFechaAsignacion(Timestamp fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }

    /*Metodo toString*/
    @Override
    public String toString() {
        return "AsignacionAlumno{" + "asigancionId=" + asigancionId + ", carne=" + carne + ", cursoId=" + cursoId + ", fechaAsignacion=" + fechaAsignacion + '}';
    }
    
    

}
