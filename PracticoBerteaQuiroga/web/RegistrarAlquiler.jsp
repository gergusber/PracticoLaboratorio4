<%-- 
    Document   : RegistrarAlquiler
    Created on : 10/11/2014, 01:13:28
    Author     : Mauri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Controlador.ConexionJDBC" %>
<%@ page import="Model.Temporadas" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar alquiler</title>
    </head>
    <body>
        <%
            ConexionJDBC conexion = ConexionJDBC.getInstance();
            conexion.abrirConexion();
            ArrayList<Temporadas> listaTemporadas = conexion.getTemporadas();
            conexion.cerrarConexion();
            if(listaTemporadas.size()>0)
            {
        %>
        <h3>Registrar alquiler:</h3>
        <form action="ResultadoRegistracion.jsp">
            <input type="hidden" name="idCasa" value="${param.idCasa}"/>
            <table>
                <tr>
                    <td>
                        Dirección: 
                    </td>
                    <td>
                        ${param.direccion}
                    </td>
                </tr>
                <tr>
                    <td>
                        Precio por día:
                    </td>
                    <td>
                        ${param.precioPorDia}
                    </td>
                </tr>
                <tr>
                    <td>
                        Desde:
                    </td>
                    <td>
                        <input type="text" name="fechaDesde" value="${param.fechaDesdeAlquiler}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Hasta:
                    </td>
                    <td>
                        <input type="text" name="fechaHasta" value="${param.fechaHastaAlquiler}"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Cantidad de días:
                    </td>
                    <td>
                        <input type="text" name="cantidadDias"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Temporada:
                    </td>
                    <td>
                        <select name="temporada">
                           <%
                              for(int j=0; j<listaTemporadas.size();j++)
                              {
                                  int idTemporada = listaTemporadas.get(j).getIdTemporada();
                                  String descripcion = listaTemporadas.get(j).getDescripcion();
                           %>
                           <option value="<%= idTemporada%>"> <%= descripcion%>  </option>
                          <% } %>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
        <% } %>
        <!--Muestro mensaje si no encontró la casa-->
        <%if(listaTemporadas.size()==0){%>
        <h2>Error al recuperar información de las temporadas.</h2>
        <%}%>
    </body>
</html>
