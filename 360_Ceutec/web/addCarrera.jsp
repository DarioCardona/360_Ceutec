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
                    String insert2 ="";
                    db.query.execute("SELECT Id_Universidad   " 
                    + "FROM  Universidad WHERE Nombre ='"+request.getParameter("carrera_uni")+"';");
                    ResultSet rs1 = db.query.getResultSet();
                    while(rs1.next()){
                       insert2 = rs1.getString(1);
                    }
                   if (request.getParameter("carrera") != null && insert2 != "") {
                    contador = db.query.executeUpdate("INSERT INTO Carrera (Nombre,Id_Universidad) VALUES ('" + insert + "',"+insert2+" );");

                    }

                db.commit();
                db.disconnect();
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (contador == 1) {

                JOptionPane.showMessageDialog(null, "Carrera ingresado exitosamente");
            } else {

                JOptionPane.showMessageDialog(null, "Ha occurido un error");
            }
            //request.getRequestDispatcher("create.jsp").forward(request, response);
            request.getRequestDispatcher("createSU.jsp").forward(request, response);
        %>
    </body>
</html>
