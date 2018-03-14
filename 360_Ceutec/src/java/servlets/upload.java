/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import DB.DatabaseConnection;
import com.aspose.cells.Row;
import com.aspose.cells.Workbook;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;
import org.apache.poi.sl.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author Darío Cardona
 */
//cuando ocupamos parsear multiples  tipos
@MultipartConfig

public class upload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nombre = "", alterno = "", ubicacion = "", url = "", tipo = "", contexto = "";
        try (PrintWriter out = response.getWriter()) {
            for (Part part : request.getParts()) {
                if (part.getContentType() != null) { //es archivo
                    //contexto local
                    /* ubicacion = escribe_archivo(part);
                    tipo = part.getContentType();
                    nombre = (new File(ubicacion)).getName();
                    url = this.getServletContext().getContextPath() + "/" + nombre;
                    contexto = "local";*/

                    //contexto fuera                    
                    ubicacion = escribe_archivo_fuera_c(part, "c:/Archivo360/");
                    tipo = part.getContentType();
                    nombre = (new File(ubicacion)).getName();
                    url = "/download?archivo=" + nombre + "";
                    contexto = "fuera";

                } else {
                    //otros objetos
                    Scanner sc = new Scanner(part.getInputStream());
                    if (part.getName().equals("ti_nombre")) {
                        alterno = sc.nextLine();
                    }
                }
            }//FIN FOR

            //out.println("ubicacion " + ubicacion);
            String x = leer_excel(ubicacion);
            //out.println("x  ya   " + x);
            

            //redireccionar a Listar
            request.getRequestDispatcher("createSU.jsp?msj=Registros Ingresados exitosamente").forward(request, response);
        }//FIN TRY
    }

    private String leer_excel(String path) throws FileNotFoundException, IOException {
        String s = "";
        InputStream ExcelFileToRead = new FileInputStream(path);

        XSSFWorkbook wb = new XSSFWorkbook(ExcelFileToRead);

        XSSFWorkbook test = new XSSFWorkbook();

        XSSFSheet sheet = wb.getSheetAt(0);
        XSSFRow row;
        XSSFCell cell;

        Iterator rows = sheet.rowIterator();
        int mi_cont = 0;
        while (rows.hasNext()) {
            mi_cont = 0;
            row = (XSSFRow) rows.next();
            Iterator cells = row.cellIterator();
            while (cells.hasNext()) {
                cell = (XSSFCell) cells.next();

                if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING) {

                    s += ",'" + cell.getStringCellValue() + "'";
                    mi_cont++;
                } else if (cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC) {
                    if (mi_cont == 0) {
                        s += (int) cell.getNumericCellValue();
                        mi_cont++;
                    } else {
                        s += "," + (int) cell.getNumericCellValue();
                        mi_cont++;
                    }

                } else {
                    //U Can Handel Boolean, Formula, Errors
                }
            }
            guarda_db(s, mi_cont);
            s = "";
        }
        return s;
    }

    private String escribe_archivo(Part p) throws IOException {
        String nombre = "";
        String path = this.getServletContext().getRealPath("");
        for (String token : p.getHeader("content-disposition").split(";")) {
            if (token.trim().startsWith("filename")) {
                nombre = (new File(token.substring(
                        token.indexOf("=") + 2, token.length() - 1
                ))).getName();
            }
        }
        p.write(path + nombre);
        return path + nombre;
    }

    private void guarda_db(String datos, int tamaño) {
        //JOptionPane.showMessageDialog(null, "tamaño: " + tamaño);
        String estructura = "Id_Usuario,Nombre_Usuario,Valoracion_Global,Seccion,Materia,Id_Carrera,Id_Estructura,";
        //estructura+= "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,";
        // estructura+= "Indicador_9,Indicador_10";
        switch (tamaño) {
            case 8:
                estructura += "Indicador_1";
                break;
            case 9:
                estructura += "Indicador_1,Indicador_2";
                break;
            case 10:
                estructura += "Indicador_1,Indicador_2,Indicador_3";
                break;
            case 11:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4";
                break;
            case 12:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5";
                break;
            case 13:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6";
                break;
            case 14:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7";
                ;
                break;
            case 15:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8";
                break;
            case 16:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9";
                break;
            case 17:
                estructura += "Indicador_1,Indicador_2,Indicador_3,Indicador_4,Indicador_5,Indicador_6,Indicador_7,Indicador_8,Indicador_9,Indicador_10";
                break;

            default:
                break;
        }
        //JOptionPane.showMessageDialog(null, "tamaño: " + tamaño + " datos: " + estructura);

        try {
            DatabaseConnection db = new DatabaseConnection(this.getServletContext().getRealPath(""));
            db.connect();
            db.query.executeUpdate("INSERT INTO Registros (" + estructura + ") VALUES (" + datos + " );");
            db.commit();
            db.disconnect();
            
        } catch (SQLException e) {
        }
        
        //JOptionPane.showMessageDialog(null, "tamaño: " + datos + "\n datos: " + estructura);

    }

    private String escribe_archivo_fuera_c(Part p, String ubicacion) throws IOException {
        String nombre = "";
        String path = ubicacion; //fuera de contexto
        for (String token : p.getHeader("content-disposition").split(";")) {
            if (token.trim().startsWith("filename")) {
                nombre = (new File(token.substring(
                        token.indexOf("=") + 2, token.length() - 1
                ))).getName();
            }
        }
        p.write(path + nombre);
        return path + nombre;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

