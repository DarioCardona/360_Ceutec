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
                    ubicacion = escribe_archivo(part);
                    tipo = part.getContentType();
                    nombre = (new File(ubicacion)).getName();
                    url = this.getServletContext().getContextPath() + "/" + nombre;
                    contexto = "local";

                    //contexto fuera                    
                    /*ubicacion=escribe_archivo_fuera_c(part,"c:/Archivos/");
                    tipo = part.getContentType();   
                    nombre= (new File(ubicacion)).getName();
                    url = "/download?archivo="+nombre+"";
                    contexto="fuera";*/
                } else {
                    //otros objetos
                    Scanner sc = new Scanner(part.getInputStream());
                    if (part.getName().equals("ti_nombre")) {
                        alterno = sc.nextLine();
                    }
                }
            }//FIN FOR
            //out.println("nombre" + nombre);
            out.println("ubicacion" + ubicacion);
            leer_excel(ubicacion);
           // out.println("url" + url);
            //out.println("tipo" + tipo);
            //Guardar en la base de datos
            //guarda_db(nombre, alterno, ubicacion, url, tipo, contexto);

            //redireccionar a Listar
            //request.getRequestDispatcher("createSU.jsp").forward(request, response);

        }//FIN TRY
    }
    
    public void leer_excel (String path) throws FileNotFoundException, IOException{
      InputStream ExcelFileToRead = new FileInputStream(path);
        XSSFWorkbook  wb = new XSSFWorkbook(ExcelFileToRead);

        XSSFWorkbook test = new XSSFWorkbook(); 

        XSSFSheet sheet = wb.getSheetAt(0);
        XSSFRow row; 
        XSSFCell cell;

        Iterator rows = sheet.rowIterator();

        while (rows.hasNext())
        {
            row=(XSSFRow) rows.next();
            Iterator cells = row.cellIterator();
            while (cells.hasNext())
            {
                cell=(XSSFCell) cells.next();

                if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                {
                    out.print(cell.getStringCellValue()+" ");
                }
                else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                {
                    out.print(cell.getNumericCellValue()+" ");
                }
                else
                {
                    //U Can Handel Boolean, Formula, Errors
                }
            }
            System.out.println();
        }
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

    /*private void guarda_db(String nombre, String alterno, String ubicacion, String url, String tipo, String contexto) {
        try {
            Dba db = new Dba(this.getServletContext().getRealPath("") + "/WEB-INF/base.mdb");
            db.conectar();
            int contador = db.query.executeUpdate("insert into archivos (nombre, alterno, ubicacion, url, tipo, contexto) "
                    + "values('" + nombre + "'"
                    + ",'" + alterno + "'"
                    + ",'" + ubicacion + "'"
                    + ",'" + url + "'"
                    + ",'" + tipo + "'"
                    + ",'" + contexto + "')");
            db.commit();
            db.desconectar();
        } catch (SQLException e) {
        }

    }*/

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

