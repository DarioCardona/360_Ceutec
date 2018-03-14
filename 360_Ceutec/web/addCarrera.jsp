<%-- 
    Document   : addCarrera
    Created on : 11-05-2017, 08:32:42 AM
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
            int contador = 0;
            try {
                DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
                db.connect();

                
                    String insert = request.getParameter("carrera");
                    String insert3 = request.getParameter("codigo");
                    String insert2 ="";
                    db.query.execute("SELECT Id_Universidad   " 
                    + "FROM  Universidad WHERE Nombre ='"+request.getParameter("carrera_uni")+"';");
                    ResultSet rs1 = db.query.getResultSet();
                    while(rs1.next()){
                       insert2 = rs1.getString(1);
                    }
                   if (request.getParameter("carrera") != null && insert2 != "") {
                         if (request.getParameter("codigo") != null && insert3 != "") {
                       contador = db.query.executeUpdate("INSERT INTO Carrera (Nombre,Id_Universidad,Id_Carrera) VALUES ('" + insert + "',"+insert2+","+insert3+");");
                        }
                    }

                db.commit();
                db.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (contador == 1) {
                request.getRequestDispatcher("createSU.jsp?msj=Carrera ingresado exitosamente").forward(request, response);
                //JOptionPane.showMessageDialog(null, "Carrera ingresado exitosamente");
            } else {
                request.getRequestDispatcher("createSU.jsp?msj=Ha occurido un error").forward(request, response);
                //JOptionPane.showMessageDialog(null, "Ha occurido un error");
            }
            //request.getRequestDispatcher("create.jsp").forward(request, response);
            
        %>
    </body>
</html>
