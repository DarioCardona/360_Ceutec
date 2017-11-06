<%-- 
    Document   : tablaUsuario
    Created on : 11-04-2017, 12:54:34 PM
    Author     : Darío Cardona
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>360 CEUTEC </title>
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/bootstrap-css/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
           ArrayList <ResultSet> estructuras  =new ArrayList();
           ArrayList <ResultSet> Registros  =new ArrayList();
          /*  if (session.getAttribute("session_user") == null) {
                JOptionPane.showMessageDialog(null, "No tiene permisos para acceder a esta pagina");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
            }
            DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
            db.connect();
            //db.query.executeUpdate("INSERT INTO User (Username, Password) VALUES ('" + request.getParameter("user") +"', '" + request.getParameter("pass") + "')");
            db.query.execute("SELECT Article, Description, Units, Status, TypeOfUserArticle, HuaweiResponsible  FROM EBS");
            ResultSet rs = db.query.getResultSet();
            System.out.println(rs);*/
        %> 
       
            <center>
                <div class="col-md-1 space2">
                <form action="backMain.jsp ">
                    <input  class="btnred" type="submit" value="Regresar"  />
                </form>
                </div>
                <div class="col-md-10">
                    <h2>Evaluacion Docente</h2> 
                    <input type="text" id="Search" onkeyup="search_b()" placeholder="Buscar en la tabla .." title="Type in a name" size="50">
                </div>
                
                <div class="container-extra"><br></div>
                <br><br>
            </center>
            
            
            <table class="table table-striped" id="PerformanceTable">
                <% for (int i = 0; i < 10; i++) { %>


                <thead class="mytable2">
                    <tr>
                        <th><p>TH</p></th>
                        <th><p>Nombre del Docente</p></th>
                        <th><p>Valoración Global</p></th>
                        <th><p>Sección</p></th>
                        <th><p>Materia</p></th>
                        <th><p>Año</p></th>
                        <th><p>Periodo</p></th>
                        <th><p>Modulo</p></th>
                        
                        <th><p> Indicador 1</p></th>
                        <th><p>Indicador 2</p></th>
                        <th><p>Indicador 3</p></th>
                        <th><p>Indicador 4</p></th>
                        <th><p>Indicador 5</p></th>
                        <th><p>Indicador 6</p></th>
                        <th><p>Indicador 7</p></th>
                        <th><p>Indicador 8</p></th>
                        <th><p>Indicador 9</p></th>
                        <th><p>Indicador 10</p></th>
                    </tr>
                </thead>
                <tbody>

                    
                    <tr>
                        <td>balalala </td>
                        <td> belelele</td>
                        <td> bilili</td>
                        <td> bololo </td>
                        <td> bululu</td>
                        <td> bfhkvbf</td>
                    </tr> 
                    <% } 
                       
                    %> 

                </tbody>
            </table>
        
        <%
            //db.disconnect();
        %>
        <script>

            function search_b() {
                var input, filter, table, tr, td, i;
                input = document.getElementById("Search");
                filter = input.value.toUpperCase();
                table = document.getElementById("PerformanceTable");
                tr = table.getElementsByTagName("tr"),
                        th = table.getElementsByTagName("th");

                // Loop through all table rows, and hide those who don't match the        search query
                for (i = 1; i < tr.length; i++) {
                    tr[i].style.display = "none";
                    for (var j = 0; j < th.length; j++) {
                        td = tr[i].getElementsByTagName("td")[j];
                        if (td) {
                            if (td.innerHTML.toUpperCase().indexOf(filter.toUpperCase()) > -1) {
                                tr[i].style.display = "";
                                break;
                            }
                        }
                    }
                }
            }
        </script>
    </body>

</html>

