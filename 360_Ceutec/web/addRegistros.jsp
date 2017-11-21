<%-- 
    Document   : addRegistros
    Created on : 11-07-2017, 09:25:07 AM
    Author     : Darío Cardona
--%>
<%@page import="java.io.InputStream"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.File"%>
<%@page import=" java.io.FileInputStream"%>
<%@page import=" java.io.IOException"%>
<%@page import=" java.util.Iterator"%>
 
<%@page import=" org.apache.poi.ss.usermodel.Cell"%>
<%@page import=" org.apache.poi.ss.usermodel.Row"%>
<%@page import=" org.apache.poi.ss.usermodel.Sheet"%>
<%@page import=" org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String temp = request.getParameter("path");
            out.print(temp +"         ");
            String temp2 = request.getParameter("archivo");
            out.print(temp2);
            
           
            String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
            Part filePart = request.getPart("archivo"); // Retrieves <input type="file" name="file">
            //String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
            //InputStream fileContent = filePart.getInputStream();
            
            out.print(filePart +" part");
            //out.print(fileName +" file name ");
    // ... (do your job here)

            /*
            String excelFilePath = application.getRealPath("")+temp2;
            FileInputStream inputStream = new FileInputStream(new File(excelFilePath));
         
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet firstSheet = workbook.getSheetAt(0);
            Iterator<Row> iterator = firstSheet.iterator();
             while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            Iterator<Cell> cellIterator = nextRow.cellIterator();
             
            while (cellIterator.hasNext()) {
                Cell cell = cellIterator.next();
                 
                switch (cell.getCellType()) {
                    case Cell.CELL_TYPE_STRING:
                        out.print(cell.getStringCellValue());
                        break;
                    case Cell.CELL_TYPE_BOOLEAN:
                        out.print(cell.getBooleanCellValue());
                        break;
                    case Cell.CELL_TYPE_NUMERIC:
                        out.print(cell.getNumericCellValue());
                        break;
                }
                out.print(" - ");
            }
            out.println();
        }
         
        workbook.close();
        inputStream.close();*/

        %>    
    </body>
</html>
