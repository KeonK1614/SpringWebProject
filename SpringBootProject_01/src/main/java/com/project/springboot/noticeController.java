package com.project.springboot;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.dao.InoticeBoardDao;
import com.project.springboot.dto.noticeBoardDto;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class noticeController
{
	@Autowired
	InoticeBoardDao dao;
	
	@RequestMapping("/guest/noticeBoard") // 공지사항 list
	public String noticeBoard(HttpServletRequest request, Model model)
	{
		
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchField", searchField);
		map.put("searchWord", searchWord);
		
		int totalCount = dao.totalCountDao(map);
		int pageSize = 10;
		int pageNum = 1;
		int blockPage = 5;
		String pageTemp = request.getParameter("pageNum");
		if (pageTemp != null && ! pageTemp.equals(""))
			pageNum = Integer.parseInt(pageTemp);
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
				
		map.put("start", start);
		map.put("end", end);
		
		
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "../guest/noticeBoard",
								searchField, searchWord);
		
		List<noticeBoardDto> list = dao.listDao(map);
		
		model.addAttribute("list", list);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("blockPage", blockPage);
		
		model.addAttribute("pagingImg", pagingImg);
		
		
		return "guest/noticeBoard";
	}
	
	@RequestMapping("/admin/noticeWriteForm") //공지사항 글쓰기 양식
	public String noticeWriteForm(Model model)
	{
		return "admin/noticeWriteForm";
	}
	
	@RequestMapping("/admin/noticeWrite")
	public String noticeWrite(HttpServletRequest request, Model model)
	{
		dao.writeDao(request.getParameter("id"),
					 request.getParameter("title"),
					 request.getParameter("content"),
					 request.getParameter("ofile"),
					 request.getParameter("sfile"));
		return "redirect:../guest/noticeBoard";
	}
	
	@RequestMapping("/guest/noticeView")
	public String noticeView(HttpServletRequest request, Model model)
	{
		String sIdx = request.getParameter("idx");
		model.addAttribute("dto", dao.viewDao(sIdx));
		dao.viewCountDao(sIdx);
		
		return "guest/noticeView";
	}
	
	@RequestMapping("/admin/noticeEditorForm") 
	public String noticeEditorForm(HttpServletRequest request, Model model)
	{
		String sIdx = request.getParameter("idx");
		model.addAttribute("dto", dao.viewDao(sIdx));
		return "admin/noticeEditorForm";
	}
	
	@RequestMapping("/admin/noticeEditor")
	public String noticeEditor(HttpServletRequest request, Model model) 
	{
		dao.editorDao(request.getParameter("title"),
					  request.getParameter("content"),
					  request.getParameter("ofile"),
					  request.getParameter("sfile"),
					  request.getParameter("idx"));
		
		return "redirect:../guest/noticeBoard";
	}
	
	@RequestMapping("/admin/noticeDelete")
	public String noticeDelete(HttpServletRequest request, Model model)
	{
		dao.deleteDao(request.getParameter("idx"));
		return "redirect:../guest/noticeBoard";
	}
	
	@RequestMapping("/member/noticeLike")
	public String noticeLike(HttpServletRequest request, Model model)
	{
		String sIdx = request.getParameter("idx");
		dao.likeCountDao(sIdx);
		
		return "redirect:../guest/noticeBoard";
	}
	
}