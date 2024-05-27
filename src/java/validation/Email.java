package validation;

import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.MessagingException;

public class Email {

    //prj301fptuniversity@gmail.com
    //eljn iunx ufhd ajsp
    public static final String MYEMAIL = "prj301fptuniversity@gmail.com";
    public static final String PASSWORD = "eljn iunx ufhd ajsp";
    public static final String DEBUG = "true";
    public static final String SOCKET_FACTORY = "javax.net.ssl.SSLSocketFactory";
    public static final String SUBJECTVERIFICATIONCODE = "Verification code";
    public static final String VERIFICATIONCODE = "Your Verification code is: ";
    public static final String NEWPASSWORD = "Your news password is: ";
    public static final String SUBJECTNEWPASSWORD = "Reset Password";
    public static final String SUBJECTNEWUSERNAME = "New Account";
    public static final String NEWUSERNAME = "You have been granted an account to log into the FAP system.\n Your username is: ";

    public static boolean sendTo(String to, String subject, String content) {

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        props.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        //create Authenticator
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                System.out.println("check pass");
                return new PasswordAuthentication(MYEMAIL, PASSWORD);
            }
        };
        //create session
        Session session = Session.getInstance(props, auth);
        //create message
        MimeMessage message = new MimeMessage(session);
        System.out.println("check session");
        try {
            //create message
            //content type
            message.addHeader("Content-type", "text/HTML");

            message.setFrom(MYEMAIL);
            //nguoi nhan
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            //Subject
            message.setSubject(subject);
            //content
            message.setContent(content, "text/plain");
            //send
            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean sendVerificationCode(String to, String code) {
        return sendTo(to, SUBJECTVERIFICATIONCODE, "Hello " + extractUsername(to) + "\n" +  VERIFICATIONCODE + code + ".\n" + "Use this code to verify your account. Please do not share this code with anyone.");
    }

    public static boolean sendNewPassword(String to, String password) {
        return sendTo(to, SUBJECTNEWPASSWORD, NEWPASSWORD + password + ".\n" + "Use this password to login your account. Please do not share this password with anyone.");
    }

    public static boolean sendEmail(String to, String subject, String content) {
        return sendTo(to, subject, content);
    }

    public static boolean sendNewUsername(String to, String username, String password) {
        return sendTo(to, SUBJECTNEWUSERNAME, NEWUSERNAME + username + ".\n "
                + "Your password is: " + "Use this username and password to login your account. Please do not share this username with anyone.");
    }

    public static void main(String[] args) {
      
        System.out.println(sendVerificationCode("namnphe170040@fpt.edu.vn", "122345"));
    }

    static String extractUsername(String email) {
        String[] parts = email.split("@");
        if (parts.length == 2) {
            return parts[0];
        }
        return null; // Invalid email format
    }
}
