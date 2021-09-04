/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.domain;


/**
 *
 * @author PANQUESITO
 */
public class Curso {
    private int curso_id;
    private int ciclo;
    private int cupo_maximo;
    private int cupo_minimo;
    private String descripcion;
    private String codigo_carrera;
    private int horario_id;
    private int instructor_id;
    private int salon_id;

    public Curso() {
    }

    public Curso(int curso_id) {
        this.curso_id = curso_id;
    }
    
    public Curso(int ciclo, int cupo_maximo, int cupo_minimo, String descripcion, String codigo_carrera, int horario_id, int instructor_id, int salon_id) {
        this.ciclo = ciclo;
        this.cupo_maximo = cupo_maximo;
        this.cupo_minimo = cupo_minimo;
        this.descripcion = descripcion;
        this.codigo_carrera = codigo_carrera;
        this.horario_id = horario_id;
        this.instructor_id = instructor_id;
        this.salon_id = salon_id;
    }

    public Curso(int curso_id, int ciclo, int cupo_maximo, int cupo_minimo, String descripcion, String codigo_carrera, int horario_id, int instructor_id, int salon_id) {
        this.curso_id = curso_id;
        this.ciclo = ciclo;
        this.cupo_maximo = cupo_maximo;
        this.cupo_minimo = cupo_minimo;
        this.descripcion = descripcion;
        this.codigo_carrera = codigo_carrera;
        this.horario_id = horario_id;
        this.instructor_id = instructor_id;
        this.salon_id = salon_id;
    }

    public int getCurso_id() {
        return curso_id;
    }

    public void setCurso_id(int curso_id) {
        this.curso_id = curso_id;
    }

    public int getCiclo() {
        return ciclo;
    }

    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }

    public int getCupo_maximo() {
        return cupo_maximo;
    }

    public void setCupo_maximo(int cupo_maximo) {
        this.cupo_maximo = cupo_maximo;
    }

    public int getCupo_minimo() {
        return cupo_minimo;
    }

    public void setCupo_minimo(int cupo_minimo) {
        this.cupo_minimo = cupo_minimo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCodigo_carrera() {
        return codigo_carrera;
    }

    public void setCodigo_carrera(String codigo_carrera) {
        this.codigo_carrera = codigo_carrera;
    }

    public int getHorario_id() {
        return horario_id;
    }

    public void setHorario_id(int horario_id) {
        this.horario_id = horario_id;
    }

    public int getInstructor_id() {
        return instructor_id;
    }

    public void setInstructor_id(int instructor_id) {
        this.instructor_id = instructor_id;
    }

    public int getSalon_id() {
        return salon_id;
    }

    public void setSalon_id(int salon_id) {
        this.salon_id = salon_id;
    }

    @Override
    public String toString() {
        return "Curso{" + "curso_id=" + curso_id + ", ciclo=" + ciclo + ", cupo_maximo=" + cupo_maximo + ", cupo_minimo=" + cupo_minimo + ", descripcion=" + descripcion + ", codigo_carrera=" + codigo_carrera + ", horario_id=" + horario_id + ", instructor_id=" + instructor_id + ", salon_id=" + salon_id + '}';
    }

    

}
