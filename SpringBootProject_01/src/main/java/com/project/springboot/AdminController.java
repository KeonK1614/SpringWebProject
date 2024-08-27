package com.project.springboot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.springboot.dao.BoardPage;
import com.project.springboot.dto.ParameterDTO;
import com.project.springboot.dto.AdminMemberDTO;
import com.project.springboot.dto.AdminService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class AdminController {
	@Autowired
	AdminService dao;
	@Autowired
	UserService userService;
	
//	@RequestMapping("/admin/list")
//	public String member(Model model, AdminMemberDTO adminMemberDTO)
//	{
//		model.addAttribute("memberList", dao.select(adminMemberDTO));
//		return "admin/userlist";
//	}
	
	@RequestMapping("/admin/list")
	public String userListPage(HttpServletRequest req, Model model, ParameterDTO pDto)
	{
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
		
		int totalCount = dao.getTotalCount(pDto);
		int pageSize = 10;
		int blockPage = 5;
		
		int pageNum = (req.getParameter("pageNum")) == null || req.getParameter("pageNum").equals("")
				? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		
		pDto.setStart(start);
		pDto.setEnd(end);
		
		Map<String, Object> maps = new HashMap<>();
		maps.put("totalCount", totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
		model.addAttribute("maps" , maps);
		
		List<AdminMemberDTO> lists = dao.userListPage(pDto);
		model.addAttribute("lists", lists);
		
	      String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
	              blockPage, pageNum, "../admin/list", searchField, searchWord);
	      
	      model.addAttribute("pagingImg" , pagingImg);
	
		return "admin/userlist";
	}
	
	
	@RequestMapping(value="admin/userEdit", method=RequestMethod.GET)
	public String memberView(HttpServletRequest req, AdminMemberDTO adminMemberDTO, Model model) 
	{
		adminMemberDTO = dao.selectOne(req.getParameter("id"));
		model.addAttribute("dto", adminMemberDTO);
		return "admin/userEdit";
	}
	
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
