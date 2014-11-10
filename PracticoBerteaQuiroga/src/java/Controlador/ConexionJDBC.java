/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author Mauri
 */
import Model.Casa;
import java.sql.*;
import java.util.ArrayList;

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
    
        public String todas() //PUNTO 2
    {
        rs=null;
        try
        {
            st=con.createStatement();
            rs=st.executeQuery("select * from dbo.Casas");
            return "Consulta exitosa";
        }
        catch(Exception E)
        {
            return E.getMessage();
        }
        
        
    }
          public ArrayList<Casa> getCasasByFilter(Date fechaDesde, Date fechaHasta)
        {
            ArrayList<Casa> lista = new ArrayList<Casa>();
            Casa casa;
           
            rs = null; 
            try {
                st = con.createStatement();
                rs = st.executeQuery("select * from Casa c innerjoin Alquileres a on c.idCasa = a.idCasa where a.fechaHasta NOT BETWEEN "+fechaDesde +" and "+fechaHasta );
           if(rs != null){
               while(rs.next()){
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
            }
            catch(Exception E)
            {
                E.printStackTrace();
            }
         return lista;
        }
    
}

