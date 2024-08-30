package com.project.springboot.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.springboot.dao.IMemberDao;
import com.project.springboot.dto.UserDTO;

@Service("userDetailsService")
public class AccountDetailService implements UserDetailsService {
	
	@Autowired
    private IMemberDao idao;

	@Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		System.out.println("user detail method called");
        UserDTO dto = idao.findByUsername(id);
        if (dto == null) {
        	throw new UsernameNotFoundException("User not found");
        }
        return User
                .withUsername(dto.getId())
                .password(dto.getPass())
                .authorities(dto.getAuthority())
                .disabled(dto.getEnabled() == 0)  // 계정 비활성화 여부 설정// 권한 설정
                .build();
    }
}
