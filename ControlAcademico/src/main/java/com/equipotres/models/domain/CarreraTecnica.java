/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.domain;

/**
 *
 * @author Erwin Esteban Vicente Hernandez
 */

public class CarreraTecnica {
    private String codigo_carrera;
    private String nombre;

    public CarreraTecnica() {
    }

    public CarreraTecnica(String codigo_carrera, String nombre) {
        this.codigo_carrera = codigo_carrera;
        this.nombre = nombre;
    }

    public String getCodigo_carrera() {
        return codigo_carrera;
    }

    public void setCodigo_carrera(String codigo_carrera) {
        this.codigo_carrera = codigo_carrera;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    
    @Override
    public String toString() {
        return "CarreraTecnica{" + "codigo_carrera=" + codigo_carrera + ", nombre=" + nombre + '}';
    }
    
    
}