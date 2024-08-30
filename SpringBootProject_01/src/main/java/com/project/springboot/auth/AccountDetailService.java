package com.project.springboot.auth;

import org.springframework.beans.factory.annotation.Autowired;
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
	private static final long LOCK_TIME_DURATION = 15 * 60 * 1000; // 15분 동안 계정 잠김

	@Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
//		System.out.println("user detail method called");
        UserDTO dto = idao.findByUsername(id);
        
       	if (dto != null) {
            // 실패 횟수 리셋
            int failCount = 0;
           
            // 잠금 시간 확인 및 잠금 해제
           
            long currentTime = System.currentTimeMillis();

            if (dto.getIsLock() == 1 && dto.getFailCount() < 5 && dto.getFailCount() >= 1) {
              
                idao.updateFailCount(failCount, id);
                
            } else if (dto.getIsLock() == 0 && currentTime - dto.getLockTime().getTime() > LOCK_TIME_DURATION){
            	idao.updateUnLock(1, failCount, id);
            }
    	}
        
        if (dto == null) {
        	throw new UsernameNotFoundException("아이디나 비밀번호를 확인해주세요");
        	
        }

//        // 계정 잠금 상태 확인
//        if (dto.getIsLock() == 0) { // 0은 잠금 상태를 나타냄
//            throw new UsernameNotFoundException("계정이 잠겨 있습니다. 관리자에게 문의하세요.");
//        }
//        return User
//                .withUsername(dto.getId())
//                .password(dto.getPass())
//                .authorities(dto.getAuthority())
//                .disabled(dto.getEnabled() == 0)  // 계정 비활성화 여부 설정// 권한 설정
//                .build();
        
        return new AccountDetails(dto);
    }
}
