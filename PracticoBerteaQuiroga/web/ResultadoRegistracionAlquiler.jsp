<%-- 
    Document   : ResultadoRegistracionAlquiler
    Created on : 11/11/2014, 11:36:35
    Author     : Mauri
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Controlador.ConexionJDBC" %>
<%@ page import="Model.Alquileres" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

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

                <%
                    DateFormat sourceFormat = new SimpleDateFormat("dd/MM/yyyy");

                    Date fechaDesde = sourceFormat.parse(request.getParameter("fechaDesde"));
                    Date fechaHasta = sourceFormat.parse(request.getParameter("fechaHasta"));
                    float precioPorDia = Float.parseFloat(request.getParameter("precioPorDia"));
                    int cantidadDias = Integer.parseInt(request.getParameter("cantidadDias"));
                    int cantidadPersonas = Integer.parseInt(request.getParameter("cantidadPersonas"));
                    int idCasa = Integer.parseInt(request.getParameter("idCasa"));
                    int idTemporada = Integer.parseInt(request.getParameter("idTemporada"));
                    
                    Alquileres a = new Alquileres();
                    a.setIdCasa(idCasa);
                    a.setFechaDesde(fechaDesde);
                    a.setFechaHasta(fechaHasta);
                    a.setPrecioPorDia(precioPorDia);
                    a.setCantidadDias(cantidadDias);
                    a.setCantidadPersonas(cantidadPersonas);
                    a.setIdCasa(idCasa);
                    a.setIdTemporada(idTemporada);
                    
                    ConexionJDBC conexion = ConexionJDBC.getInstance();
                    conexion.abrirConexion();
                    Alquileres result = conexion.RegistrarAlquiler(a);
                    conexion.cerrarConexion();
                    if(result!=null)
                    {
                %>
                
                <h3>Alquiler registrado exitosamente</h3>
                        
                <%}%>
                
                <%if(result==null){%>
                <h3>Error al intentar registrar alquiler</h3>
                <%}%>

            </c:otherwise>

        </c:choose>

    </body>
</html>
