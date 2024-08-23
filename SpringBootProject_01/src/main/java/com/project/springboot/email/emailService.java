package com.project.springboot.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.project.springboot.jdbc.UserDTO;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class emailService {
	@Autowired
	private emailMapper emailMapper;
	@Autowired
	private final JavaMailSender javaMailSender;
	@Autowired
	private static int number;

	
	public static void createNumber() {
        number = (int)(Math.random() * (90000)) + 100000; //(int) Math.random() * (최댓값-최소값+1) + 최소값
    }

    public MimeMessage CreateMail(String email) {
        createNumber();
        MimeMessage message = javaMailSender.createMimeMessage();

        try {
            message.setFrom("yenoraeng_42@naver.com");
            message.setRecipients(MimeMessage.RecipientType.TO, email);
            message.setSubject("아이디 찾기 인증 이메일입니다.");
            String body = "";
            body += "<h3>" + "요청하신 인증 번호입니다." + "</h3>";
            body += "<h1>" + number + "</h1>";
            body += "<h3>" + "감사합니다." + "</h3>";
            message.setText(body,"UTF-8", "html");
        } catch (MessagingException e) {
            e.printStackTrace();
        }

        return message;
    }

    public int sendMail(String email) {
        MimeMessage message = CreateMail(email);
        javaMailSender.send(message);

        return number;
    }
    
    public UserDTO findMemberId(String name, String email) {
        if (emailMapper == null) {
            throw new IllegalStateException("emailMapper is not initialized");
        }
        return emailMapper.findMemberId(name, email);
    }
    

}
