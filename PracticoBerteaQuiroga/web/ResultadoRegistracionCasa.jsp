<%-- 
    Document   : ResultadoRegistracionCasa
    Created on : 11/11/2014, 17:01:09
    Author     : Mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.Casa"%>
<%@page import="Controlador.ConexionJDBC"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado registración casa</title>
    </head>
    <body>
    <center>
        <hr>
        <table>
            <thead>
            <th colspan="3">Menú navegación</th>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <a href="index.html">Inicio</a>
                    </td>
                    <td>
                        <a href="ABMCasa.jsp">ABM Casas</a>
                    </td>
                    <td>
                        <a href="#">Configurar temporadas</a>
                    </td>
                </tr>
            </tbody>
        </table>
        <hr>
    </center>
    <%        
        ConexionJDBC conexion = ConexionJDBC.getInstance();
        String direccion = "";
        int cantPersonas = 0;
        int cantHabitaciones = 0;
        int cantBanios = 0;
        boolean patio = false;
        boolean cochera = false;
        float superficie = 0;
        int cantAutos = 0;
        int valoracion = 0;
        float precioPorDia = 0;
        
        
        direccion = request.getParameter("direccion");
        cantPersonas = Integer.parseInt(request.getParameter("cantPersonas"));
        cantHabitaciones = Integer.parseInt(request.getParameter("cantHabitaciones"));
        cantBanios = Integer.parseInt(request.getParameter("cantBanios"));
        if (request.getParameter("patio").compareTo("si")==0) {
            patio = true;
        }
        if (request.getParameter("cochera").compareTo("si")==0) {
            cochera = true;
        }
        superficie = Float.parseFloat(request.getParameter("cochera"));
        cantAutos = Integer.parseInt(request.getParameter("cantAutos"));
        valoracion = Integer.parseInt(request.getParameter("valoracion"));
        precioPorDia = Float.parseFloat(request.getParameter("precioPorDia"));
        
        
        Casa c = new Casa();
        c.setDireccion(direccion);
        c.setCantPersonas(cantPersonas);
        c.setCantAutos(cantAutos);
        c.setCantBanios(cantBanios);
        c.setCantHabitaciones(cantHabitaciones);
        c.setPatio(patio);
        c.setCochera(cochera);
        c.setSuperficie(superficie);
        c.setValoracion(valoracion);
        c.setPrecioPorDia(precioPorDia);
        
        conexion.abrirConexion();
        Casa result=conexion.RegistrarCasa(c);
        conexion.cerrarConexion();
        
        if(result!=null){
        %>
        <h3>Casa registrada exitosamente</h3>
        <%}%>
        
        <%if(result==null){%>
        <h3>Error al intentar registrar casa</h3>
        <%}%>
</center>
<hr>
</body>
</html>
