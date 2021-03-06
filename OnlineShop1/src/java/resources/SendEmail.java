/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package resources;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author VINH
 */
public class SendEmail {

    public boolean sendEmailActivation(String reciever, String fullname) {

        boolean check = false;
        final String username = "jb20225@gmail.com";
        final String password = "jb20225@gmail";

        // Setup mail server
        Properties props = new Properties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        // Get the default Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);
            // Set From: header field of the header.
            message.setFrom(new InternetAddress("jb20225@gmail.com"));
            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(reciever));
            // Set Subject: header field
            message.setSubject("Password for your account !");
            // Send the actual HTML message, as big as you like
            String messageActivation = "Hi " + fullname + ", your username"
                    + " to login to our website is " + reciever + " and "
                    + "your password is 123 .";
            message.setText(messageActivation);

            Transport.send(message);

            System.out.println("Done");

            check = true;

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        return check;
    }
    
      
    public static void send(String to, String sub,String msg, final String user, final String pass) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.allow8bitmime", "true");
        props.put("mail.smtps.allow8bitmime", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html; charset=UTF-8");
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

     public static void resetPassMail(String username,  String email) {
        String subject = "[OnlineShop]Reset password link!";
        String code = "http://localhost:8080/OnlineShop1/resetpass";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n "
                + "\n"
                + "<head>\n "
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Xin ch??o " + username + " !</h3>\n"
                + "    <div>Link ?????t l???i m???t kh???u c???a b???n l?? : <a href=\""+ code +"\">Nh???n v??o ????y!</a></div>\n"
                + "    <div>Th?? n??y ???????c t???o ra t??? ?????ng.</div>\n"
                + "    <div>N???u b???n c???n tr??? gi??p ho???c c?? c??u h???i, h??y g???i email ?????n ch??ng t??i b???t c??? l??c n??o.</div>\n"
                + "    <h3 style=\"color: blue;\">Tr??n tr???ng!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        SendEmail.send(email, subject, message, "ed23112001@gmail.com", "Ed2311wars@");
    }   
     
     public boolean registerMail(String username,String to) {
        Properties props = new Properties();
        boolean check = false;
        final String user = "ed23112001@gmail.com";
        final String password = "Ed2311wars@";
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.allow8bitmime", "true");
        props.put("mail.smtps.allow8bitmime", "true");
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user,password);
            }
        });
        String sub = "[OnlineShop]Register confirmation!";
        String msg = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n "
                + "\n"
                + "<head>\n "
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Xin ch??o " + username + " !</h3>\n"
                + "    <div>C??m ??n b???n ???? ????ng k?? v??o k??nh b??n h??ng tr???c tuy???n c???a ch??ng t??i!</div>\n"
                + "    <div>Th?? n??y ???????c t???o ra t??? ?????ng.</div>\n"
                + "    <div>N???u b???n c???n tr??? gi??p ho???c c?? c??u h???i, h??y g???i email ?????n ch??ng t??i b???t c??? l??c n??o.</div>\n"
                + "    <h3 style=\"color: blue;\">Tr??n tr???ng!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress("ed23112001@gmail.com"));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html; charset=UTF-8");
            Transport.send(message);
            check = true;

        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return check;
    }
     
    public static void ContactMail(String username,  String email) {
        String subject = "[OnlineShop]order confirmation & payment guides!";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n "
                + "\n"
                + "<head>\n "
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Xin ch??o " + username + " !</h3>\n"
                + "    <div>Ch??ng t??i ???? nh???n ???????c y??u c???u ?????t h??ng c???a b???n bao g???m</div>\n"
                + "    <div>B???n s??? nh???n ???????c ????n h??ng c???a m??nh trong v??ng 1 tu???n n???a.</div>\n"
                + "    <div>Tr??n th??nh c??m ??n qu?? kh??ch ???? mua h??ng ??? c???a h??ng ch??ng t??i.</div>\n"
                + "    <div>Th?? n??y ???????c t???o ra t??? ?????ng.</div>\n"
                + "    <div>N???u b???n c???n tr??? gi??p ho???c c?? c??u h???i, h??y g???i email ?????n ch??ng t??i b???t c??? l??c n??o.</div>\n"
                + "    <h3 style=\"color: blue;\">Tr??n tr???ng!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        SendEmail.send(email, subject, message, "ed23112001@gmail.com", "Ed2311wars@");
    }    
}
