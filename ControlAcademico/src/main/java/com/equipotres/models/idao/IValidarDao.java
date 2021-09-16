/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.idao;

import com.equipotres.models.domain.Usuario;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 */
public interface IValidarDao {
    
    public int validar(Usuario us);
    
}
