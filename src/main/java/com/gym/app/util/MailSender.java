package com.gym.app.util;


import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSender {
	public void sendMail(String getId, String getPw, String userEmail) {

		Properties p = new Properties();
		p.put("mail.smtp.user", "ledaulli@gmail.com");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "587");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");

		p.put("mail.smtp.debug", "true");
/*		p.put("mail.smtp.socketFactory.port", "25");
		p.put("mail.smtp.socketFactory.fallback", "false");
*/
		try {
			Authenticator auth = new SMTPAuthenticator();
			Session session = Session.getInstance(p, auth);
			session.setDebug(true);
			MimeMessage msg = new MimeMessage(session);
			String message = "";
			if (!getId.equals("none")) {
				message = "귀하의 아이디는 [ " + getId + " ] 입니다. \n\r 귀하의 비밀번호는 [ " + getPw + " ] 입니다.";
				msg.setSubject("[발송용/회신x] 월드짐 ID/비밀번호 찾기 메일입니다. ");
			}
			// 보내는 사람의 메일주소
			Address fromAddr = new InternetAddress("forteleaf@hotmail.com");
			msg.setFrom(fromAddr);
			// 받는 사람의 메일주소
			Address toAddr = new InternetAddress(userEmail);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(message, "text/plain;charset=UTF-8");
			// 메세지 전송
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private class SMTPAuthenticator extends javax.mail.Authenticator {
		public PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication("ledaulli@gmail.com", "shuria40");
		}
	}
}
