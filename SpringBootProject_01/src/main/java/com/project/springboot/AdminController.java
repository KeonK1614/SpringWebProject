package com.project.springboot;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.springboot.dao.IMemberDao;
import com.project.springboot.dao.PagingUtil;
import com.project.springboot.dto.AdminMemberDTO;
import com.project.springboot.dto.AdminService;
import com.project.springboot.dto.ParameterDTO;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	@Autowired
	AdminService admindao;
	@Autowired
	UserService userService;
	@Autowired
	IMemberDao dao;
	

	
//	@RequestMapping("/admin/list")
//	public String member(Model model, AdminMemberDTO adminMemberDTO)
//	{
//		model.addAttribute("memberList", dao.select(adminMemberDTO));
//		return "admin/userlist";
//	}
	
	//회원 전체목록 보기
	@RequestMapping("/admin/list")
	public String userListPage(HttpServletRequest req, Model model, ParameterDTO pDto)
	{		
		PagingUtil.pagingAndSearch(req, model, pDto, dao);
		
		List<AdminMemberDTO> lists = admindao.userListPage(pDto);
		model.addAttribute("lists", lists);
		
		return "admin/userlist";
	}
	
	//일반회원 목록 보기
	@RequestMapping("/admin/locaList")
	public String localuserListPage(HttpServletRequest req, Model model, ParameterDTO pDto)
	{		
		PagingUtil.pagingAndSearch(req, model, pDto, dao);
		
		List<AdminMemberDTO> lists = admindao.localMemList(pDto);
		model.addAttribute("lists", lists);
		
		return "admin/LocalList";
	}
	
	//회원 개인정보 상세 보기
	@RequestMapping(value="admin/userEdit", method=RequestMethod.GET)
	public String memberView(HttpServletRequest req, AdminMemberDTO adminMemberDTO, Model model) 
	{
		adminMemberDTO = admindao.selectOne(req.getParameter("id"));
		model.addAttribute("dto", adminMemberDTO);
		return "admin/userEdit";
	}
	
	//권한 수정
	@PostMapping("/admin/updateAuth")
    public ModelAndView updateUserAuthority(@RequestParam("id") String id,
                                            @RequestParam("authority") String authority) {
        try {
            userService.updateUserAuth(id, authority);
        } catch (RuntimeException e) {
            // 예외 처리 및 사용자에게 오류 메시지 전달
        	 return new ModelAndView("security/AdminUpdateError");
        }
        return new ModelAndView("redirect:/admin/list");
    }
	
	//회원 활성화 비활성화 수정
	@PostMapping("/admin/updateEnabled")
    public ModelAndView updateUseEnabled(@RequestParam("id") String id,
                                            @RequestParam("enabled") int enabled) {
        try {
            userService.updateEnabled(id, enabled);
        } catch (RuntimeException e) {
            // 예외 처리 및 사용자에게 오류 메시지 전달
            return new ModelAndView("security/AdminUpdateError");
        }
        return new ModelAndView("redirect:/admin/list");
    }
}
