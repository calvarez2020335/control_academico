/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.idao;

import com.equipotres.models.domain.Curso;
import java.util.List;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 */
public interface ICursoDao {
    
    public List<Curso> listar();
    
    public Curso encontrar(Curso curso);
    
    public int insertar(Curso curso);
    
    public int actualizar(Curso curso);
    
    public int eliminar(Curso curso);
    
}
