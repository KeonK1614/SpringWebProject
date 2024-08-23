package com.project.springboot;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.springboot.dao.BoardPage;
import com.project.springboot.dao.IBoardInfoDao;
import com.project.springboot.dto.BoardInfoDto;
import com.project.springboot.dto.ParameterDTO;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class BoardInfoController
{
	@Autowired
	ServletContext context;
	@Autowired
	IBoardInfoDao dao;

	 
	@RequestMapping("/")
	public String root() throws Exception
	{
		return "guest/main";
	}

	
	@RequestMapping("/guest/boardInfo")
	public String userListPage(HttpServletRequest req, Model model, ParameterDTO pDto)
	{
		int totalCount = dao.getTotalCount(pDto);
		int pageSize = 10;
		int blockPage = 5;
		String searchField = req.getParameter("searchField");
		System.out.println(searchField);
		String searchWord = req.getParameter("searchWord");
		System.out.println(searchWord);

		
		int pageNum = (req.getParameter("pageNum")) == null || req.getParameter("pageNum").equals("")
				? 1 : Integer.parseInt(req.getParameter("pageNum"));
		int start = (pageNum - 1) * pageSize + 1;
		int end = pageNum * pageSize;
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage,
									pageNum, "../guest/boardInfo", searchField, searchWord);
		
		pDto.setStart(start);
		pDto.setEnd(end);
		
		Map<String, Object> maps = new HashMap<>();
		if (searchWord != null) {
            maps.put("searchField", searchField);
            maps.put("searchWord", searchWord);
        }
		
		maps.put("totalCount", totalCount);
		maps.put("pageSize", pageSize);
		maps.put("pageNum", pageNum);
	    
		model.addAttribute("pagingImg", pagingImg); // 목록 하단에 출력할 페이지 번호

		model.addAttribute("maps" , maps);
		
		List<BoardInfoDto> lists = dao.listDao(pDto);
		model.addAttribute("list", lists);
	
		return "guest/boardInfo";
	}
	
	@RequestMapping("/member/write")
	public String write(HttpServletRequest req, @RequestParam("file") MultipartFile file) throws Exception
	{	
		String ofileName = file.getOriginalFilename();
		String uploadDir = context.getRealPath("/static/files");
		File dir = new File(uploadDir);
		if (!dir.exists()) {
	        dir.mkdirs();
	    }
		String sfileName = UUID.randomUUID().toString() + "_" + ofileName;
		
		File destination = new File(dir,sfileName);
		try {
			file.transferTo(destination);
			
		} catch (IOException e) {
			e.printStackTrace();
			return "redirect:/member/boardWrite?status=fail";
		}
		
		String sId = SecurityContextHolder.getContext().getAuthentication().getName();

		dao.writeDao(sId,
					req.getParameter("title"),
					req.getParameter("content"),
					ofileName,
					sfileName);
		
		return "redirect:/guest/boardInfo";
	}
	
	@RequestMapping("/member/boardWrite")
	public String boardWrite()
	{		
		return "member/boardWrite";
	}

	@RequestMapping("/member/delete")
	public String delete(HttpServletRequest req)
	{
		dao.deleteDao(req.getParameter("idx"));
		return "redirect:/guest/boardInfo";
		
	}
	
	@RequestMapping("/guest/boardView")
	public String boardView(HttpServletRequest req, Model model)
	{
		String sIdx = req.getParameter("idx");
		BoardInfoDto dto = dao.viewDao(sIdx);
		model.addAttribute("dto", dto);
		dao.updateViewCount(sIdx);
		
		String ext = null, fileName = dto.getSfile();
		if (fileName != null) {
			ext = fileName.substring(fileName.lastIndexOf(".")+1);
		}
		String[] mimeStr = {"png", "jpg", "gif", "PNG","jpeg", "bmp"};
		List<String> mimeList = Arrays.asList(mimeStr);
		boolean isImage=false;
		if(mimeList.contains(ext)) {
			isImage=true;
		}
		model.addAttribute("isImage", isImage);
		
		return "guest/boardView";
	}
	
	@RequestMapping("/member/boardEditor")
	public String boardEditor(HttpServletRequest req, Model model)
	{
		String sIdx = req.getParameter("idx");
		BoardInfoDto dto = dao.viewDao(sIdx);

		model.addAttribute("dto", dto);
		model.addAttribute("existingOfile", dto.getOfile());
		model.addAttribute("existingSfile", dto.getSfile());
		return "member/boardEditor";
	}
	
	@RequestMapping("/member/edit")
	public String edit(HttpServletRequest req, @RequestParam("file") MultipartFile file, Model model) {
		String sIdx = req.getParameter("idx");
		
		BoardInfoDto dto = dao.viewDao(sIdx);
		String ofileName = dto.getOfile();//dto로  
		String sfileName = dto.getSfile();
		
		if (!file.isEmpty()) {
			ofileName = file.getOriginalFilename();
			sfileName = UUID.randomUUID().toString() + "_" + ofileName;
			String uploadDir = context.getRealPath("/static/files");

			File dir = new File(uploadDir);
			if (!dir.exists()) {
		        dir.mkdirs();
		    }
			
			File destination = new File(dir,sfileName);
			try {
				file.transferTo(destination);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		model.addAttribute("dto", dao.editDao(req.getParameter("idx"),
											req.getParameter("id"),
											req.getParameter("title"),
											req.getParameter("content"),
											ofileName,
											sfileName));
	
		return "redirect:/guest/boardView?idx=" + sIdx;
	}
	
	@RequestMapping("/member/like")
	public String addLike(HttpServletRequest req, Model model) {
		String sIdx = req.getParameter("idx");
		dao.addLike(sIdx);
		return "redirect:/guest/boardInfo";
	}	
}