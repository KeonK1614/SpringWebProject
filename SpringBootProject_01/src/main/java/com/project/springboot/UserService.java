package com.project.springboot;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.project.springboot.jdbc.AdminService;
import com.project.springboot.jdbc.IDao;
import com.project.springboot.jdbc.UserDTO;

@Service
public class UserService {

	@Autowired
	private IDao idao;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private AdminService admin;
	
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
	
	public void updateUserAuth(String id, String authority) {
		Map<String, Object> params = new HashMap<>();
        params.put("id", id);
        params.put("authority", authority);
        
        int rowsAffected = admin.updateUserAuth(params);
        if (rowsAffected == 0) {
            // 처리: 업데이트된 행이 없다는 것은 사용자가 없거나 ID가 잘못된 경우일 수 있음
            throw new RuntimeException("User not found or update failed");
        }
    }
	
	public void updateEnabled(String id, int enabled) {
		Map<String, Object> params = new HashMap<>();
		params.put("id", id);
		params.put("enabled", enabled);
		
		int rowsAffected = admin.updateEnabled(params);
		if (rowsAffected == 0) {
			// 처리: 업데이트된 행이 없다는 것은 사용자가 없거나 ID가 잘못된 경우일 수 있음
			throw new RuntimeException("User not found or update failed");
		}
	}
	
	
}
