/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package correo;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMailTLS {

    private String status = "";
    private String host = "smtp-mail.outlook.com";
    private String username = "PemexGaspetroquimica@outlook.com";
    private String password = "Cg-?Oq6'";

    public SendMailTLS(String contacto, String mensaje) throws MessagingException {

        Properties props = new Properties();
        props.setProperty("mail.smtp.ssl.trust", "smtp-mail.outlook.com");
        props.put("mail.smtp.starttls.enable", "true");
        Session session = Session.getInstance(props);
        MimeMessage message = new MimeMessage(session);

        message.setFrom(new InternetAddress("PemexGaspetroquimica@outlook.com"));
        message.setRecipients(Message.RecipientType.TO,
                InternetAddress.parse(contacto));
        message.setSubject("Errores de ordenes");
        message.setText(mensaje);
        // set the message content here
        Transport t = session.getTransport("smtp");
        try {
            t.connect(host, username, password);
            t.sendMessage(message, message.getAllRecipients());
            status = "enviado";
        }catch(MessagingException e){
        status = e.toString();
        } finally {
            t.close();
        }
        
    }

    public String getStatus() {
        return status;
    }

   
    
    
}
