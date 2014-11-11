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

        <h1>Abm Casas</h1>
       

        <% ConexionJDBC conexion = ConexionJDBC.getInstance();
            conexion.abrirConexion();
            ArrayList<Casa> Casas = conexion.GetAllCasas();
            request.setAttribute("Casas", Casas);
            request.setAttribute("", Casas);
            conexion.cerrarConexion();
        %>
        <c:if test="${ not empty Casas}">
            <form method="POST" action="">
                 <input type="hidden" id="Accion" >
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
                        <td>valoracion:</td>
                        <td>Precio Por Dia:</td>
                        <td>Acciones:</td>
                    </tr>
                    <c:forEach var="item" items="${Casas}">   
                        <input type="hidden" id="idCasa" value="${item.idCasa}">
                        <tr>
                            <td style="text-align: center"><c:out value="${item.direccion}"/><p></td>

                            <td style="text-align: center"><c:out value="${item.cantPersonas}"/><p></td>

                            <td style="text-align: center"><c:out value="${item.cantHabitaciones}"/><p></td>

                            <td style="text-align: center"><c:out value="${item.cantBanios}"/><p></td>

                            <td style="text-align: center" >
                                <c:choose>
                                    <c:when test="${item.patio == true}" >
                                        <c:out value="Si"/><p>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="No"/><p>
                                        </c:otherwise>
                                    </c:choose>
                            </td>

                            <td style="text-align: center">
                                <c:choose>
                                    <c:when test="${item.cochera == true}" >
                                        <c:out value="Si"/><p>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value="No"/><p>
                                        </c:otherwise>
                                    </c:choose>
                            </td>

                            <td style="text-align: center"> <c:out value="${item.superficie}"/><p></td>

                            <td style="text-align: center"><c:out value="${item.cantAutos}"/><p></td>

                            <td style="text-align: center" ><c:out value="${item.valoracion}"/><p></td>

                            <td style="text-align: center"><c:out value="${item.precioPorDia}"/><p></td>

                            <td style="text-align: center"><input type="submit" id="Modificar" value="Modificar"></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="10">
                            <input type="submit" value="Alquilar"/>
                        </td>
                    </tr>
                </table>
            </form>
        </c:if>
        <c:if test="${empty Casas}">
            <h1>No se encuentran casas cargadas</h1>
        </c:if>

        <input type="submit" id="Nuevo" value="Agregar">
        
    </body>
</html>
<script type="text/javascript">
    $(document).ready(function() {
        $("#Nuevo").click(function (){
            $("#Accion").val() = 1; 
        });
   
        $("#Modificar").click(function (){
            $("#Accion").val() = 2;
        });
    });
</script>


