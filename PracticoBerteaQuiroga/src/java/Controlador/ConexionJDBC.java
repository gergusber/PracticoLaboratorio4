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

    public ArrayList<Casa> getCasasByFilter(Date fechaDesde, Date fechaHasta) {
        ArrayList<Casa> lista = new ArrayList<Casa>();
        Casa casa;
        String query;

        if (fechaDesde != null && fechaHasta != null) {
            DateFormat sourceFormat = new SimpleDateFormat("yyyyMMdd");
            query = "select * from Casas c join Alquileres a on c.idCasa = a.idCasa where a.fechaHasta NOT BETWEEN '" + sourceFormat.format(fechaDesde) + "' and '" + sourceFormat.format(fechaHasta) + "' AND a.fechaDesde NOT BETWEEN '" + sourceFormat.format(fechaDesde) + "' and '" + sourceFormat.format(fechaHasta) + "'";
        } else {
            query = "select distinct * from Casas c  left join Alquileres a on c.idCasa = a.idCasa where a.fechaHasta is null and a.fechaHasta is null or a.fechaHasta<GETDATE()";
        }

        try {
            st = con.createStatement();
            rs = st.executeQuery(query);
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
        String query = "select descripcion,idTemporada from Temporadas";
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                t = new Temporadas();
                t.setDescripcion(rs.getString("descripcion"));
                t.setIdTemporada(rs.getInt("idTemporada"));
                lista.add(t);
            }
        } catch (Exception e) {
        }
        return lista;
    }

    public Temporadas getTemporadaById(int idTemporada) {
        Temporadas t = null;
        String query = "select descripcion,idTemporada from Temporadas where idTemporada =" + idTemporada;
        try {
            st = con.createStatement();
            rs = st.executeQuery(query);

            while (rs.next()) {
                t = new Temporadas();
                t.setDescripcion(rs.getString("descripcion"));
                t.setIdTemporada(rs.getInt("idTemporada"));
                t.setPorcentaje(rs.getFloat("porcentaje"));
                break;
            }
        } catch (Exception e) {
        }
        return t;
    }

    public Alquileres RegistrarAlquiler(Alquileres a) {

        Alquileres result = null;
        Temporadas t = getTemporadaById(a.getIdTemporada());
        DateFormat sourceFormat = new SimpleDateFormat("yyyyMMdd");

        if (t != null) {
            float precioDiaTemporada = a.getPrecioPorDia() * ((t.getPorcentaje() / 100) + 1);
            float precioReal = (precioDiaTemporada * a.getCantidadDias());
            a.setPrecioReal(precioReal);
            String query = "insert into Alquileres(idCasa,idTemporada,fechaDesde,fechaHasta,cantidadPersonas,cantidadDias,precioPorDia,precioReal) ";
            query += "values(" + a.getIdCasa() + "," + a.getIdTemporada() + ",'" + sourceFormat.format(a.getFechaDesde()) + "','" + sourceFormat.format(a.getFechaHasta()) + "'," + a.getCantidadPersonas() + "," + a.getCantidadDias() + "," + a.getPrecioPorDia() + "," + a.getPrecioReal() + ")";

            try {
                st = con.createStatement();
                PreparedStatement ps = con.prepareStatement(query);
                ps.executeUpdate();
                result = a;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public Casa RegistrarCasa(Casa c) {

        Casa result = null;
        if (c != null) {
            String query = "insert into Casas(idCasa,cantPersonas,cantHabitaciones,cantBanios,patio,cochera,superficie,cantAutos,valoracion,precioPorDia,direccion) ";
            query += "values("+ c.getCantPersonas() + "," + c.getCantHabitaciones() + "," + c.getCantBanios() + "," + c.isPatio() + "," + c.isCochera() + "," + c.getSuperficie() + "," + c.getCantAutos() + "," + c.getValoracion() + "," + c.getPrecioPorDia() + "," + c.getDireccion() + ")";

            try {
                st = con.createStatement();
                PreparedStatement ps = con.prepareStatement(query);
                ps.executeUpdate();
                result = c;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return result;
    }
}
