<%-- 
    Document   : ABMCasa
    Created on : 10-nov-2014, 21:30:13
    Author     : German
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>

<%@page import="java.util.ArrayList"%>
<%@ page import="Controlador.ConexionJDBC" %>
<%@ page import="Model.Casa" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM Casa</title>
    </head>
    <body>
        <hr
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
    <hr
    <center>
        <h1>Abm Casas</h1>


        <% ConexionJDBC conexion = ConexionJDBC.getInstance();
            conexion.abrirConexion();
            ArrayList<Casa> Casas = conexion.GetAllCasas();
            request.setAttribute("Casas", Casas);
            request.setAttribute("", Casas);
            conexion.cerrarConexion();
        %>
        <c:if test="${ not empty Casas}">
            
            <table border="1">
                <tr>
                    <td>Dirección:</td>
                    <td>Cantidad de personas:</td>
                    <td>Cantidad de habitaciones:</td>
                    <td>Cantidad de baños:</td>
                    <td>Patio:</td>
                    <td>Cochera:</td>
                    <td>Superficie:</td>
                    <td>Cantidad de Autos:</td>
                    <td>Valoracion:</td>
                    <td>Precio Por Dia:</td>
                    <td>Acciones:</td>
                </tr>
                <c:forEach var="item" items="${Casas}">   
                    <form method="GET" action="AltaModificacionCasa.jsp">
                        <input type="hidden" class="Accion" name="Accion" >
                        <input type="hidden" id="idCasa" value="${item.idCasa}" name="idCasa">
                        <tr>
                            <td style="text-align: center"><input type="text" value="${item.direccion}" name="direccion"><p></td>

                            <td style="text-align: center"> <input type="text" value="${item.cantPersonas}" name="cantPersonas"><p></td>

                            <td style="text-align: center"> <input type="text" value="${item.cantHabitaciones}" name="cantHabitaciones"><p></td>

                            <td style="text-align: center"> <input type="text" value="${item.cantBanios}" name="cantBanios"><p></td>

                            <td style="text-align: center" >
                                <c:choose>
                                    <c:when test="${item.patio == true}" >
                                         <input type="text" value="Si" name="patio"><p>
                                        </c:when>
                                        <c:otherwise>
                                             <input type="text" value="No" name="patio"><p>
                                        </c:otherwise>
                                    </c:choose>
                            </td>

                            <td style="text-align: center">
                                <c:choose>
                                    <c:when test="${item.cochera == true}" >
                                         <input type="text" value="Si" name="cochera"><p>
                                        </c:when>
                                        <c:otherwise>
                                             <input type="text" value="No" name="cochera"><p>
                                        </c:otherwise>
                                    </c:choose>
                            </td>

                            <td style="text-align: center">  <input type="text" value="${item.superficie}" name="superficie"><p></td>

                            <td style="text-align: center"> <input type="text" value="${item.cantAutos}" name="cantAutos"><p></td>

                            <td style="text-align: center" > <input type="text" value="${item.valoracion}" name="valoracion"><p></td>

                            <td style="text-align: center"> <input type="text" value="${item.precioPorDia}" name="precioPorDia"><p></td>

                            <td style="text-align: center"><input type="submit" class="Modificar" value="Modificar"></td>
                        </tr>
                    </form>
                </c:forEach>
                <tr>
                    <td colspan="10">
                <center>                     
                    <input type="button" value="Agregar" onclick="javascript:window.location.replace('AltaModificacionCasa.jsp?Accion=1')">
                </center>   
                </td>
                </tr>
            </table>
            <hr
        </c:if>
        <c:if test="${empty Casas}">
            <hr
            <h1>No se encuentran casas cargadas</h1>
            <hr
        </c:if>
    </center>
</body>

</html>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        $(".Modificar").click(function() {
            $(".Accion").val(2);
        });
    });
</script>


