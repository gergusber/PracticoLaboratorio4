<%-- 
    Document   : AltaModificacionCasa
    Created on : 11-nov-2014, 2:38:06
    Author     : German
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Casa"%>
<%@page import="Controlador.ConexionJDBC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    <% ConexionJDBC conexion = ConexionJDBC.getInstance();
        int Accion = Integer.parseInt(request.getParameter("Accion"));
        int idCasa = 0;
        String direccion = "";
        String cantPersonas = "";
        int cantHabitaciones = 0;
        int cantBanios = 0;
        boolean patio = false;
        boolean cochera = false;
        float superficie = 0;
        int cantAutos = 0;
        int valoracion = 0;
        float precioPorDia = 0;

        if (Accion == 2) {//MODIFICACION!

            idCasa = Integer.parseInt(request.getParameter("idCasa"));
            direccion = request.getParameter("direccion");
            cantPersonas = request.getParameter("cantPersonas");
            cantHabitaciones = Integer.parseInt(request.getParameter("cantHabitaciones"));
            cantBanios = Integer.parseInt(request.getParameter("cantBanios"));
            patio = Boolean.parseBoolean(request.getParameter("patio"));
            cochera = Boolean.parseBoolean(request.getParameter("cochera"));
            superficie = Float.parseFloat(request.getParameter("cochera"));
            cantAutos = Integer.parseInt(request.getParameter("cantAutos"));
            valoracion = Integer.parseInt(request.getParameter("valoracion"));
            precioPorDia = Float.parseFloat(request.getParameter("precioPorDia"));

        }
        //conexion.cerrarConexion();.GetAllCasas();
        //request.setAttribute("", );

    %>
    <c:choose>
        <c:when test="${Accion == 1}" >
            <h1>Alta de Casa</h1>
            <form method="POST" action=""><%-- CREATE--%>
                <table border="1">
                    <input type="hidden" id="idCasa" value="${item.idCasa}">
                    <input type="hidden" id="Accion" >
                    <tr>
                        <td>Dirección:</td>
                        <td style="text-align: center"><input type="text" value="${item.direccion}"/><p></td>
                    </tr>
                    <tr>
                        <td>Cantidad de personas:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantPersonas}"/><p></td>
                    </tr>

                    <tr>
                        <td>Cantidad de habitaciones:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantHabitaciones}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Cantidad de baños:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantBanios}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Patio:</td>
                        <td style="text-align: center"><input type="checkbox" value="${item.patio}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Cochera:</td>
                        <td style="text-align: center"><input type="checkbox" value="${item.cochera}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Superficie:</td>
                        <td style="text-align: center"><input type="text" value="${item.superficie}"/><p></td>
                    </tr>

                    <tr>
                        <td>Cantidad de Autos:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantAutos}"/><p></td>
                    </tr>

                    <tr>
                        <td>valoracion:</td>
                        <td style="text-align: center"><input type="text" value="${item.valoracion}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Precio Por Dia:</td>
                        <td style="text-align: center"><input type="text" value="${item.precioPorDia}"/><p></td>
                    </tr>   
                    <tr>
                        <td colspan="10">
                            <input type="submit" id="Guardar" value="Guardar">
                        </td>
                    </tr>
                </table>
            </form>
        </c:when>
        <c:when test="${Accion == 2}"> <%-- EDIT--%>
            <h1>Modificacion de Casa</h1>
            <form method="POST" action="">
                <table border="1">
                    <input type="hidden" id="idCasa" value="${item.idCasa}">
                    <input type="hidden" id="Accion" >
                    <tr>
                        <td>Dirección:</td>
                        <td style="text-align: center"><input type="text" value="${item.direccion}"/><p></td>
                    </tr>
                    <tr>
                        <td>Cantidad de personas:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantPersonas}"/><p></td>
                    </tr>

                    <tr>
                        <td>Cantidad de habitaciones:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantHabitaciones}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Cantidad de baños:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantBanios}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Patio:</td>
                        <td style="text-align: center"><input type="checkbox" value="${item.patio}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Cochera:</td>
                        <td style="text-align: center"><input type="checkbox" value="${item.cochera}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Superficie:</td>
                        <td style="text-align: center"><input type="text" value="${item.superficie}"/><p></td>
                    </tr>

                    <tr>
                        <td>Cantidad de Autos:</td>
                        <td style="text-align: center"><input type="text" value="${item.cantAutos}"/><p></td>
                    </tr>

                    <tr>
                        <td>valoracion:</td>
                        <td style="text-align: center"><input type="text" value="${item.valoracion}"/><p></td>
                    </tr> 

                    <tr>
                        <td>Precio Por Dia:</td>
                        <td style="text-align: center"><input type="text" value="${item.precioPorDia}"/><p></td>
                    </tr>   
                    <tr>
                        <td colspan="10">
                            <input type="submit" id="Guardar" value="Guardar">
                        </td>
                    </tr>
                </table>
            </form>
        </c:when>
    </c:choose>
</body>
</html>
