package com.project.springboot.email;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import jakarta.mail.MessagingException;
import jakarta.mail.internet.MimeMessage;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class pwdEmailService {
	
	@Autowired
	private emailMapper emailMapper;
	@Autowired
	private final JavaMailSender javaMailSender;
	@Autowired
	private final RedisUtil redisUtil;

	
	private String createdPwCode() {  
		int[] lowerCase = {97, 122}; // a-z
        int[] upperCase = {65, 90};  // A-Z
        int[] digits = {48, 57};     // 0-9
        int[] specialChars = {33, 47, 58, 64, 91, 96, 123, 126}; // !@#$%^*+=- 

        // Combine all ranges
        int[] allRanges = new int[]{
            lowerCase[0], lowerCase[1],
            upperCase[0], upperCase[1],
            digits[0], digits[1],
            specialChars[0], specialChars[1],
            specialChars[2], specialChars[3],
            specialChars[4], specialChars[5],
            specialChars[6], specialChars[7]
        };

        int targetStringLength = 8; // Adjust length as needed
        Random random = new Random();

        // Generate code
        return random.ints(targetStringLength, 0, allRanges.length / 2)
            .map(i -> {
                int rangeIndex = i * 2;
                int leftLimit = allRanges[rangeIndex];
                int rightLimit = allRanges[rangeIndex + 1] + 1;
                return random.nextInt(rightLimit - leftLimit) + leftLimit;
            })
            .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
            .toString();
	}
	
	 public MimeMessage createPwEmail(String email, String newPass) {
	    	 MimeMessage message = javaMailSender.createMimeMessage();
	        
	        try {
	            message.setFrom("yenoraeng_42@naver.com");
	            message.setRecipients(MimeMessage.RecipientType.TO, email);
	            message.setSubject("안녕하세요 이메일입니다.");
	            String body = "";
	            body += "<h3>" + "비밀번호 찾기를 통한 임시 비밀번호 입니다." + "</h3>";
	            body += "<h1>" + "임시비밀번호 : " + newPass + "</h1>";
	            body += "<h3>" + "로그인 후 비밀번호를 변경해주세요." + "</h3>";
	            body += "<h3>" + "감사합니다." + "</h3>";
	            body += "<a href='http://localhost:8081/security/loginform"+
					">로그인 페이지</a>";
	            message.setText(body,"UTF-8", "html");
	            
	            redisUtil.setDataExpire(email, newPass, 60 * 30L);
	            
	            
	        } catch (MessagingException e) {
	            e.printStackTrace();
	        }

	        return message;
	    }
	 
	    public void sendEmail(String toEmail,  String newPass) throws MessagingException {
	    	 if (redisUtil.existData(toEmail)) {  
	    	        redisUtil.deleteData(toEmail);  
	    	    }  
	    	  
	    	    MimeMessage emailForm = createPwEmail(toEmail, newPass);  
	    	  
	    	    javaMailSender.send(emailForm);  
	    }
	 
	    @Transactional
	    public String createTemporaryPassword(String id, String email) {
	        String newPass = createdPwCode(); // 임시 비밀번호 생성

	        try {
	            Integer userCount = emailMapper.findPwCheck(id, email);
	            if (userCount == null || userCount == 0) {
	                throw new IllegalStateException("User not found for the given id and email");
	            }

	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new RuntimeException("Error while creating or updating the temporary password", e);
	        }

	        return newPass;
	    }
	 
	 // 비밀번호 검증 및 업데이트 메서드
	    @Transactional
	    public boolean verifyAndUpdatePassword(String email, String newPass) throws Exception {
	    	String codePass = redisUtil.getData(email);	       
	    	if(codePass == null) {  
	                return false;  
	            }  
	            return codePass.equals(newPass);  
	    }

}
