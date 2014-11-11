<%-- 
    Document   : ResultadoRegistracionAlquiler
    Created on : 11/11/2014, 11:36:35
    Author     : Mauri
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultado de registración de alquiler</title>
    </head>
    <body>

        <c:choose>

            <c:when test="${empty param.precioPorDia}">
                <h5>No se ingresó precio por día</h5>
            </c:when>

            <c:when test="${empty param.fechaDesde}">
                <h5>No se ingresó fecha desde</h5>
            </c:when>

            <c:when test="${empty param.fechaHasta}">
                <h5>No se ingresó fecha hasta</h5>
            </c:when>

            <c:when test="${empty param.cantidadDias}">
                <h5>No se ingresó cantidad de días</h5>
            </c:when>
                
            <c:when test="${empty param.cantidadPersonas}">
                <h5>No se ingresó cantidad de personas</h5>
            </c:when>

            <c:otherwise>
                
                <jsp:useBean id="alquiler" class="Model.Alquileres"></jsp:useBean>
                <jsp:setProperty name="alquiler" property="*"/>

            </c:otherwise>

        </c:choose>

    </body>
</html>
