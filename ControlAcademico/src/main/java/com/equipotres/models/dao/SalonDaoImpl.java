/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.equipotres.models.dao;

import com.equipotres.db.Conexion;
import com.equipotres.models.domain.Salon;
import com.equipotres.models.idao.ISalonDao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Alan Eduardo De La Cruz Najera
 * @date 01-sep-2021
 * @time 8:50:08 Carnet:2020390 Codigo Tecnico: IN5BV
 */
public class SalonDaoImpl implements ISalonDao {

    private static final String SQL_SELECT = "SELECT salon_id ,capacidad,descripcion,nombre_salon FROM salon";
    private static final String SQL_DELETE = "DELETE FROM salon WHERE salon_id = ?";
    private static final String SQL_INSERT = "INSERT INTO salon (capacidad, descripcion, nombre_salon) VALUES(?,?,?);";
    private static final String SQL_SELECT_BY_ID = "SELECT salon_id , capacidad, descripcion, nombre_salon FROM salon WHERE salon_id = ?";
    private static final String SQL_UPDATE = "UPDATE salon SET capacidad = ?, descripcion = ?, nombre_salon = ? WHERE salon_id = ?";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    Salon salon = null;
    List<Salon> listaSalon = new ArrayList<>();

    @Override
    public List<Salon> listar() {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int salonId = rs.getInt("salon_id");
                int capacidad = rs.getInt("capacidad");
                String descripcion = rs.getString("descripcion");
                String nombreSalon = rs.getString("nombre_salon");

                salon = new Salon(salonId,
                        capacidad,
                        descripcion,
                        nombreSalon);
                listaSalon.add(salon);

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

        return listaSalon;
    }

    @Override
    public Salon encontrar(Salon salon) {
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);
            pstmt.setInt(1, salon.getSalonId());
            System.out.println(pstmt.toString());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int capacidad = rs.getInt("capacidad");
                String descripcion = rs.getString("descripcion");
                String nombreSalon = rs.getString("nombre_salon");

                salon.setCapacidad(capacidad);
                salon.setDescripcion(descripcion);
                salon.setNombreSalon(nombreSalon);

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

        return salon;
    }

    @Override
    public int insertar(Salon salon) {
        int row = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_INSERT);
            pstmt.setInt(1, salon.getCapacidad());
            pstmt.setString(2, salon.getDescripcion());
            pstmt.setString(3, salon.getNombreSalon());

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
    public int actualizar(Salon salon) {
        int row = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_UPDATE);
            pstmt.setInt(1, salon.getCapacidad());
            pstmt.setString(2, salon.getDescripcion());
            pstmt.setString(3, salon.getNombreSalon());
            pstmt.setInt(4, salon.getSalonId());

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
    public int eliminar(Salon salon) {
        int rows = 0;
        try {
            conn = Conexion.getConnection();
            pstmt = conn.prepareStatement(SQL_DELETE);
            pstmt.setInt(1, salon.getSalonId());
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
