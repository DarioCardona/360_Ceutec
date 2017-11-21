<%-- 
    Document   : tablaCarrera
    Created on : 11-12-2017, 11:18:34 AM
    Author     : Darío Cardona
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DB.DatabaseConnection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>360 CEUTEC</title>


        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/bootstrap-css/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
    </head>
    <body>
        <%
            ArrayList<ResultSet> Estructuras = new ArrayList();
            ArrayList<ResultSet> Registros = new ArrayList();
            /*  if (session.getAttribute("session_user") == null) {
                JOptionPane.showMessageDialog(null, "No tiene permisos para acceder a esta pagina");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
            }*/
            DatabaseConnection db = new DatabaseConnection(application.getRealPath(""));
            db.connect();
            db.query.execute("SELECT DISTINCT Id_Estructura FROM Registros WHERE Id_Carrera = " + session.getAttribute("session_carrera") + ";");
            ResultSet rs = db.query.getResultSet();
            ResultSet rs1;
            ResultSet rs2;
            while (rs.next()) {
                db.query.execute("SELECT Id_Usuario, Nombre_Usuario, Valoracion_Global, Seccion, Materia, Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10  "
                        + "FROM Registros Where Id_Estructura = " + rs.getString(1) + " AND Id_Carrera = " + session.getAttribute("session_carrera") + ";");
                rs1 = db.query.getResultSet();
                Registros.add(rs1);// agrego los registros

                db.query.execute("SELECT  Año, Periodo, Modulo,Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10  "
                        + "FROM Estructura Where Id_Estructura = " + rs.getString(1) + ";");
                rs2 = db.query.getResultSet();
                Estructuras.add(rs2);// agrego los registros
            }
            //db.query.executeUpdate("INSERT INTO User (Username, Password) VALUES ('" + request.getParameter("user") +"', '" + request.getParameter("pass") + "')");
            String temp100 = "", temp101 = "", temp102 = "";
            db.query.execute("SELECT Id_Estructura, Periodo, Modulo, Año, Indicador_1,Indicador_2,Indicador_3,Indicador_4,"
                    + "Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10 FROM Estructura WHERE Id_Universidad = " + session.getAttribute("session_universidad") + ";");
            ResultSet rs3 = db.query.getResultSet();
        %> 

    <center>
        <div class="col-md-1 space2">
            <form action="sessionOut.jsp ">
                <input  class="btnred" type="submit" value="Regresar"  />
            </form>

        </div>
        <div class="col-md-1 space2 ">

            <div>
                <button type="button" class="btnblue3" data-toggle="modal" data-target="#myModal" >Estructuras</button>
            </div> 
        </div>
        <div class="col-md-9">
            <h2>Evaluacion Docente</h2> 
            <input type="text" id="Search" onkeyup="search_b()" placeholder="Buscar en la tabla .." title="Type in a name" size="50">
        </div>

        <div class="container-extra"><br></div>
        <br><br>
    </center>


    <table class="table table-striped" id="PerformanceTable">
        <% for (int i = 0; i < Estructuras.size(); i++) {
                rs2 = Estructuras.get(i);
                rs1 = Registros.get(i);
                while (rs2.next()) {


        %>


        <thead class="mytable2">
            <tr>
                <th><p>TH</p></th>
                <th><p>Nombre del Docente</p></th>
                <th><p>Valoración Global</p></th>
                <th><p>Sección</p></th>
                <th><p>Materia</p></th>

                <th><p>Año   </p></th>

                <th><p>Periodo </p></th>

                <th><p>Modulo  </p></th>

                <%                    String temp4 = " ";
                    if (rs2.getString(4) == null) {

                    } else {
                        temp4 = rs2.getString(4);
                    }
                %> 
                <th><p><%=temp4%></p></th>

                <%
                    String temp5 = " ";
                    if (rs2.getString(5) == null) {

                    } else {
                        temp5 = rs2.getString(5);
                    }
                %> 
                <th><p><%=temp5%></p></th>

                <%
                    String temp6 = " ";
                    if (rs2.getString(6) == null) {

                    } else {
                        temp6 = rs2.getString(6);
                    }
                %> 
                <th><p><%=temp6%></p></th>

                <%
                    String temp7 = " ";
                    if (rs2.getString(7) == null) {

                    } else {
                        temp7 = rs2.getString(7);
                    }
                %> 
                <th><p><%=temp7%></p></th>

                <%
                    String temp8 = " ";
                    if (rs2.getString(8) == null) {

                    } else {
                        temp8 = rs2.getString(8);
                    }
                %> 
                <th><p><%=temp8%></p></th>

                <%
                    String temp9 = " ";
                    if (rs2.getString(9) == null) {

                    } else {
                        temp9 = rs2.getString(9);
                    }
                %> 
                <th><p><%=temp9%></p></th>

                <%
                    String temp10 = " ";
                    if (rs2.getString(10) == null) {

                    } else {
                        temp10 = rs2.getString(10);
                    }
                %> 
                <th><p><%=temp10%></p></th>

                <%
                    String temp11 = " ";
                    if (rs2.getString(11) == null) {

                    } else {
                        temp11 = rs2.getString(11);
                    }
                %> 
                <th><p><%=temp11%></p></th>

                <%
                    String temp12 = " ";
                    if (rs2.getString(12) == null) {

                    } else {
                        temp12 = rs2.getString(12);
                    }
                %> 
                <th><p><%=temp12%></p></th>

                <%
                    String temp13 = " ";
                    if (rs2.getString(13) == null) {

                    } else {
                        temp13 = rs2.getString(13);
                    }
                %> 
                <th><p><%=temp13%></p></th>


                <%
                    temp100 = " "; // año para guardar el valor
                    if (rs2.getString(1) == null) {

                    } else {
                        temp100 = rs2.getString(1);
                    }
                %> 

                <%
                    temp101 = " "; // modulo para guardar el valor
                    if (rs2.getString(2) == null) {

                    } else {
                        temp101 = rs2.getString(2);
                    }
                %> 

                <%
                    temp102 = " "; // periodo para guardar el valor
                    if (rs2.getString(3) == null) {

                    } else {
                        temp102 = rs2.getString(3);
                    }
                %> 
            </tr>
        </thead>
        <tbody>
            <%
                }
                while (rs1.next()) {
            %>
            <tr>
                <%
                    String temp1 = " ";
                    if (rs1.getString(1) == null) {

                    } else {
                        temp1 = rs1.getString(1);
                    }
                %> 
                <td>          <%=temp1%>        </td>

                <%
                    String temp2 = " ";
                    if (rs1.getString(2) == null) {

                    } else {
                        temp2 = rs1.getString(2);
                    }
                %> 
                <td>          <%=temp2%>        </td>
                <%
                    String temp3 = " ";
                    if (rs1.getString(3) == null) {

                    } else {
                        temp3 = rs1.getString(3);
                    }
                %> 
                <td>          <%=temp3%>        </td>
                <%
                    String temp4 = " ";
                    if (rs1.getString(4) == null) {

                    } else {
                        temp4 = rs1.getString(4);
                    }
                %> 
                <td>          <%=temp4%>        </td>
                <%
                    String temp5 = " ";
                    if (rs1.getString(5) == null) {

                    } else {
                        temp5 = rs1.getString(5);
                    }
                %> 
                <td>          <%=temp5%>        </td>

                <td>          <%=temp100%>        </td>

                <td>          <%=temp101%>        </td>

                <td>          <%=temp102%>        </td>
                <%
                    String temp6 = " ";
                    if (rs1.getString(6) == null) {

                    } else {
                        temp6 = rs1.getString(6);
                    }
                %> 
                <td>          <%=temp6%>        </td>
                <%
                    String temp7 = " ";
                    if (rs1.getString(7) == null) {

                    } else {
                        temp7 = rs1.getString(7);
                    }
                %> 
                <td>          <%=temp7%>        </td>
                <%
                    String temp8 = " ";
                    if (rs1.getString(8) == null) {

                    } else {
                        temp8 = rs1.getString(8);
                    }
                %> 
                <td>          <%=temp8%>        </td>
                <%
                    String temp9 = " ";
                    if (rs1.getString(9) == null) {

                    } else {
                        temp9 = rs1.getString(9);
                    }
                %> 
                <td>          <%=temp9%>        </td>
                <%
                    String temp10 = " ";
                    if (rs1.getString(10) == null) {

                    } else {
                        temp10 = rs1.getString(10);
                    }
                %> 
                <td>          <%=temp10%>        </td>
                <%
                    String temp11 = " ";
                    if (rs1.getString(11) == null) {

                    } else {
                        temp11 = rs1.getString(11);
                    }
                %> 
                <td>          <%=temp11%>        </td>
                <%
                    String temp12 = " ";
                    if (rs1.getString(12) == null) {

                    } else {
                        temp12 = rs1.getString(12);
                    }
                %> 
                <td>          <%=temp12%>        </td>
                <%
                    String temp13 = " ";
                    if (rs1.getString(13) == null) {

                    } else {
                        temp13 = rs1.getString(13);
                    }
                %> 
                <td>          <%=temp13%>        </td>
                <%
                    String temp14 = " ";
                    if (rs1.getString(14) == null) {

                    } else {
                        temp14 = rs1.getString(14);
                    }
                %> 
                <td>          <%=temp14%>        </td>
                <%
                    String temp15 = " ";
                    if (rs1.getString(15) == null) {

                    } else {
                        temp15 = rs1.getString(15);
                    }
                %> 
                <td>          <%=temp15%>        </td>



            </tr> 
            <% }
                }
            %> 

        </tbody>
    </table>

