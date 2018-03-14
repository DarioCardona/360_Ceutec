<%-- 
    Document   : send
    Created on : 12-07-2017, 03:06:43 PM
    Author     : Darío Cardona
--%>
<%@page import="mpq.EnviadorMail"%>
<%@page import="java.util.ArrayList"%>
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

            ArrayList<ResultSet> Registros = new ArrayList();
            ArrayList<ResultSet> correo = new ArrayList();
            /*  if (session.getAttribute("session_user") == null) {
                JOptionPane.showMessageDialog(null, "No tiene permisos para acceder a esta pagina");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
            }*/
            DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
            db.connect();
            ResultSet rs2;
            String año = "", periodo = "", modulo = "";
            String str = "";
            db.query.execute("SELECT  Año, Periodo, Modulo,Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10  "
                    + "FROM Estructura Where Id_Estructura = " + request.getParameter("id_send") + ";");
            rs2 = db.query.getResultSet(); // obtengo la estructura
            while (rs2.next()) {
                str = "<!DOCTYPE html PUBLIC \"- //W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">"
                        + "<html xmlns=\"http://www.w3.org/1999/xhtml\">"
                        + "<head> <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /> </head>"
                        + "<body>"
                        + "<p>"+ request.getParameter("comment")+ "<p>"
                        + "<table border=1 style=\"text-align: center;\">"
                        + "<tr>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">TH</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Nombre del Docente</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Valoración Global</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Sección</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Materia</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Año</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Periodo</th>"
                        + "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">Modulo</th>";
                año = rs2.getString(1);
                periodo = rs2.getString(2);
                modulo = rs2.getString(3);
                for (int i = 4; i < 14; i++) {
                    String temp = rs2.getString(i);
                    if (temp == null) {
                        break;
                    } else {
                        str += "<th style=\"background-color:dimgray;color:white;border: 1px solid dimgray;\">" + rs2.getString(i) + "</th>";
                    }
                }
                str += "</tr>";
            }
            out.print(str);
            db.query.execute("SELECT DISTINCT Id_Usuario,u.correo "
                    + "FROM Registros r "
                    + "inner join Usuario u on r.Id_Usuario = u.Id_Usuario "
                    + "WHERE Id_Carrera = " + session.getAttribute("session_carrera") + " AND Id_Estructura = " + request.getParameter("id_send") + ";");
            ResultSet rs = db.query.getResultSet(); // obtengo los usuario
            ResultSet rs1;
            String str2 = "";
            while (rs.next()) {
                out.print(rs.getString(2));
                db.query.execute("SELECT Id_Usuario, Nombre_Usuario, Valoracion_Global, Seccion, Materia, Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10  "
                        + "FROM Registros Where Id_Estructura = " + request.getParameter("id_send") + " AND Id_Usuario = " + rs.getString(1) + ";");
                rs1 = db.query.getResultSet();
                //Registros.add(rs1);// agrego los registros por usuario y estructura
                while(rs1.next()){
                str2 = str;
                str2 += "<tr>"
                        + "<td>" + rs1.getString(1) + "</td>"
                        + "<td>" + rs1.getString(2) + "</td>"
                        + "<td>" + rs1.getString(3) + "</td>"
                        + "<td>" + rs1.getString(4) + "</td>"
                        + "<td>" + rs1.getString(5) + "</td>"
                        + "<td>" + año + "</td>"
                        + "<td>" + periodo + "</td>"
                        + "<td>" + modulo + "</td>";
                for (int i = 6; i < 16; i++) {
                    String temp = rs1.getString(i);
                    if (temp == null) {
                        break;
                    } else {
                        str2 += "<td>" + rs1.getString(i) + "</td>";
                    }
                }

                str2 += "</tr>";
                
            }
                str2 += "</table>"
                        + "<p>Este mensaje a sido enviado mediante la plataforma de Evaluacion 360<p>"
                        + "</body>"
                        + "</html>";
               // out.print(str2); // va envio de correo
                 EnviadorMail EnviadorMail = new EnviadorMail(rs.getString(2).toString(), "Evaluación Docente" , str2); 
        }
            
         request.getRequestDispatcher("tablaCarrera.jsp?msj=Coreo enviado exitosamente").forward(request, response);

        %>
    </body>
</html>
