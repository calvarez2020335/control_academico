/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.Curso;
import com.equipotres.models.idao.ICursoDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Carlos Adolfo Alvarez Crúz
 * @date 3/09/2021
 * @time 01:10:36 PM
 * Codigo tecnico: IN5BV
 */
public class CursoDaoImpl implements ICursoDao{

    private static final String SQL_SELECT = "SELECT * FROM curso";
    private static final String SQL_DELETE = "DELETE FROM curso WHERE curso_id = ?";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Curso curso = null;
    List<Curso> listaCurso = new ArrayList<>();
    
    @Override
    public List<Curso> listar() {
        try {
            
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                int curso_id = rs.getInt("curso_id");
                int ciclo = rs.getInt("ciclo");
                int cupo_maximo = rs.getInt("cupo_maximo");
                int cupo_minimo = rs.getInt("cupo_minimo");
                String descripcion = rs.getString("descripcion");
                String codigo_carrera = rs.getString("codigo_carrera");
                int horario_id = rs.getInt("horario_id");
                int instructor_id = rs.getInt("instructor_id");
                int salon_id = rs.getInt("salon_id");
                
                curso = new Curso(curso_id, ciclo, cupo_maximo, cupo_minimo, descripcion, codigo_carrera, horario_id, instructor_id, salon_id);
                listaCurso.add(curso);
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
        
        return listaCurso;
        
    }

    @Override
    public Curso encontrar(Curso curso) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertar(Curso curso) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(Curso curso) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int eliminar(Curso curso) {
        int rows = 0;
        
        try {
            
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, curso.getCurso_id());
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
