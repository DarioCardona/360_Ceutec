/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mpq;

/**
 *
 * @author Darío Cardona
 */
import javax.mail.PasswordAuthentication;
public class autentificadorSMTP extends javax.mail.Authenticator {
     public PasswordAuthentication getPasswordAuthentication(){
        return new PasswordAuthentication("evaluacion.dc360@gmail.com","360ceutec2017");
       
    }
    
}
