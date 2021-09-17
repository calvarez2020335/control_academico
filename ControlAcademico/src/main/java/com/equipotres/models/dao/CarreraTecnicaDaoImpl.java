/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.CarreraTecnica;
import com.equipotres.models.idao.ICarreraTecnicaDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author esteb
 */
public class CarreraTecnicaDaoImpl implements ICarreraTecnicaDao {

    private static final String SQL_SELECT = "SELECT codigo_carrera,nombre FROM carrera_tecnica";
    private static final String SQL_DELETE = "DELETE FROM carrera_tecnica WHERE codigo_carrera = ?";
    private static final String SQL_INSERT = "INSERT INTO carrera_tecnica(codigo_carrera,nombre) VALUES (?,?)";
    private static final String SQL_SELECT_BY_ID = "SELECT * FROM carrera_tecnica WHERE codigo_carrera = ?";
    private static final String SQL_UPDATE = "UPDATE carrera_tecnica SET codigo_carrera = ?, nombre = ? WHERE codigo_carrera = ?";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    CarreraTecnica carreratecnica = null;
    List<CarreraTecnica> listaCarreraTecnica = new ArrayList<>();

    @Override
    public List<CarreraTecnica> listar() {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                String codigoCarrera = rs.getString("codigo_carrera");
                String nombre = rs.getString("nombre");

                carreratecnica = new CarreraTecnica(codigoCarrera,
                        nombre);
                listaCarreraTecnica.add(carreratecnica);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return listaCarreraTecnica;
    }

    @Override
    public CarreraTecnica encontrar(CarreraTecnica carreraTecnica) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setString(1, carreraTecnica.getCodigoCarrera());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                //String codigoCarrera = rs.getString("codigoCarrera");
                String nombre = rs.getString("nombre");

                carreraTecnica.setNombre(nombre);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(pstmt);
            Conexion.close(conn);
        }

        return carreraTecnica;
    }

    @Override
    public int insertar(CarreraTecnica carreraTecnica) {
        int row = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setString(1, carreraTecnica.getCodigoCarrera());
            pstmt.setString(2, carreraTecnica.getNombre());
            System.out.println(pstmt.toString());
            row = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return row;

    }

    @Override
    public int actualizar(CarreraTecnica carreraTecnica) {
                int row = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setString(1, carreraTecnica.getCodigoCarrera());
            pstmt.setString(2, carreraTecnica.getNombre());
            pstmt.setString(3, carreraTecnica.getCodigoCarrera());

            System.out.println(pstmt.toString());
            row = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } catch (Exception e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return row;
    }

    @Override
    public int eliminar(CarreraTecnica carreraTecnica) {

        int rows = 0;

        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setString(1, carreraTecnica.getCodigoCarrera());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(System.out);
        } finally {
            Conexion.close(pstmt);
            Conexion.close(conn);
        }
        return rows;
    }
}
