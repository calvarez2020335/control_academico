/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.domain;

/**
 *
 * @author carlos
 */
public class Instructor {
    private int instructor_id;
    private String apellidos;
    private String nombres;
    private String direccion;
    private String telefono;

    public Instructor() {
    }

    
    
    public Instructor(int instructor_id) {
        this.instructor_id = instructor_id;
    }

    public Instructor(String apellidos, String nombres, String direccion, String telefono) {
        this.apellidos = apellidos;
        this.nombres = nombres;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public Instructor(int instructor_id, String apellidos, String nombres, String direccion, String telefono) {
        this.instructor_id = instructor_id;
        this.apellidos = apellidos;
        this.nombres = nombres;
        this.direccion = direccion;
        this.telefono = telefono;
    }

    public int getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(int instructor_id) {
        this.instructor_id = instructor_id;
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

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        return "Instructor{" + "instructor_id=" + instructor_id + ", apellidos=" + apellidos + ", nombres=" + nombres + ", direccion=" + direccion + ", telefono=" + telefono + '}';
    }  
}
