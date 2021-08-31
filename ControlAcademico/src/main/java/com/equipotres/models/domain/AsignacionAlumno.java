/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.domain;

import java.sql.Date;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 28-ago-2021
 * @time 14:26:20
 * Codigo Tecnico: IN5BV
 * Carnet: 2020296
 */
public class AsignacionAlumno {
    
    /*Declacracion de Variables*/
    private int asigancionId;
    private String carne;
    private int cursoId;
    private Date fechaAsignacion;
    
    
    /*Constructor Vacio o Nulo*/
    public AsignacionAlumno() {
    }
    
    /*Constructor de Id*/
    public AsignacionAlumno(int asigancionId) {
        this.asigancionId = asigancionId;
    }
    
    /*Contructor de las demas variables*/
    public AsignacionAlumno(String carne, int cursoId, Date fechaAsignacion) {
        this.carne = carne;
        this.cursoId = cursoId;
        this.fechaAsignacion = fechaAsignacion;
    }
    
    /*Contructor de Todas las Variables*/
    public AsignacionAlumno(int asigancionId, String carne, int cursoId, Date fechaAsignacion) {
        this.asigancionId = asigancionId;
        this.carne = carne;
        this.cursoId = cursoId;
        this.fechaAsignacion = fechaAsignacion;
    }
    
    /*Metodos GET y SET*/
    public int getAsigancionId() {
        return asigancionId;
    }

    public void setAsigancionId(int asigancionId) {
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

    public Date getFechaAsignacion() {
        return fechaAsignacion;
    }

    public void setFechaAsignacion(Date fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }
    
    /*Metodo toString*/
    @Override
    public String toString() {
        return "asignacionAlumno{" + "asigancionId=" + asigancionId + ", carne=" + carne + ", cursoId=" + cursoId + ", fechaAsignacion=" + fechaAsignacion + '}';
    }
    

}