/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.idao;

import com.equipotres.models.domain.AsignacionAlumno;
import java.util.List;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 */
public interface IAsignacionAlumnoDao {
    
    public List<AsignacionAlumno> listar();
    
    public AsignacionAlumno encontrar(AsignacionAlumno asignacionAlumno);
    
    public int insertar(AsignacionAlumno asignacionAlumno);
    
    public int actualizar(AsignacionAlumno asignacionAlumno);
    
    public int eliminar(AsignacionAlumno asignacionAlumno);
    
}
