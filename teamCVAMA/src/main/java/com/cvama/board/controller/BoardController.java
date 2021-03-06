package com.cvama.board.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.cvama.board.dto.BoardDTO;
import com.cvama.board.service.BoardService;
import com.cvama.board.service.BoardServiceImpl;
import com.cvama.util.page.PageObject;
import com.cvama.util.file.FileUtil;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
//생성자에 의해서 멤버변수를 초기화시키는 작업을 한다.
//멤버 변수 중에서 직접 지정한 변수들을 따로 초기화 작업을 한 경우 -> @Autowired나 @Inject사용
//@AllArgsConstructor
public class BoardController {
	@Qualifier("bs")
	@Autowired
	private BoardService boardService;
	
	private final String module = "board";
	//1. 게시판 리스트
	@GetMapping("/list.do")
	public String list(Model model, PageObject pageObject) {
		model.addAttribute("list", boardService.list(pageObject));
		System.out.println("PO:"+pageObject);
		model.addAttribute("pageObject",pageObject);
		return module+"/list";
	}
	//1-2. 인기글 리스트
	@GetMapping("/plist.do")
	public String plist(Model model, PageObject pageObject) {
		model.addAttribute("list", boardService.plist(pageObject));
		System.out.println("PO:"+pageObject);
		model.addAttribute("pageObject",pageObject);
		return module+"/plist";
	}
	//2.게시판 글보기
	@GetMapping("/view.do")
	public String view(Model model, int no) {
		model.addAttribute("viewDTO", boardService.view(no));
		return module+"/view";
	}
	
	//3. 게시판 글쓰기
	@PostMapping("/write.do")
	public String write(BoardDTO dto,MultipartFile multiFile, HttpSession session, HttpServletRequest request) throws Exception {
		if(!(multiFile.isEmpty())) {
			dto.setMultiFile(multiFile);
			
			//파일 저장 처리
	//		String uploadFolder = "D:\\workspace\\spring\\ex02\\src\\main\\webapp\\upload\\image";
			String uploadFolder = request.getServletContext().getRealPath("/upload/image");
			File saveFile = FileUtil.removeDuplicateFileName(uploadFolder, multiFile.getOriginalFilename());
			try {
				multiFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}//endcatch
			
			//db에 저장할 파일 이름 세팅
			dto.setFileName("/upload/image/"+saveFile.getName());
		}
		System.out.println("*** ImageController.write().dto:"+dto);
		boardService.write(dto);
		return "redirect:list.do";
	}
	//3-2. 게시판 글쓰기 폼
	@GetMapping("/write.do")
	public String writeForm() {
		
		return module+"/write";
	}
	//3-3. 게시판 답글쓰기
	@PostMapping("/rewrite.do")
	public String rewrite(BoardDTO dto,MultipartFile multiFile, HttpSession session, HttpServletRequest request) throws Exception {
		if(!(multiFile.isEmpty())) {
			dto.setMultiFile(multiFile);
			
			//파일 저장 처리
	//		String uploadFolder = "D:\\workspace\\spring\\ex02\\src\\main\\webapp\\upload\\image";
			String uploadFolder = request.getServletContext().getRealPath("/upload/image");
			File saveFile = FileUtil.removeDuplicateFileName(uploadFolder, multiFile.getOriginalFilename());
			try {
				multiFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}//endcatch
			
			//db에 저장할 파일 이름 세팅
			dto.setFileName("/upload/image/"+saveFile.getName());
		}
		dto.setGroupLayer(dto.getGroupLayer()+1);
		dto.setGroupOrd(dto.getGroupOrd()+1);
		System.out.println("*** ImageController.rewrite().dto:"+dto);
		boardService.rewrite(dto);
		return "redirect:list.do";
	}
	//3-4. 게시판 답글쓰기 폼
	@GetMapping("/rewrite.do")
	public String rewriteForm(Model model, int no) {
		model.addAttribute("dto", boardService.view(no));
		return module+"/rewrite";
	}
	//4. 게시판 글수정
	@PostMapping("/update.do")
	public String update(BoardDTO dto,MultipartFile multiFile, HttpSession session, HttpServletRequest request) throws Exception {
		
		if(!(multiFile.isEmpty())) {
			dto.setMultiFile(multiFile);
			System.out.println("originName:"+multiFile.getOriginalFilename()+"/");
			//파일 저장 처리
//			String uploadFolder = "D:\\workspace\\spring\\ex02\\src\\main\\webapp\\upload\\image";
			String uploadFolder = request.getServletContext().getRealPath("/upload/image");
			File saveFile = FileUtil.removeDuplicateFileName(uploadFolder, multiFile.getOriginalFilename());
			try {
				multiFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			}//endcatch
			
			//db에 저장할 파일 이름 세팅
			dto.setFileName("/upload/image/"+saveFile.getName());
		}
		
		boardService.update(dto);
		return "redirect:view.do?no="+dto.getNo();
	}
	//4-2. 게시판 글수정폼
	@GetMapping("/update.do")
	public String updateForm(Model model, int no) {
		model.addAttribute("dto", boardService.view(no));
		return module+"/updateForm";
	}
	//5. 게시판 글삭제
	@PostMapping("/delete.do")
	public String delete(BoardDTO dto) {
		boardService.delete(dto);
		return "redirect:list.do";
	}
	
}
