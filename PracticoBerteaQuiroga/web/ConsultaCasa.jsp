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
        %>
        <h3>Detalles:</h3>
        <form method="POST" action="">
            <input type="hidden" value="<%= idCasa%>" name="idCasa"/>
            <input type="hidden" value="<%= idCasa%>" name="fechaDesdeAlquiler"/>
            <input type="hidden" value="<%= idCasa%>" name="fechaDesdefechaDesdeAlquiler"/>
            <table>
                <tr>
                    <td>Cantidad de personas:</td>
                    <td><%= cantPersonas%></td>
                </tr>
                <tr>
                    <td>Cantidad de habitaciones:</td>
                    <td><%= cantHabitaciones%></td>
                </tr>
                <tr>
                    <td>Cantidad de baños:</td>
                    <td><%= cantBanios%></td>
                </tr>
                <tr>
                    <td>Patio:</td>
                    <td>
                        <%if (patio) {%>Si<% }%>
                        <%if (!patio) {%>No<% }%>
                    </td>
                </tr>
                <tr>
                    <td>Cochera:</td>
                    <td>
                        <%if (cochera) {%>Si<% }%>
                        <%if (!cochera) {%>No<% }%>
                    </td>
                </tr>
                <tr>
                    <td>Cantidad de autos:</td>
                    <td><%= cantAutos%></td>
                </tr>
                <tr>
                    <td>Superficie</td>
                    <td><%= superficie%></td>
                </tr>
                <tr>
                    <td>Precio por día:</td>
                    <td><%= precioPorDia%></td>
                </tr>
                <tr>
                    <td>Valoración:</td>
                    <td><%= valoracion%></td>
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
        <%else {%>
        <h2>No se encontró información de la casa seleccionada</h2>
        <%}%>


    </body>
</html>