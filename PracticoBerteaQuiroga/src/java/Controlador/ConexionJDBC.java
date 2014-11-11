/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author Mauri
 */
import Model.*;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ConexionJDBC {

    private Connection con;
    private Statement st;
    private ResultSet rs;
    private static ConexionJDBC instancia;

    private ConexionJDBC() {
    }

    //Singleton
    public static ConexionJDBC getInstance() {
        if (instancia == null) {
            instancia = new ConexionJDBC();
        }
        return instancia;
    }

    public void abrirConexion() {
        try {
            String url = "jdbc:sqlserver://MAURI-PC;databaseName=PracticoBerteaQuiroga;user=sa;password=20339762527";
            //String url = "jdbc:sqlserver://German-PC;databaseName=PracticoBerteaQuiroga;user=sa;password=123456";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            con = DriverManager.getConnection(url);
            System.out.println("Conexión a la BD");
        } catch (Exception e) {
            System.out.println("Error en conexión: " + e.getMessage());
        }
    }

    public void cerrarConexion() {
        try {
            con.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar conexión: " + e.getMessage());
        }
    }

    public ArrayList<Casa> getCasasByFilter(Date fechaDesde, Date fechaHasta) {
        ArrayList<Casa> lista = new ArrayList<Casa>();
        Casa casa;

        DateFormat sourceFormat = new SimpleDateFormat("yyyyMMdd");

        String url = "select * from Casas c join Alquileres a on c.idCasa = a.idCasa where a.fechaHasta NOT BETWEEN '" + sourceFormat.format(fechaDesde) + "' and '" + sourceFormat.format(fechaHasta) + "' AND a.fechaDesde NOT BETWEEN '" + sourceFormat.format(fechaDesde) + "' and '" + sourceFormat.format(fechaHasta) + "'";
        String url2 = "select * from Casas c join Alquileres a on c.idCasa = a.idCasa where a.fechaHasta  NOT BETWEEN '10/18/1992' and '10/01/1993' AND a.fechaDesde NOT BETWEEN '10/01/1992' and '10/01/1993'";
        try {
            st = con.createStatement();
            rs = st.executeQuery(url);
            if (rs != null) {
                while (rs.next()) {
                    casa = new Casa();
                    casa.setIdCasa(rs.getInt("idCasa"));
                    casa.setCantHabitaciones(rs.getInt("cantHabitaciones"));
                    casa.setCantPersonas(rs.getInt("cantPersonas"));
                    casa.setCantAutos(rs.getInt("cantAutos"));
                    casa.setValoracion(rs.getInt("valoracion"));
                    casa.setPatio(rs.getBoolean("patio"));
                    casa.setCochera(rs.getBoolean("cochera"));
                    casa.setPrecioPorDia(rs.getFloat("precioPorDia"));
                    casa.setSuperficie(rs.getFloat("superficie"));
                    lista.add(casa);
                }
                return lista;
            }
        } catch (Exception E) {
            E.printStackTrace();
        }
        return lista;
    }

    public Casa getCasaById(int idCasa) {
        Casa c = null;
        String query = "select * from Casas c where c.idCasa=" + idCasa;
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
            if (rs != null) {
                while (rs.next()) {
                    c = new Casa();
                    c.setIdCasa(rs.getInt("idCasa"));
                    c.setCantPersonas(rs.getInt("cantPersonas"));
                    c.setCantHabitaciones(rs.getInt("cantHabitaciones"));
                    c.setCantBanios(rs.getInt("cantBanios"));
                    c.setPatio(rs.getBoolean("patio"));
                    c.setCochera(rs.getBoolean("cochera"));
                    c.setSuperficie(rs.getFloat("superficie"));
                    c.setCantAutos(rs.getInt("cantAutos"));
                    c.setValoracion(rs.getInt("valoracion"));
                    c.setPrecioPorDia(rs.getFloat("precioPorDia"));
                    c.setDireccion(rs.getString("direccion"));
                    break;
                }
                return c;
            }
        } catch (Exception e) {
        }
        return c;
    }

    public ArrayList<Temporadas> getTemporadas() {
        ArrayList<Temporadas> lista = new ArrayList<>();
        Temporadas t;
        String query = "select * from Temporadas";
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                t = new Temporadas();
                t.setDescripcion(rs.getString("descripcion"));
                t.setIdTemporada(rs.getInt("idTemporada"));
                t.setPorcentaje(rs.getFloat("porcentaje"));
                lista.add(t);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public ArrayList<Casa> GetAllCasas() {
        ArrayList<Casa> List = new ArrayList();
        String sql = "select * from Casas";
        Casa c;
        try {
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs != null) {
                while (rs.next()) {
                    c = new Casa();
                    c.setIdCasa(rs.getInt("idCasa"));
                    c.setCantPersonas(rs.getInt("cantPersonas"));
                    c.setCantHabitaciones(rs.getInt("cantHabitaciones"));
                    c.setCantBanios(rs.getInt("cantBanios"));
                    c.setPatio(rs.getBoolean("patio"));
                    c.setCochera(rs.getBoolean("cochera"));
                    c.setSuperficie(rs.getFloat("superficie"));
                    c.setCantAutos(rs.getInt("cantAutos"));
                    c.setValoracion(rs.getInt("valoracion"));
                    c.setPrecioPorDia(rs.getFloat("precioPorDia"));
                    c.setDireccion(rs.getString("direccion"));
                    List.add(c);
                }
            }
        } catch (Exception e) {
        }
        return List;
    }

}
