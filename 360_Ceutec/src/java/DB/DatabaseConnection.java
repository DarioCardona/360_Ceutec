/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Darío Cardona
 */
public class DatabaseConnection {
     private String database;
    private Connection dbcon;
    public Statement query;
    public Statement query2;

    
    public DatabaseConnection(String path) {
        this.database = path + "/Evaluacion_Docente.accdb";
    }

    public void connect() {
        try {
            Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
            String driver = "jdbc:ucanaccess://";
            dbcon = DriverManager.getConnection(driver + database, "", "");
            query = dbcon.createStatement();
            query2 = dbcon.createStatement();
        } catch (ClassNotFoundException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Error connecting");
        }
    }

    public void disconnect() {
        try {
            query.close();
            query2.close();
            dbcon.close();
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Error disconnecting");
        }
    }

    public void commit(){
       try{
           dbcon.commit();
       }catch(SQLException e){
           JOptionPane.showMessageDialog(null, "Error commiting");
       }
   }
    
}
