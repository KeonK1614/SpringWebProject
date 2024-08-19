package com.project.springboot.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.project.springboot.jdbc.IDao;
import com.project.springboot.jdbc.UserDTO;

@Service("userDetailsService")
public class AccountDetailService implements UserDetailsService {
	
	@Autowired
    private IDao idao;

	@Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        UserDTO dto = idao.findByUsername(id);
        if (dto == null) {
        	throw new UsernameNotFoundException("User not found");
        }
        return User
                .withUsername(dto.getId())
                .password(dto.getPass())
                .authorities(dto.getAuthority())  // 권한 설정
                .build();
    }
}
