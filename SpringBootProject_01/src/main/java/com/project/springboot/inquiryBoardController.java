package com.project.springboot;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.springboot.dao.BoardPage;
import com.project.springboot.dao.inquiryBoardSevice;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class inquiryBoardController
{
	@Autowired
	inquiryBoardSevice bbs;
	
	
	// 문의 게시판 리스트
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
		String idx = request.getParameter("idx");
		model.addAttribute("dto", bbs.viewDao(idx));
		bbs.viewCountDao(idx);
		
		return "member/inquiryBoardview";
	}
	
	//문의 게시판 글쓰기폼
	@RequestMapping("member/inquiryBoardWriteForm")
	public String inquiryBoardWriteForm(Model model)
	{
		return "member/inquiryBoardWriteForm";
	}
	
	//문의 게시판 글쓰기
	@RequestMapping("member/inquiryBoardWrite")
	public String inquiryBoardWrite(HttpServletRequest request, Model model) throws FileNotFoundException
	{		
		Map<String, String> map = new HashMap<String, String>();	 
		
		String sId = request.getParameter("id");
		String sTitle = request.getParameter("title");
		String sContent = request.getParameter("content");
		String sBoardPass = request.getParameter("boardPass");		
		map.put("item1", sId);
		map.put("item2", sTitle);
		map.put("item3", sContent);
		map.put("item6", sBoardPass);
		
		
	

		int nResult = bbs.writeDao(map);
		System.out.println("Write : " + nResult);
		
		return "redirect:../guest/inquiryBoard";
	}	
	
	//문의 게시판 답글 글쓰기 폼
		@RequestMapping("admin/inquiryBoardReplyWriteForm")
		public String inquiryBoardReplyWriteForm(HttpServletRequest request,Model model)
		{
			String xIdx = request.getParameter("idx");
			
			
			//model.addAttribute("xIdx", xIdx);
			model.addAttribute("dto", bbs.viewDao(xIdx));
			return "admin/inquiryBoardReplyWriteForm";
		}
	
	//문의 게시판 글쓰기
	@RequestMapping("admin/inquiryBoardReplyWrite")
	public String replyWriteDao(HttpServletRequest request, Model model) throws FileNotFoundException
	{		
		Map<String, String> map = new HashMap<String, String>();	 
		
		String sIdx = request.getParameter("idx");
		String sId = request.getParameter("id");
		String sTitle = request.getParameter("title");
		String sContent = request.getParameter("content");
		String sBoardPass = request.getParameter("boardPass");		
		map.put("item1", sId);
		map.put("item2", sTitle);
		map.put("item3", sContent);
		map.put("item6", sBoardPass);
		map.put("item7", sIdx);
		
		
//		try {
//			String  filePath = ResourceUtils
//					// 업로드된 파일을 저장할 폴더의 위치를 지정한다.
//					.getFile("classpath:static/inquiryBoardUpload/").toPath().toString();
//			System.out.println(filePath);	
//			
//			String sOfile = FileUtil.uploadFile(request, filePath);
//			String sSfile = FileUtil.renameFile(filePath, sOfile);
//			
//			if(!sOfile.isEmpty()) {
//				map.put("item4", sOfile);
//				map.put("item5", sSfile);
//			}			
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		int nResult = bbs.replyWriteDao(map);
		System.out.println("Write : " + nResult);
		
		return "redirect:../guest/inquiryBoard";
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
		model.addAttribute("dto", bbs.viewDao(idx));
		return "member/inquiryBoardEditorForm";
	}
	
	//문의 게시판 수정
	@RequestMapping("member/inquiryBoardEditor")
	public String inquiryBoardEditor(HttpServletRequest request, Model model)
	{
		String idx = request.getParameter("idx");		
		String sId = request.getParameter("id");
		String sTitle = request.getParameter("title");
		String sContent = request.getParameter("content");
		String sBoardPass = request.getParameter("boardPass");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("midx", idx);
		map.put("mId", sId);
		map.put("mTitle", sTitle);
		map.put("mContent", sContent);
		map.put("mBoardPass", sBoardPass);
		
//		try {
//			String  filePath = ResourceUtils
//					// 업로드된 파일을 저장할 폴더의 위치를 지정한다.
//				  .getFile("classpath:static/inquiryBoardUpload/").toPath().toString();
//			System.out.println(filePath);	
//			
//			String sOfile = FileUtil.uploadFile(request, filePath);
//			String sSfile = FileUtil.renameFile(filePath, sOfile);
//			
//			if(!sOfile.isEmpty()) {
//				map.put("mOfile", sOfile);
//				map.put("mSfile", sSfile);
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
		bbs.editorDao(map);
		
		return "redirect:../guest/inquiryBoard";
	}
	
	@RequestMapping("member/inquiryBoardlikeCount")
	public String inquiryBoardlikeCount(HttpServletRequest request, Model model)
	{
		String idx = request.getParameter("idx");
		model.addAttribute("dto", bbs.likeCountDao(idx));
		String referer = request.getHeader("Referer");
		
		return "redirect:"+ referer;
	}
	
	
	
	
	
	
	
}