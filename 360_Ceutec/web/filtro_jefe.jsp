<%-- 
    Document   : filtro_jefe
    Created on : 12-18-2017, 02:11:02 PM
    Author     : Darío Cardona
--%>

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
        <title>Principal Administrador</title>
        <link rel="stylesheet" href="styles/style.css">
        <link rel="stylesheet" href="styles/bootstrap-css/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/bootstrap3-dialog/dist/css/bootstrap-dialog.min.css">
        <link rel="stylesheet"  href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="icon" type="image/png" href="logo.png">
    </head>
    <body>



        <div>
            <!--*********************  Filter start  *********************-->
            
                <div class="space"></div>
                
                <form action="sessionOut.jsp ">
                    <input  class="left btnred" type="submit" value="Regresar"  />
                </form>

                <form action="tablaJefe.jsp " methor="POST">
                   <div class="left">Filtrado por: 
                        <input id="myTEXT" name="balala" type="text" size="50" readonly=""/>
                        <button type="button" class="btnblue left2 replyMessage" onclick ="getFilter();">
                            <span class="glyphicon glyphicon glyphicon-plus" aria-hidden="true" onclick ="getFilter();"></span>
                        </button>
                        <input id="change_pg" class="btngreen left2" type="submit" value="Filtrar"  />
                        <button type="button" class="btnyellow left2 replyMessage" onclick ="clean_filter();"> Limpiar Filtro
                            <span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true" onclick ="clean_filter();"></span>
                        </button>
                    </div>
                  </form>
                    <!--*********************  Filter end  *********************-->

                    <br>

                    <!--*********************  Table start  *********************-->

                    <table class="no-space" id="PerformanceTable" width="100%" align="center"  >
                        <thead class="mytable col-md-12"><center>
                            <tr class="col-md-12">
                                <th class="col-md-3">

                                </th>
                                <th class="col-md-2 centered">

                                    <p class="centered">Semestre</p>
                                    <select id="modulo_select" name="modulo_select">
                                        <option value=""></option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>

                                    </select>                     

                                </th>
                                <th class="col-md-2 centered">
                                    <p class="centered">Periodo</p>
                                    <select id="periodo_select"  name="periodo_select" >
                                        <option value=""></option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>

                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                    </select>
                                </th>
                                <th class="col-md-2 centered">
                                    <p class="centered">Año</p>
                                    <select id="año_select" name="año_select">
                                        <option value=""></option>
                                        <option value="2017">2017</option>
                                        <option value="2018">2018</option>
                                        <option value="2019">2019</option>
                                        <option value="2020">2020</option>
                                        <option value="2021">2021</option>
                                        <option value="2022">2022</option>

                                    </select>
                                </th>

                            </tr>

                            </thead></center>
                    </table>

               

                <script>
         var where_option = "";
                var cont = 0;
                var bool_modulo = false;
                var bool_año = false;
                var bool_periodo = false;
                
        function getFilter() { 
                  var opl = $('#modulo_select').val();
                    if (opl !== "") {
                        if (cont == 0) {
                            cont++;
                            bool_modulo = true;
                            where_option += "e.Modulo = " + opl + "";
                        } else {
                            if (bool_modulo) {
                                where_option += " or e.Modulo = " + opl + "";
                            } else {
                                bool_modulo = true;
                                where_option += " and e.Modulo = " + opl + "";
                            }

                        }
                    }
                    var opp = $('#periodo_select').val();
                    if (opp !== "") {
                        if (cont == 0) {
                            cont++;
                            bool_periodo = true;
                            where_option += "e.Periodo = " + opp + "";
                        } else {
                            if (bool_periodo) {
                                where_option += " or e.Periodo = " + opp + "";
                            } else {
                                bool_periodo = true;
                                where_option += " and e.Periodo = " + opp + "";
                            }

                        }
                    }
                    var opa = $('#año_select').val();
                    if (opa !== "") {
                        if (cont == 0) {
                            cont++;
                            bool_año = true;
                            where_option += "e.Año = " + opa + "";
                        } else {
                            if (bool_año) {
                                where_option += " or e.Año = " + opa + "";
                            } else {
                                bool_año = true;
                                where_option += " and e.Año = " + opa + "";
                            }

                        }
                    }
                    
                    $('#año_select').val('');
                    $('#periodo_select').val('');
                    $('#modulo_select').val('');
                    $('#myTEXT').val(where_option);
                }
                
                 function clean_filter() {
                    //alert("entro");
                    where_option = "";
                    cont = 0;
                    bool_modulo = false;
                    bool_periodo = false;
                    bool_año = false;
                   

                    
                    $('#modulo_select').val('');
                    $('#periodo_select').val('');
                    $('#año_select').val('');
                    $('#myTEXT').val('');
                    
                    

                   
                }
                </script>  




            <style>
                .selected {
                    background-color: brown;
                    color: #FFF;
                }
            </style>


            <!--*********************  Table end  *********************-->

        </div>

    </body>
</html>

