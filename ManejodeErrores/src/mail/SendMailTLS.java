package mail;

import java.net.URL;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;




import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.SimpleEmail;

/*public class SendMailTLS {

 private String status = "";
 private String host = "smtp-mail.outlook.com";
 private String username = "PemexGaspetroquimica@outlook.com";
 private String password = "Cg-?Oq6'";

 public SendMailTLS() {
 }

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
 }*/

public class SendMailTLS {

    private String status = "";
    private String host = "smtp-mail.outlook.com";
    private String username = "PemexGaspetroquimica@outlook.com";
    private String password = "Cg-?Oq6'";

    public SendMailTLS(String contacto, String mensaje)
	    throws MessagingException {

	Properties props = new Properties();
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.starttls.enable", "true");
	props.put("mail.smtp.host", "outlook.office365.com");
	props.put("mail.smtp.port", "587");
	Session session = Session.getInstance(props);
	MimeMessage message = new MimeMessage(session);

	message.setFrom(new InternetAddress("PemexGaspetroquimica@outlook.com"));
	message.setRecipients(Message.RecipientType.TO,
		InternetAddress.parse(contacto));
	message.setSubject("Testing Subject");
	message.setText(mensaje);
	// set the message content here
	Transport t = session.getTransport("smtp");
	try {
	    t.connect(host, username, password);
	    t.sendMessage(message, message.getAllRecipients());
	    status = "enviado";
	} catch (MessagingException e) {
	    status = e.toString();
	} finally {
	    t.close();
	}

    }

    public String getStatus() {
	return status;
    }
}

/*public class SendMailTLS {
    Email email =  new SimpleEmail();
    private String status = "";
    public SendMailTLS(String contacto, String mensaje) {
	    email.setHostName("smtp.googlemail.com");
	    email.setSmtpPort(587);
	    email.setAuthenticator(new DefaultAuthenticator("cliffsandwitch@gmail.com", "munguia#851234567yui"));
	    email.setSSLOnConnect(true);
	    try {
		    email.setFrom("user@gmail.com");
		    email.setSubject("TestMail");
		    email.setMsg(mensaje);
		    email.addTo(contacto);
		    email.send();
		    status ="enviado";
	    } catch (EmailException e) {
		
		status = e.getMessage();
	    }
	    
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    
    
   
    
}*/
