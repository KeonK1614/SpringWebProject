package com.project.springboot;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.springboot.dao.BoardPage;
import com.project.springboot.dao.InoticeBoardDao;
import com.project.springboot.dto.noticeBoardDto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class noticeController
{
	@Autowired
	ServletContext context;
	
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
	public String noticeWriteForm()
	{
		return "admin/noticeWriteForm";
	}
	
	@RequestMapping("/admin/noticeWrite")
	public String noticeWrite(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws Exception
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
		
		dao.writeDao(request.getParameter("id"),
					 request.getParameter("title"),
					 request.getParameter("content"),
					 ofileName,
					 sfileName);
		
		return "redirect:../guest/noticeBoard";
	}
	
	@RequestMapping("/guest/noticeView")
	public String noticeView(HttpServletRequest request, Model model)
	{
		String sIdx = request.getParameter("idx");
		noticeBoardDto dto = dao.viewDao(sIdx);
		model.addAttribute("dto", dto);
		dao.viewCountDao(sIdx);
		
		String ext = null, fileName = dto.getSfile();
		if (fileName != null) 
		{
			ext = fileName.substring(fileName.lastIndexOf(".")+1);
		}
		String[] mimeStr = {"png", "jpg", "gif", "PNG","jpeg", "bmp"};
		List<String> mimeList = Arrays.asList(mimeStr);
		boolean isImage=false;
		if(mimeList.contains(ext)) 
		{
			isImage=true;
		}
		model.addAttribute("isImage", isImage);
		
		
		return "guest/noticeView";
	}
	
	@RequestMapping("/admin/noticeEditorForm") 
	public String noticeEditorForm(HttpServletRequest request, Model model)
	{
		String sIdx = request.getParameter("idx");
		noticeBoardDto dto = dao.viewDao(sIdx);
		
		model.addAttribute("dto", dto);
		model.addAttribute("existingOfile", dto.getOfile());
		model.addAttribute("existingSfile", dto.getSfile());
		
		return "admin/noticeEditorForm";
	}
	
	@RequestMapping("/admin/noticeEditor")
	public String noticeEditor(HttpServletRequest request, @RequestParam("file") MultipartFile file, Model model) 
	{
		String sIdx = request.getParameter("idx");
		
		noticeBoardDto dto = dao.viewDao(sIdx);
		String ofileName = dto.getOfile();
		String sfileName = dto.getOfile();
		
		if (!file.isEmpty()) 
		{
			ofileName = file.getOriginalFilename();
			sfileName = UUID.randomUUID().toString() + "_" + ofileName;
			String uploadDir = context.getRealPath("/static/files");

			File dir = new File(uploadDir);
			if (!dir.exists()) 
			{
		        dir.mkdirs();
		    }
			
			File destination = new File(dir,sfileName);
			try 
			{
				file.transferTo(destination);
			} catch (IllegalStateException e) 
			{
				e.printStackTrace();
			} catch (IOException e) 
			{
				e.printStackTrace();
			}
		}
		
		model.addAttribute("dto", dao.editorDao(request.getParameter("idx"),
												request.getParameter("title"),
												request.getParameter("content"),
												ofileName,
												sfileName));
		
		return "redirect:../guest/noticeView?idx=" + sIdx;
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
		
		return "redirect:../guest/noticeView?idx=" + sIdx;
	}
	
}