<%-- 
    Document   : addEstructura
    Created on : 11-05-2017, 08:34:13 AM
    Author     : Darío Cardona
--%>
<%@page import="java.util.Date"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DatabaseConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
            db.connect();
            String insert2 = "";
            String error = "";
            db.query.execute("SELECT Id_Universidad   "
                    + "FROM  Universidad WHERE Nombre ='" + request.getParameter("estructura_uni") + "';");
            ResultSet rs1 = db.query.getResultSet();
            while (rs1.next()) {
                insert2 = rs1.getString(1);
            }

            String insert = "", campos = "";
            int contador = 0;
            String indicador_1 = "", indicador_2 = "", indicador_3 = "", indicador_4 = "", indicador_5 = "", indicador_6 = "";
            String indicador_7 = "", indicador_8 = "", indicador_9 = "", indicador_10 = "", anio = "", Periodo = "", Modulo = "";

            if (request.getParameter("indicador_1") != null && request.getParameter("indicador_1") != "") {
                indicador_1 += "'" + request.getParameter("indicador_1") + "'";

                campos += "Indicador_1,";
                insert += indicador_1 + ",";
            }
            if (request.getParameter("indicador_2") != null && request.getParameter("indicador_2") != "") {
                indicador_2 += "'" + request.getParameter("indicador_2") + "'";

                campos += "Indicador_2,";
                insert += indicador_2 + ",";
            }
            if (request.getParameter("indicador_3") != null && request.getParameter("indicador_3") != "") {
                indicador_3 += "'" + request.getParameter("indicador_3") + "'";

                campos += "Indicador_3,";
                insert += indicador_3 + ",";
            }
            if (request.getParameter("indicador_4") != null && request.getParameter("indicador_4") != "") {
                indicador_4 += "'" + request.getParameter("indicador_4") + "'";

                campos += "Indicador_4,";
                insert += indicador_4 + ",";
            }
            if (request.getParameter("indicador_5") != null && request.getParameter("indicador_5") != "") {
                indicador_5 += "'" + request.getParameter("indicador_5") + "'";

                campos += "Indicador_5,";
                insert += indicador_5 + ",";
            }

            if (request.getParameter("indicador_6") != null && request.getParameter("indicador_6") != "") {
                indicador_6 += "'" + request.getParameter("indicador_6") + "'";

                campos += "Indicador_6,";
                insert += indicador_6 + ",";
            }
            if (request.getParameter("indicador_7") != null && request.getParameter("indicador_7") != "") {
                indicador_7 += "'" + request.getParameter("indicador_7") + "'";

                campos += "Indicador_7,";
                insert += indicador_7 + ",";
            }
            if (request.getParameter("indicador_8") != null && request.getParameter("indicador_8") != "") {
                indicador_8 += "'" + request.getParameter("indicador_8") + "'";

                campos += "indicador_8,";
                insert += indicador_8 + ",";
            }
            if (request.getParameter("indicador_9") != null && request.getParameter("indicador_9") != "") {
                indicador_9 += "'" + request.getParameter("indicador_9") + "'";

                campos += "Indicador_9,";
                insert += indicador_9 + ",";
            }
            if (request.getParameter("indicador_10") != null && request.getParameter("indicador_10") != "") {
                indicador_10 += "'" + request.getParameter("indicador_10") + "'";

                campos += "Indicador_10,";
                insert += indicador_10 + ",";
            }

            if (request.getParameter("anio") != null && request.getParameter("anio") != "") {
                anio += request.getParameter("anio");

                campos += "Año,";
                insert += anio + ",";
            }

            if (request.getParameter("periodo_select") != null && request.getParameter("periodo_select") != "") {
                Periodo += request.getParameter("periodo_select");

                campos += "Periodo,";
                insert += Periodo + ",";
            }
            if (request.getParameter("modulo_selector") != null && request.getParameter("modulo_selector") != "") {
                Modulo += request.getParameter("modulo_selector");

                campos += "Modulo,";
                insert += Modulo + ",";
            }

            if (insert2 == "") {
                error = "La Universidad no a sido encontrada ";
            } else {
                campos += "Id_Universidad";
                insert += insert2;

                try {
                    contador = db.query.executeUpdate("INSERT INTO Estructura (" + campos + ") VALUES (" + insert + " );");
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

            
            // request.getRequestDispatcher("addRegister.jsp").forward(request, response); 

            if (Integer.parseInt(session.getAttribute("session_rol").toString()) == 0) {
                if (contador == 1) {
                    request.getRequestDispatcher("CreateSU.jsp?msj=Ingresado exitosamente").forward(request, response);
                   // JOptionPane.showMessageDialog(null, "");
                } else {
                    request.getRequestDispatcher("CreateSU.jsp?msj=Ha occurido un error").forward(request, response);
                    //JOptionPane.showMessageDialog(null, "Ha occurido un error" + error);
                }
                
            } else if (Integer.parseInt(session.getAttribute("session_rol").toString()) == 1) {
                request.getRequestDispatcher("tablaJefe.jsp").forward(request, response);
            } else if (Integer.parseInt(session.getAttribute("session_rol").toString()) == 2) {
                if (contador == 1) {
                    request.getRequestDispatcher("tablaCarrera.jsp?msj=Ingresado exitosamente").forward(request, response);
                   // JOptionPane.showMessageDialog(null, "");
                } else {
                    request.getRequestDispatcher("tablaCarrera.jsp?msj=Ha occurido un error").forward(request, response);
                    //JOptionPane.showMessageDialog(null, "Ha occurido un error" + error);
                }
                
            } else if (Integer.parseInt(session.getAttribute("session_rol").toString()) == 3) {
                request.getRequestDispatcher("tablaUsuario.jsp").forward(request, response);
            }

        %>    
    </body>
</html>
