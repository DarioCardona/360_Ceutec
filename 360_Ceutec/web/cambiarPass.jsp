<%-- 
    Document   : cambiarPass
    Created on : 11-06-2017, 04:27:47 PM
    Author     : Darío Cardona
--%>
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
                
                if (request.getParameter("pass1").equals(session.getAttribute("session_pass"))) {
                        if (request.getParameter("pass2").equals(request.getParameter("pass3"))) {
                                int contador = db.query.executeUpdate("UPDATE Usuario SET Password = " + request.getParameter("pass3") + " WHERE Id_Usuario = " + session.getAttribute("session_usuario") + "; ");
                                if (contador == 1) {

                                    JOptionPane.showMessageDialog(null, "Se a cambiado la contraseña exitosamente");
                                     //request.getRequestDispatcher("create.jsp").forward(request, response);
                                } else {
                                    
                                    JOptionPane.showMessageDialog(null, "Ha occurido un error");
                                     request.getRequestDispatcher("index2.jsp").forward(request, response);
                                }
                               
                            } else {
                            JOptionPane.showMessageDialog(null, "La contraseña nueva no concuerda" );
                             request.getRequestDispatcher("index2.jsp").forward(request, response);
                        }
                } else {
                     JOptionPane.showMessageDialog(null, "La contraseña anterior no concuerda" );
                     request.getRequestDispatcher("index2.jsp").forward(request, response);
                }
                
                

                 
        %>
    </body>
</html>
