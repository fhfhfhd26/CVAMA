package com.cvama.clocalrep.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cvama.clocalrep.dto.ClocalReplyDTO;
import com.cvama.clocalrep.service.ClocalReplyService;
import com.cvama.util.page.PageObject;

import lombok.extern.log4j.Log4j;

// 멤버 변수 중에서 직접 지정한 변수들을 따로 초기화 작업을 한 경우 -> @Autowired나 @Inject 사용
//@AllArgsConstructor // 생성자에 의해서 멤버 변수를 초기화 시키는 작업을 한다.
// @Controller는 jsp로 포워드나 url로 리다이렉트 시키는 기능을 처리하기 위한 객체
// @RestController는 순수한 데이터를 전달하는 기능을 처리하기 위한 객체 (ex:json)
@RequestMapping("/clocalrep")
@Log4j
@RestController
public class ClocalReplyController {
	
	@Qualifier("crs")
	@Autowired
	private ClocalReplyService replyService;
	
	//private final String module = "clocalrep";
	
	// 1. 게시판 리스트
	@GetMapping("/pages/{page}")
	public ResponseEntity<Map<String, Object>> replist(Model model, @PathVariable int page) {
		PageObject pageObject = new PageObject(page, 7, 10);
//		pageObject.setNo(no);
		log.info(pageObject);
		System.out.println("======"+replyService.replist(pageObject));
		// 동기식 데이터 처리 -> 브라우저의 주소가 바뀐다
		// 지금 처리는 비동기식 데이터 처리
		// DB에서 데이터 가져오기 -> 페이지 계산, jsp에서 표시할 페이지네이션 정보가 계산된다
//		model.addAttribute("list", replyService.list(pageObject));
//		model.addAttribute("pageObject", pageObject);
		// WEB-INF/views/ + module(reply) + /list + .jsp
		return new ResponseEntity<>(replyService.replist(pageObject), HttpStatus.OK);
	}
	// 3-1. 게시판 댓글쓰기 처리
	
	@PostMapping(value = "/new", consumes = "application/json", 
			produces = "application/text; charset=utf-8")
	public ResponseEntity<String> write(@RequestBody ClocalReplyDTO dto) {
		System.out.println("******"+dto);
		log.info(dto);
		try {
			replyService.write(dto);
			return new ResponseEntity<>("댓글이 등록되었습니다", HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>("댓글 등록 중 오류가 발생되었습니다.\\n"+
					e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	// 4. 게시판 댓글수정 처리 - 전체 데이터
	@RequestMapping(value = "/{no}", consumes = "application/json", 
	produces = "application/text; charset=utf-8", 
	method = RequestMethod.PATCH)
	public ResponseEntity<String> update(@RequestBody ClocalReplyDTO dto, @PathVariable int no) {
		dto.setNo(no);
		log.info("#############"+dto);
		int result = replyService.update(dto);
		if(result > 0)
			// WEB-INF/views/ + module(reply) + /list + .jsp
			// 수정이 된 경우 처리
			return new ResponseEntity<>("댓글 수정 되었습니다.", HttpStatus.OK);

		else
			// 오류 보여주는 페이지 이동
			return new ResponseEntity<>("댓글이 수정에 필요한 정보를 확인하세요", 
					HttpStatus.NOT_ACCEPTABLE);

	}
	// 5. 게시판 삭제 - 댓글번호, 비빌번호
	@PostMapping(value = "/{no}", consumes = "application/json", 
			produces = "application/text; charset=utf-8")
	public ResponseEntity<String> delete(@RequestBody ClocalReplyDTO dto) {
		int result = replyService.delete(dto);
		if(result > 0)
			// 수정이 된 경우의 처리.
			return new ResponseEntity<>("댓글이 삭제되었습니다.", HttpStatus.OK);
		else
			// 수정이 정상적으로 안된 경우 : 비밀번호가 틀림
			return new ResponseEntity<>("댓글 삭제에 실패하셨습니다.\\n댓글이 수정에 필요한 정보를 확인하세요.",
					HttpStatus.NOT_ACCEPTABLE);
	}
	
}
