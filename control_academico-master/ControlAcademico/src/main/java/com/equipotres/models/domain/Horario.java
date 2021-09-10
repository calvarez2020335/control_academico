/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.domain;

import java.sql.Time;


/**
 * 
 * @author Diego Enrique Hernández Cholotío
 * @date   29/08/2021
 * @time   22:44:27
 * Carnet: 2020394
 * Código Técnico: IN5BV
 */
public class Horario {
    //Declaración de variables
    private int horarioId;
    private Time horarioFinal;
    private Time horarioInicio;
    
    //Constructor vacio
    public Horario() {
    }
    
    //Constructor con Id
    public Horario(int horarioId) {
        this.horarioId = horarioId;
    }
    
    //Constructor con las demás variables
    public Horario(Time horarioFinal, Time horarioInicio) {
        this.horarioFinal = horarioFinal;
        this.horarioInicio = horarioInicio;
    }
    
    //Constructor con todas las variables
    public Horario(int horarioId, Time horarioFinal, Time horarioInicio) {
        this.horarioId = horarioId;
        this.horarioFinal = horarioFinal;
        this.horarioInicio = horarioInicio;
    }
    
    
    //metodos Setters & Getters
    public int getHorarioId() {
        return horarioId;
    }

    public void setHorarioId(int horarioId) {
        this.horarioId = horarioId;
    }

    public Time getHorarioFinal() {
        return horarioFinal;
    }

    public void setHorarioFinal(Time horarioFinal) {
        this.horarioFinal = horarioFinal;
    }

    public Time getHorarioInicio() {
        return horarioInicio;
    }

    public void setHorarioInicio(Time horarioInicio) {
        this.horarioInicio = horarioInicio;
    }
    
    //Método to String
    @Override
    public String toString() {
        return "Horario{" + "horarioId=" + horarioId + ", horarioFinal=" + horarioFinal + ", horarioInicio=" + horarioInicio + '}';
    }
    
    
    

}