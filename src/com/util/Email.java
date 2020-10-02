package com.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class Email {
	public void send(String senderEmail, String passwordSenderEmail, String recipientEmail, String bodyMsg, String subject) {
		String fromEmail = senderEmail;
		String password = passwordSenderEmail;
		String toEmail = recipientEmail;
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com"); //SMTP Host
		props.put("mail.smtp.socketFactory.port", "465"); //SSL Port
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); //SSL Factory Class
		props.put("mail.smtp.auth", "true"); //Enabling SMTP Authentication
		props.put("mail.smtp.port", "465"); //SMTP Port
		
		//Authentication
		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		};
		
		Session session = Session.getDefaultInstance(props, auth);
		
		try{
	         MimeMessage msg = new MimeMessage(session);
	         msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
		     msg.addHeader("format", "flowed");
		     msg.addHeader("Content-Transfer-Encoding", "8bit");
		     msg.setFrom(new InternetAddress(fromEmail, "no-reply"));
		     msg.setReplyTo(InternetAddress.parse(fromEmail, false));
		     msg.setSubject(subject, "UTF-8");
		     msg.setSentDate(new Date());
		     msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
		     
	         BodyPart messageBodyPart = new MimeBodyPart();
	         messageBodyPart.setContent(bodyMsg, "text/html");
	         Multipart multipart = new MimeMultipart();
	         multipart.addBodyPart(messageBodyPart);

//	         //Attachment
//	         messageBodyPart = new MimeBodyPart();
//	         String filename = "fullPath/Summary.txt";
//	         DataSource source = new FileDataSource(filename);
//	         messageBodyPart.setDataHandler(new DataHandler(source));
//	         messageBodyPart.setFileName(new File(filename).getName());
//	         multipart.addBodyPart(messageBodyPart);

	         msg.setContent(multipart);
	         Transport.send(msg);
	      }catch (MessagingException e) {
	    	  e.printStackTrace();
	      } catch (UnsupportedEncodingException e) {
	    	  e.printStackTrace();
		}
	}
}
