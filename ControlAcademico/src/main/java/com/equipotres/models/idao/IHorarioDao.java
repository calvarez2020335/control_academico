/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.idao;

import com.equipotres.models.domain.Horario;
import java.util.List;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 */
public interface IHorarioDao {
    
    public List<Horario> listar();
    
    public Horario encontrar(Horario horario);
    
    public int insertar(Horario horario);
    
    public int actualizar(Horario horario);
    
    public int eliminar(Horario horario);
    
}
