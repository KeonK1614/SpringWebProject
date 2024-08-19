package com.project.springboot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.springboot.jdbc.IDao;
import com.project.springboot.jdbc.UserDTO;

@Service
public class UserService {

	@Autowired
	private IDao idao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public int joinDao(UserDTO user) {
		String encodedPassword = passwordEncoder.encode(user.getPass()); // 비밀번호 암호화
        user.setPass(encodedPassword);
		return idao.joinDao(user);
	}
	
	public boolean isUserIdCheck(String id) {
		
		return idao.idCheck(id) == 0;

	}
	
	public UserDTO findByUsername(String id) {
		
		return idao.findByUsername(id);
	};
	
	
}
