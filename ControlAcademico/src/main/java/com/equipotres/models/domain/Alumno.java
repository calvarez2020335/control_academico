/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.domain;

/**
 *
 * @author Cesar
 */
public class Alumno {
    
    private int id;
    private String apellidos;
    private String nombres;
    private String email;

    public Alumno() {
    }

    public Alumno(int id) {
        this.id = id;
    }

    public Alumno(String apellidos, String nombres, String email) {
        this.apellidos = apellidos;
        this.nombres = nombres;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Alumno{" + "id=" + id + ", apellidos=" + apellidos + ", nombres=" + nombres + ", email=" + email + '}';
    }


}