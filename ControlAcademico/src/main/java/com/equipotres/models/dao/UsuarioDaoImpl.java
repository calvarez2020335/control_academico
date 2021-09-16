/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.Usuario;
import com.equipotres.models.idao.IValidarDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 * @date 16/09/2021
 * @time 08:20:54 AM Codigo tecnico: IN5BV
 */
public class UsuarioDaoImpl implements IValidarDao {

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    

    private static final String SQL = "Select * from Usuario where user = ? and pass = ?";

    @Override
    public int validar(Usuario us) {

        try {
            int r = 0;
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, us.getUser());
            pstmt.setString(2, us.getPass());
            rs = pstmt.executeQuery();
            while(rs.next()){
                r=r+1;
                us.setUser(rs.getString("user"));
                us.setPass(rs.getString("pass"));
            }
            if(r==1){
                return 1;
            }else{
                return 0;
            }
        } catch (Exception e) {
            return 0;
        }
        
    }

}
