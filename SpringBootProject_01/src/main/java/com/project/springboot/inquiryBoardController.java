package com.project.springboot;

import java.io.File;
import java.io.FileNotFoundException;
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
import com.project.springboot.dao.inquiryBoardSevice;
import com.project.springboot.dto.BoardInfoDto;
import com.project.springboot.dto.inquiryBoardDto;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class inquiryBoardController
{
	@Autowired
	inquiryBoardSevice bbs;
	@Autowired
	ServletContext context;
	
	// 문의 게시판 목록
	@RequestMapping("guest/inquiryBoard") 
	public String inquiryBoard(HttpServletRequest request, Model model)
	{
		Map<String, Object> map = new HashMap<String, Object>();
        
        // 검색
		String searchField = request.getParameter("searchField");
		String searchWord = request.getParameter("searchWord");
		
        if (searchWord != null) {
            map.put("searchField", searchField);
            map.put("searchWord", searchWord);
        }
        
        System.out.println(map.get("searchField"));
        System.out.println(map.get("searchWord"));
        
      // 페이징
      int totalCount = bbs.listCountDao(map); // 게시글 총 갯수
      int pageSize = 10; // 한 페이지 불러올 페이지
      int blockPage = 5; // 블럭 갯수 
      int pageNum = 1; // 목록 첫 진입시 무조건 1 페이지 
      //int totalPage = (int)Math.ceil((double)totalCount / pageSize);
      
      String pageTemp = request.getParameter("pageNum"); 
      if (pageTemp != null && !pageTemp.equals(""))
      	pageNum = Integer.parseInt(pageTemp);
      
      int start = (pageNum - 1) * pageSize + 1;	// 첫 게시물 번호
      int end = pageNum * pageSize;	// 마지막 게시물 번호
      
      map.put("start", start);
      map.put("end", end);
      
      String pagingImg = BoardPage.pagingStr(totalCount, pageSize,
              blockPage, pageNum, "../guest/inquiryBoard", searchField, searchWord);

	  model.addAttribute("searchField", searchField); // 받아온 검색위치
	  model.addAttribute("searchWord", searchWord); // 받아온 검색어
      model.addAttribute("pagingImg", pagingImg); // 목록 하단에 출력할 페이지 번호
      model.addAttribute("totalCount", totalCount); // 전체 게시물 갯수
      model.addAttribute("pageSize", pageSize); // 한 페이지당 출력할 게시물 갯수(설정값)
      model.addAttribute("pageNum", pageNum); // 현재 페이지 번호 
      model.addAttribute("list", bbs.listDao(map)); 

      return "guest/inquiryBoard";
	}
	
	//문의 게시판 상세보기
	@RequestMapping("member/inquiryBoardview")
	public String inquiryBoardview(HttpServletRequest request,Model model)
	{
		String sId = SecurityContextHolder.getContext().getAuthentication().getName();
		String idx = request.getParameter("idx");
		inquiryBoardDto dto  =  bbs.viewDao(idx);
		System.out.println(sId);
		System.out.println(dto.getId());
		model.addAttribute("dto", dto);
		bbs.viewCountDao(idx);
		
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
		model.addAttribute("Id", sId);
		
		
		return "member/inquiryBoardview";
	}
	
	//문의 게시판 글쓰기폼
	@RequestMapping("member/inquiryBoardWriteForm")
	public String inquiryBoardWriteForm(Model model)
	{
		
		String userId =SecurityContextHolder.getContext().getAuthentication().getName();		
		model.addAttribute("userId", userId);
		
		return "member/inquiryBoardWriteForm";
	}
	
	//문의 게시판 글쓰기
	@RequestMapping("member/inquiryBoardWrite")
	public String inquiryBoardWrite(HttpServletRequest request, @RequestParam("ofile") MultipartFile file) throws FileNotFoundException
	{	
		
		// 파일 업로드
		String ofileName = file.getOriginalFilename();
		String uploadDir = context.getRealPath("/static/files");
//		System.out.println("upload path" + uploadDir);
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
			return "redirect:/member/inquiryBoardWriteForm?status=fail";
		}
		
		String sId = SecurityContextHolder.getContext().getAuthentication().getName();
		String sTitle = request.getParameter("title");
		String sContent = request.getParameter("content");
		String sBoardPass = request.getParameter("boardPass");	
		System.out.println(sId);
		System.out.println(sTitle);
		System.out.println(sContent);
		System.out.println(sBoardPass);

		
		int nResult = bbs.writeDao(sId,
								   request.getParameter("title"),
								   request.getParameter("content"),
								   ofileName,
								   sfileName,
								   request.getParameter("boardPass"));
		System.out.println("Write : " + nResult);
		
		return "redirect:../guest/inquiryBoard";
	}	
	
	//문의 게시판 답글 글쓰기 폼
		@RequestMapping("admin/inquiryBoardReplyWriteForm")
		public String inquiryBoardReplyWriteForm(HttpServletRequest request,Model model)
		{
			String xIdx = request.getParameter("idx");
			
			model.addAttribute("dto", bbs.viewDao(xIdx));
			return "admin/inquiryBoardReplyWriteForm";
		}
	
	//문의 게시판 답변 글쓰기
	@RequestMapping("admin/inquiryBoardReplyWrite")
	public String replyWriteDao(HttpServletRequest request, @RequestParam("ofile") MultipartFile file ) throws Exception
	{		
		Map<String, String> map = new HashMap<String, String>();	 
		
		// 파일 업로드
		String ofileName = file.getOriginalFilename();
		String uploadDir = context.getRealPath("/static/files");
//		System.out.println("upload path" + uploadDir);
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
			return "redirect:/member/inquiryBoardReplyWrite?status=fail";
		}
		
		String sId = request.getParameter("id");
		String sTitle = request.getParameter("title");
		String sContent = request.getParameter("content");
		String sBoardPass = request.getParameter("boardPass");		
		String sIdx = request.getParameter("idx");
		map.put("item1", sId);
		map.put("item2", sTitle);
		map.put("item3", sContent);
		map.put("item4", ofileName);
		map.put("item5", sfileName);
		map.put("item6", sBoardPass);
		map.put("item7", sIdx);
		
		int nResult = bbs.replyWriteDao(map);
		System.out.println("Write : " + nResult);
		
		return "redirect:../guest/inquiryBoard";
	}
	
	//문의 게시글 삭제
		@RequestMapping("member/inquiryBoardDownload")
		public String inquiryBoardDownload(HttpServletRequest request, Model model)
		{
			String idx = request.getParameter("idx");

			model.addAttribute("dto", bbs.deleteDao(idx));
			return "redirect:../member/inquiryBoardview";
		}
	
	//문의 게시글 삭제
	@RequestMapping("member/inquiryBoardDelete")
	public String inquiryBoardDelete(HttpServletRequest request, Model model)
	{
		String idx = request.getParameter("idx");

		model.addAttribute("dto", bbs.deleteDao(idx));
		return "redirect:../guest/inquiryBoard";
	}
	
	@RequestMapping("member/inquiryBoardEditorForm")
	public String inquiryBoardEditorForm(HttpServletRequest request, Model model)
	{
		String idx = request.getParameter("idx");
		inquiryBoardDto dto = bbs.viewDao(idx);
		
		model.addAttribute("dto", dto);
		model.addAttribute("existingOfile", dto.getOfile());
		model.addAttribute("existingSfile", dto.getSfile());
		
		return "member/inquiryBoardEditorForm";
	}
	
	//문의 게시판 수정
	@RequestMapping("member/inquiryBoardEditor")
	public String inquiryBoardEditor(HttpServletRequest request,@RequestParam("ofile") MultipartFile file)
	{
		String idx = request.getParameter("idx");		
		
		inquiryBoardDto dto = bbs.viewDao(idx);
		String ofileName = dto.getOfile();
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
		
		String Id = dto.getId();
		String Title = request.getParameter("title");
		String Content = request.getParameter("content");
		String BoardPass = request.getParameter("boardPass");
		
		System.out.println(idx);
		System.out.println(Id);
		System.out.println(Title);
		System.out.println(Content);
		System.out.println(BoardPass);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("mId", Id);
		map.put("mTitle", Title);
		map.put("mContent", Content);
		map.put("moFileName", ofileName);
		map.put("msFileName", sfileName);
		map.put("mBoardPass", BoardPass);
		map.put("mIdx", idx);
		
		bbs.editorDao(map);
		
		return "redirect:../guest/inquiryBoard";
	}
	
//	@RequestMapping("member/inquiryBoardlikeCount")
//	public String inquiryBoardlikeCount(HttpServletRequest request, Model model)
//	{
//		String idx = request.getParameter("idx");
//		model.addAttribute("dto", bbs.likeCountDao(idx));
//		String referer = request.getHeader("Referer");
//		
//		return "redirect:"+ referer;
//	}
	
	
	
	
	
	
	
}