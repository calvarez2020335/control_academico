/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.Horario;
import com.equipotres.models.idao.IHorarioDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Diego Enrique Hernández Cholotío <dhernandez-2020296@kinal.edu.gt>
 * @date 03-sep-2021
 * @time 14:30:40 Codigo Tecnico: IN5BV Carnet: 2020394
 */
public class HorarioDaoImpl implements IHorarioDao{
    
    private static final String SQL_SELECT = "SELECT * FROM horario";
    private static final String SQL_DELETE = "DELETE FROM horario WHERE horarioId = ?";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Horario horario = null;
    List<Horario> listarHorario = new ArrayList<>();

    
    @Override
    public List<Horario> listar() {
        try {
            
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();
            
            while (rs.next()) {                
                int horarioId = rs.getInt("horarioId");
                Time horarioFinal = rs.getTime("horarioFinal");
                Time horarioInicio = rs.getTime("horarioInicio");
                
                horario = new Horario(horarioId, horarioFinal, horarioInicio);
                listarHorario.add(horario);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e){
            e.printStackTrace();
        } finally{
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        
        return listarHorario;
        
    }

    @Override
    public Horario encontrar(Horario horario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertar(Horario horario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(Horario horario) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminar(Horario horario) {
        
        int rows = 0;
        
        try {
            
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, horario.getHorarioId());
            rows = pstmt.executeUpdate();
            
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
