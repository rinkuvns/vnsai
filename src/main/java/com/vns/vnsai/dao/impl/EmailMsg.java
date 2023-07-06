package com.vns.vnsai.dao.impl;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.vns.vnsai.beans.EmailFileBean;
import com.vns.vnsai.cons.CommonCons;


public class EmailMsg {
	public static void main(String[] args) {
		EmailMsg emailMsg=new EmailMsg();
		String toEmail="neerajbhagat9872@gmail.com";
		String ccEmail="neerajbhagat7355@gmail.com,neeraj@virtuosonetsoft.in";
		String subject="Credits Rollback Report";
		String  Txt="Dear Team,\r\n" + 
				"\r\n" + 
				"Please find attached client-wise report.";
		String date=LocalDate.now().toString();
		String msg=Txt;
		EmailMsg emailMsg1=new EmailMsg(toEmail, subject, msg, msg);

	}
	public EmailMsg() {
		
	}
	public void sendEmailWithFile(String toEmail, String ccEmail, String subject, String txt, List<EmailFileBean> fileList) {
		
		String host ="smtp.gmail.com" ; 
		final String user = CommonCons.userEmail;
		final String pass = CommonCons.userPassEmail; 
		
		String to = toEmail; 
		String from = CommonCons.userFromEmail;
		
		Properties props = new Properties();
       //props.put("mail.smtp.host", "smtp.mail.yahoo.com");
       props.put("mail.smtp.host", "smtp.gmail.com");  
       props.put("mail.smtp.socketFactory.port", "465");
       props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
       props.put("mail.smtp.auth", "true");
       props.put("mail.smtp.port", "465");

       Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
           protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
               return new javax.mail.PasswordAuthentication(user, pass);//change accordingly  
           }
       });

       //compose message  
       try {

           MimeMessage message = new MimeMessage(session);
           message.setFrom(new InternetAddress(from));//change accordingly  
           InternetAddress[] toAddresses = InternetAddress.parse(toEmail);
           InternetAddress[] ccAddresses = InternetAddress.parse(ccEmail);
           message.addRecipients(Message.RecipientType.TO, toAddresses);
           message.addRecipients(Message.RecipientType.CC, ccAddresses);
           message.setSubject(subject);
          // message.setText(txt_msg);
           Multipart multipart = new MimeMultipart();  
           BodyPart messageBodyPart1 = new MimeBodyPart();  
           messageBodyPart1.setText(txt);
           multipart.addBodyPart(messageBodyPart1);  
           for(EmailFileBean fileBean:fileList) {
        	   MimeBodyPart messageBodyPart2 = new MimeBodyPart();  
               DataSource source = new FileDataSource(fileBean.getFileLocation());
               messageBodyPart2.setDataHandler(new DataHandler(source));
               messageBodyPart2.setFileName(fileBean.getFileName());  
               multipart.addBodyPart(messageBodyPart2);
           }
           
           message.setContent(multipart);  
           //send message  
           Transport.send(message);
           System.out.println("message sent to ----" + to);

       } catch (MessagingException e) {
           throw new RuntimeException(e);

       } 
	
	}
	public  EmailMsg(String email,String subject,String txt_msg, String  Txt)
	{	
		String host ="smtp.gmail.com" ; 
		final String user = CommonCons.userEmail;
		final String pass = CommonCons.userPassEmail; 
		String to = email; 
		String from = CommonCons.userFromEmail;
		
		Properties props = new Properties();
        //props.put("mail.smtp.host", "smtp.mail.yahoo.com");
        props.put("mail.smtp.host", "smtp.gmail.com");  
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(user, pass);//change accordingly  
            }
        });

        //compose message  
        try {

            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));//change accordingly  
            InternetAddress[] addresses = InternetAddress.parse(email);
            message.addRecipients(Message.RecipientType.TO, addresses);
            
            message.setSubject(subject);
            message.setText(txt_msg);
            message.setContent("<!DOCTYPE html>\r\n" + 
            		"<html>\r\n" + 
            		"<head>\r\n" + 
            		"<meta charset=\"ISO-8859-1\">\r\n" + 
            		"<title>Traffic Mail</title>\r\n" + 
            		"<style>\r\n" + 
            		".center {\r\n" + 
            		"  margin: auto;\r\n" + 
            		"  width: 60%;\r\n" + 
            		"  border: 3px solid #73AD21;\r\n" + 
            		"  padding: 10px;\r\n" + 
            		"}\r\n" + 
            		"</style>\r\n" + 
            		"</head>\r\n" + 
            		"<body>\r\n" + 
            		"<div class=\"center\">\r\n" + 
            		"  <p><b> </b>"+Txt+".</p>\r\n" + 
            		"</div>\r\n" + 
            		"</body>\r\n" + 
            		"</html>","text/html" );  
            //send message  
            Transport.send(message);
            System.out.println("message sent to ----" + to);

        } catch (MessagingException e) {
            throw new RuntimeException(e);

        } 
	}
}
