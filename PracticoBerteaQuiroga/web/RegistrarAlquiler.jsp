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
    <center>
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
    </center>
    <%
        ConexionJDBC conexion = ConexionJDBC.getInstance();
        conexion.abrirConexion();
        ArrayList<Temporadas> listaTemporadas = conexion.getTemporadas();
        conexion.cerrarConexion();
        if (listaTemporadas.size() > 0) {
    %>
    <h3>Registrar alquiler:</h3>
    <form action="ResultadoRegistracionAlquiler.jsp" method="GET">
        <input type="hidden" name="idCasa" value="${param.idCasa}"/>
        <table>
            <tr>
                <td>
                    Dirección: 
                </td>
                <td>
                    <input type="text" value="${param.direccion}"/>
                </td>
            </tr>
            <tr>
                <td>
                    Precio por día:
                </td>
                <td>
                    <input type="text" name="precioPorDia" value="${param.precioPorDia}"/>
                </td>
            </tr>
            <tr>
                <td>
                    Desde:
                </td>
                <td>
                    <input type="text" id="fDesde" name="fechaDesde" value="${param.fechaDesdeAlquiler}"/>
                </td>
            </tr>
            <tr>
                <td>
                    Hasta:
                </td>
                <td>
                    <input type="text" id="fHasta" name="fechaHasta" value="${param.fechaHastaAlquiler}" />
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
                    Cantidad de personas:
                </td>
                <td>
                    <input type="text" name="cantidadPersonas" value="${param.cantidadPersonas}"/>
                </td>
            </tr>
            <tr>
                <td>
                    Temporada:
                </td>
                <td>
                    <select name="idTemporada">
                        <%
                            for (int j = 0; j < listaTemporadas.size(); j++) {
                                int idTemporada = listaTemporadas.get(j).getIdTemporada();
                                String descripcion = listaTemporadas.get(j).getDescripcion();
                        %>
                        <option value="<%= idTemporada%>"> <%= descripcion%>  </option>
                        <% }%>
                    </select>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="Registrar"/>
                </td>
            </tr>
        </table>
    </form>
    <% }%>
    <!--Muestro mensaje si no encontró la casa-->
    <%if (listaTemporadas.size() == 0) {%>
    <h2>Error al recuperar información de las temporadas.</h2>
    <%}%>
</body>
</html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        debugger;
        var fDesde =$("#fDesde").val();
        var fHasta =$("#fHasta").val();
        
        if(fDesde=="null"){
            $("#fDesde").val('');
        }

        if(fHasta=="null"){
            $("#fHasta").val('');
        }
    });
</script>
