/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

/**
 *
 * @author Mauri
 */
import java.sql.*;

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
    
}

