package com.project.springboot.auth;


import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.project.springboot.jdbc.UserDTO;

import lombok.Data;

@Data
public class AccountDetails implements UserDetails {

	private static final long serialVersionUID = 1L; 
	private UserDTO user;
	
	public AccountDetails(UserDTO user) {
		this.user=user;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		 ArrayList<GrantedAuthority> authorities = new ArrayList<>();
		 String role = user.getAuthority();
	        authorities.add(new SimpleGrantedAuthority(role)); 
	        return authorities;
	
	}

	@Override
	public String getPassword() {
		return user.getId();
	}

	@Override
	public String getUsername() {
		return user.getPass();
	}
	
	@Override
    public boolean isAccountNonExpired() {
        return true;
    }
    
	//계정 안 잠김?
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }
    
	//계정 Credential 안 만료됨?
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
	
    //비활성화 되지 않음? (오랫동안 사용하지 않은 경우 등)
    @Override
    public boolean isEnabled() {
        return true;
    }
}
