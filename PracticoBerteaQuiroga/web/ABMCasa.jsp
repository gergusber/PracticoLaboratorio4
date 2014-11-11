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
        <% ConexionJDBC conexion = ConexionJDBC.getInstance();
            conexion.abrirConexion();
            ArrayList<Casa> Casas = conexion.GetAllCasas();
            request.setAttribute("Casas", Casas);
            conexion.cerrarConexion();
        %>
        <h1>Abm Casas</h1>
        
        <input type="button" value="Agregar">
        
        
        <c:if test="${ not empty Casas}">
            <form>
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
                    </tr>
                    <c:forEach var="item" items="${Casas}">   
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

                            <td style="text-align: center" >
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
    </body>
</html>
