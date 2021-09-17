/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.Instructor;
import com.equipotres.models.idao.IInstructorDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author carlos
 */
public class InstructorDaoImpl implements IInstructorDao {

    private static final String SQL_SELECT = "SELECT instructor_id, apellidos, nombres, direccion,telefono FROM instructor";
    private static final String SQL_DELETE = "DELETE FROM instructor WHERE instructor_id = ?";
    private static final String SQL_INSERT = "INSERT INTO instructor(apellidos, nombres, direccion, telefono) VALUES (?, ?, ?, ?)";
    private static final String SQL_SELECT_BY_ID = "SELECT instructor_id, apellidos, nombres, direccion, telefono FROM instructor WHERE instructor_id = ?";
    private static final String SQL_UPDATE = "UPDATE instructor SET apellidos = ?, nombres = ?, direccion = ?, telefono = ? WHERE instructor_id = ? ";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Instructor instructor = null;
    List<Instructor> listaInstructor = new ArrayList<>();

    @Override
    public List<Instructor> listar() {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int idinstructor = rs.getInt("instructor_id");
                String nombre = rs.getString("apellidos");
                String apellido = rs.getString("nombres");
                String direccion = rs.getString("direccion");
                String telefono = rs.getString("telefono");

                instructor = new Instructor(idinstructor, apellido, nombre, direccion, telefono);
                listaInstructor.add(instructor);

            }
        } catch (SQLException e) {
            e.printStackTrace(System.out);

        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return listaInstructor;
    }

    @Override
    public Instructor encontrar(Instructor instructor) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, instructor.getInstructor_id());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {

                String apellidos = rs.getString("apellidos");
                String nombres = rs.getString("nombres");
                String direccion = rs.getString("direccion");
                String telefono = rs.getString("telefono");

                instructor.setApellidos(apellidos);
                instructor.setNombres(nombres);
                instructor.setDireccion(direccion);
                instructor.setTelefono(telefono);

                listaInstructor.add(instructor);
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
        return instructor;
    }

    @Override
    public int Insertar(Instructor instructor) {
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setString(1, instructor.getApellidos());
            pstmt.setString(2, instructor.getNombres());
            pstmt.setString(3, instructor.getDireccion());
            pstmt.setString(4, instructor.getTelefono());
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
    public int Actualizar(Instructor instructor) {
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, instructor.getApellidos());
            pstmt.setString(2, instructor.getNombres());
            pstmt.setString(3, instructor.getDireccion());
            pstmt.setString(4, instructor.getTelefono());
            pstmt.setInt(5, instructor.getInstructor_id());
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
    public int Eliminar(Instructor instructor) {
        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, instructor.getInstructor_id());
            System.out.println(pstmt.toString());
            rows = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return rows;
    }
}
