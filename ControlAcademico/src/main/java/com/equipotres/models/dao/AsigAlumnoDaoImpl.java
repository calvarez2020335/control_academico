/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.equipotres.db.Conexion;
import com.equipotres.models.domain.AsignacionAlumno;
import com.equipotres.models.idao.IAsignacionAlumnoDao;
import java.sql.Timestamp;

/**
 *
 * @author Josué Daniel Marroquín Hernández <jmarroquin-2020296@kinal.edu.gt>
 * @date 01-sep-2021
 * @time 11:37:18 Codigo Tecnico: IN5BV Carnet: 2020296
 */
public class AsigAlumnoDaoImpl implements IAsignacionAlumnoDao {

    private static final String SQL_SELECT = "SELECT asignacion_id, carne, curso_id, fecha_asignacion FROM asignacion_alumno";
    private static final String SQL_DELETE = "DELETE FROM asignacion_alumno WHERE asignacion_id = ?";
    private static final String SQL_INSERT = "INSERT INTO Asignacion_Alumno (asignacion_id, carne, curso_id, fecha_asignacion) VALUES (?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT asignacion_id, carne, curso_id, fecha_asignacion FROM asignacion_alumno WHERE asignacion_id = ? ";
    private static final String SQL_UPDATE = "UPDATE asignacion_alumno SET carne = ?, curso_id = ?, fecha_asignacion = ? WHERE asignacion_id = ?";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    AsignacionAlumno asigAlumno = null;
    List<AsignacionAlumno> listaAsigAlumno = new ArrayList<>();

    @Override
    public List<AsignacionAlumno> listar() {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String asigancionId = rs.getString("asignacion_id");
                String carne = rs.getString("carne");
                int cursoId = rs.getInt("curso_id");
                Timestamp fechaAsignacion = rs.getTimestamp("fecha_asignacion");

                asigAlumno = new AsignacionAlumno(asigancionId, carne, cursoId, fechaAsignacion);
                listaAsigAlumno.add(asigAlumno);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return listaAsigAlumno;
    }

    @Override
    public AsignacionAlumno encontrar(AsignacionAlumno asigAlumno) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setString(1, asigAlumno.getAsigancionId());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {

                
                String carne = rs.getString("carne");
                int cursoId = rs.getInt("curso_id");
                Timestamp fechaAsignacion = rs.getTimestamp("fecha_asignacion");


                /*utilizar metodos Set*/
                asigAlumno.setCarne(carne);
                asigAlumno.setCursoId(cursoId);
                asigAlumno.setFechaAsignacion(fechaAsignacion);

                listaAsigAlumno.add(asigAlumno);
            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return asigAlumno;

    }

    @Override
    public int insertar(AsignacionAlumno asigAlumno) {
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setString(1, asigAlumno.getAsigancionId());
            pstmt.setString(2, asigAlumno.getCarne());
            pstmt.setInt(3, asigAlumno.getCursoId());
            pstmt.setTimestamp(4, asigAlumno.getFechaAsignacion());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return rows;
    }

    @Override
    public int actualizar(AsignacionAlumno asigAlumno) {
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, asigAlumno.getCarne());
            pstmt.setInt(2, asigAlumno.getCursoId());
            pstmt.setTimestamp(3, asigAlumno.getFechaAsignacion());
            pstmt.setString(4, asigAlumno.getAsigancionId());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception ex) {
            ex.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return rows;
    }

    @Override
    public int eliminar(AsignacionAlumno asigAlumno) {

        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setString(1, asigAlumno.getAsigancionId());
            System.out.println(pstmt.toString());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return rows;

    }

}