<form id= "mi_form2" action="crearFormato.jsp" method="POST">
    <div class="modal fade" id="myModal"  role="dialog" aria-labelledby="myModalLabel"  >
        <div class="modal-dialog" role="document" style="width:1250px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel"><%out.print("El ID de su Carrera es : " + session.getAttribute("session_universidad"));%></h3>
                </div>
                <div class="modal-body">

                    <table class="table table-bordered table-striped" >
                        <tr>
                            <th> ID </th>
                            <th> Perido </th>
                            <th> Modulo  </th>
                            <th> Año </th>
                            <th> Indicador 1 </th>
                            <th>  Indicador 2  </th>
                            <th> Indicador 3 </th>
                            <th>  Indicador 4  </th>
                            <th> Indicador 5 </th>
                            <th>  Indicador 6  </th>
                            <th> Indicador 7 </th>
                            <th>  Indicador 8  </th>
                            <th> Indicador 9 </th>
                            <th>  Indicador 10  </th>

                        </tr>
                        <%

                            while (rs3.next()) {
                        %>
                        <tr>
                            <%
                                String temp1 = " ";
                                if (rs3.getString(1) == null) {

                                } else {
                                    temp1 = rs3.getString(1);
                                }
                            %> 
                            <td class="estructura">         
                                <%=temp1%>
                                <div>
                                    <button type="button" class=" add_item btngreen2 glyphicon glyphicon-plus" data-toggle="modal" data-target="#myModal_2" ></button>
                                </div>
                            </td>

                            <%
                                String temp2 = " ";
                                if (rs3.getString(2) == null) {

                                } else {
                                    temp2 = rs3.getString(2);
                                }
                            %> 
                            <td>          <%=temp2%>        </td>
                            <%
                                String temp3 = " ";
                                if (rs3.getString(3) == null) {

                                } else {
                                    temp3 = rs3.getString(3);
                                }
                            %> 
                            <td>          <%=temp3%>        </td>
                            <%
                                String temp4 = " ";
                                if (rs3.getString(4) == null) {

                                } else {
                                    temp4 = rs3.getString(4);
                                }
                            %> 
                            <td>          <%=temp4%>        </td>
                            <%
                                String temp5 = " ";
                                if (rs3.getString(5) == null) {

                                } else {
                                    temp5 = rs3.getString(5);
                                }
                            %> 
                            <td>          <%=temp5%>        </td>


                            <%
                                String temp6 = " ";
                                if (rs3.getString(6) == null) {

                                } else {
                                    temp6 = rs3.getString(6);
                                }
                            %> 
                            <td>          <%=temp6%>        </td>
                            <%
                                String temp7 = " ";
                                if (rs3.getString(7) == null) {

                                } else {
                                    temp7 = rs3.getString(7);
                                }
                            %> 
                            <td>          <%=temp7%>        </td>
                            <%
                                String temp8 = " ";
                                if (rs3.getString(8) == null) {

                                } else {
                                    temp8 = rs3.getString(8);
                                }
                            %> 
                            <td>          <%=temp8%>        </td>
                            <%
                                String temp9 = " ";
                                if (rs3.getString(9) == null) {

                                } else {
                                    temp9 = rs3.getString(9);
                                }
                            %> 
                            <td>          <%=temp9%>        </td>
                            <%
                                String temp10 = " ";
                                if (rs3.getString(10) == null) {

                                } else {
                                    temp10 = rs3.getString(10);
                                }
                            %> 
                            <td>          <%=temp10%>        </td>
                            <%
                                String temp11 = " ";
                                if (rs3.getString(11) == null) {

                                } else {
                                    temp11 = rs3.getString(11);
                                }
                            %> 
                            <td>          <%=temp11%>        </td>
                            <%
                                String temp12 = " ";
                                if (rs3.getString(12) == null) {

                                } else {
                                    temp12 = rs3.getString(12);
                                }
                            %> 
                            <td>          <%=temp12%>        </td>
                            <%
                                String temp13 = " ";
                                if (rs3.getString(13) == null) {

                                } else {
                                    temp13 = rs3.getString(13);
                                }
                            %> 
                            <td>          <%=temp13%>        </td>
                            <%
                                String temp14 = " ";
                                if (rs3.getString(14) == null) {

                                } else {
                                    temp14 = rs3.getString(14);
                                }
                            %> 
                            <td>          <%=temp14%>        </td>
                        </tr> 
                        <% }

                        %> 
                    </table>
                    <input id = "id_e" type="hidden"  name="id_e" readonly="">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>                           
                </div>
            </div>
        </div>
    </div>
 </form>


    <%        //db.disconnect();
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
        
        

        $(".add_item").click(function () {
            cantidad = 0;
            var $row = $(this).closest("tr");    // Find the row
            var text = Number($row.find(".estructura").text()); // Find the text
            //alert(text);                    
            document.getElementById("id_e").value = text;
            document.forms["mi_form2"].submit();

        });

    </script>
</body>

</html>