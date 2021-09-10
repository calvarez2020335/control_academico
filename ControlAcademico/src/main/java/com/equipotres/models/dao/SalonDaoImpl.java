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

    private static String SQL_SELECT = "SELECT salon_id ,capacidad,descripcion,nombre_salon FROM salon";
    private static String SQL_DELETE = "DELETE FROM salon WHERE salon_id = ?";

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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int insertar(Salon salon) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int actualizar(Salon salon) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
        } finally{
        Conexion.close(pstmt);
        Conexion.close(conn);
        }
        return rows;
    }

}
