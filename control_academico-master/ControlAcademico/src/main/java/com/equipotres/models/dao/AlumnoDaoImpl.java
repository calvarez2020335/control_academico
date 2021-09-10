/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.Alumno;
import com.equipotres.models.idao.IAlumnoDao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 * @date 2/09/2021
 * @time 08:34:25 AM
 * Codigo tecnico: IN5BV
 */
public class AlumnoDaoImpl implements IAlumnoDao{
    
    private static String SQL_SELECT = "SELECT * FROM alumno";
    private static String SQL_DELETE = "DELETE FROM alumno WHERE carne = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Alumno alumno = null;
    List<Alumno> listarAlumno = new ArrayList<>();
    
    @Override
    public List<Alumno> listar() {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                String carne = rs.getString("carne");
                String apellidos = rs.getString("apellidos");
                String nombres = rs.getString("nombres");
                String email = rs.getString("email");
                
                alumno = new Alumno(carne, apellidos, nombres, email);
                listarAlumno.add(alumno);
                
            }
            
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e){
            e.printStackTrace(System.out);
        } finally{
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        
        return listarAlumno;
    }

    @Override
    public Alumno encontrar(Alumno alumno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertar(Alumno alumno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(Alumno alumno) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminar(Alumno alumno) {
        int rows = 0;
        
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setString(1, alumno.getCarne());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        } finally{
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        
        return rows;
        
    }

}
