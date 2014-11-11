<%-- 
    Document   : ConsultaCasa
    Created on : 09/11/2014, 21:14:57
    Author     : Mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Controlador.ConexionJDBC" %>
<%@ page import="Model.Casa" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles de la casa seleccionada</title>
    </head>
    <body>
        <% ConexionJDBC conexion = ConexionJDBC.getInstance();
            conexion.abrirConexion();
            int idCasa = Integer.parseInt(request.getParameter("idCasa"));
            String fechaDesdeAlquiler = request.getParameter("fechaDesdeAlquiler");
            String fechaHastaAlquiler = request.getParameter("fechaHastaAlquiler");
            Casa c = conexion.getCasaById(idCasa);
            conexion.cerrarConexion();
            if (c != null) {
                int cantHabitaciones = c.getCantHabitaciones();
                int cantPersonas = c.getCantPersonas();
                int cantBanios = c.getCantBanios();
                int cantAutos = c.getCantAutos();
                int valoracion = c.getValoracion();
                float precioPorDia = c.getPrecioPorDia();
                float superficie = c.getSuperficie();
                boolean patio = c.isPatio();
                boolean cochera = c.isCochera();
                String direccion = c.getDireccion();
        %>
        <h3>Detalles:</h3>
        <form method="GET" action="RegistrarAlquiler.jsp">
            <input type="hidden" value="<%= idCasa%>" name="idCasa"/>
            <input type="hidden" value="<%= fechaDesdeAlquiler%>" name="fechaDesdeAlquiler"/>
            <input type="hidden" value="<%= fechaHastaAlquiler%>" name="fechaHastaAlquiler"/>
            <table>
                <tr>
                    <td>Dirección:</td>
                    <td><input type="text" name="direccion" value="<%= direccion%>"/></td>
                </tr>
                <tr>
                    <td>Cantidad de personas:</td>
                    <td><input type="text" name="cantidadPersonas" value="<%= cantPersonas%>"/></td>
                </tr>
                <tr>
                    <td>Cantidad de habitaciones:</td>
                    <td><input type="text" value="<%= cantHabitaciones%>" /></td>
                </tr>
                <tr>
                    <td>Cantidad de baños:</td>
                    <td><input type="text" value="<%= cantBanios%>" /></td>
                </tr>
                <tr>
                    <td>Patio:</td>
                    <td>
                        <%if (patio) {%><input type="text" value="Si" /><% }%>
                        <%if (!patio) {%><input type="text" value="No" /><% }%>
                    </td>
                </tr>
                <tr>
                    <td>Cochera:</td>
                    <td>
                        <%if (cochera) {%><input type="text" value="Si" /><% }%>
                        <%if (!cochera) {%><input type="text" value="No" /><% }%>
                    </td>
                </tr>
                <%if (cochera) {%>
                <tr>
                    <td>Cantidad de autos:</td>
                    <td><input type="text" value="<%= cantAutos%>" /></td>
                </tr>
                <% }%>
                <tr>
                    <td>Superficie</td>
                    <td><input type="text" value="<%= superficie%> m2" /></td>
                </tr>
                <tr>
                    <td>Precio por día:</td>
                    <td>$<input type="text" name="precioPorDia" value="<%= precioPorDia%>"/></td>
                </tr>
                <tr>
                    <td>Valoración:</td>
                    <td><input type="text" value="<%= valoracion%>" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Alquilar"/>
                    </td>
                </tr>
            </table>
        </form>
        <% }%>

        <!--Muestro mensaje si no encontró la casa-->
        <%if(c==null){%>
        <h2>No se encontró información de la casa seleccionada</h2>
        <%}%>
    </body>
</html>
