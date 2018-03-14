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
import javax.mail.*;
import javax.mail.internet.*;
import java.util.*;

public class EnviadorMail {
    final String miCorreo = "evaluacion.dc360@gmail.com";
    final String servidorSMTP = "smtp.gmail.com";
    final String puertoEnvio = "465";//465,587
    String mailReceptor = null;
    String asunto = null;
    String cuerpo = null;

    public EnviadorMail(String mailReceptor, String asunto, String cuerpo) {
       this.mailReceptor = mailReceptor;
       this.asunto = asunto;
       this.cuerpo = cuerpo ;
       Properties props = new Properties();
       props.put("mail.smtp.user", miCorreo);
       props.put("mail.smtp.host", servidorSMTP);
       props.put("mail.smtp.port", puertoEnvio);
       props.put("mail.smtp.starttls.enable", "true");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.socketFactory.port", puertoEnvio);
       props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
       props.put("mail.smtp.socketFactory.fallback", "false");
       SecurityManager security = System.getSecurityManager();
       try{
          Authenticator auth = new autentificadorSMTP();
          Session session = Session.getInstance(props, auth);
          MimeMessage msg = new MimeMessage(session);
          msg.setText("El correo a sido enviado por medio del modulo de Evaluación Docente");
          msg.setSubject(asunto);
          msg.setFrom(new InternetAddress(miCorreo));
          Multipart multipart = new MimeMultipart();
          MimeBodyPart mimeBodyPart = new MimeBodyPart();
          // Agregar la parte del mensaje HTML al multiPart
            multipart.addBodyPart(mimeBodyPart);
 
          // Agregar el multipart al cuerpo del mensaje
          msg.setContent(multipart);
          mimeBodyPart.setContent(cuerpo.toString(), "text/html");
          msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mailReceptor));
          Transport.send(msg);
       } catch(Exception e){
         e.printStackTrace();
       }  
       
    }
}