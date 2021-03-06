package com.cvama.reply.controller;

import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.cvama.reply.dto.ReplyDTO;
import com.cvama.reply.service.ReplyService;
import com.cvama.util.page.PageObject;

//import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// @Controller는 jsp로 포워트나 url로 리다이렉트 시키는 기능을 처리하기 위한 객체
// @RestController는 순수한 데이터를 전달하는 기능을 처리하기 위한 객체
@RestController
@Log4j
@RequestMapping("/reply")
// 생성자에 의해서 멤버 변수를 초기화 시키는 작업을 한다.
// 멤버 변수 중에서 직접 지정한 변수들을 따로 초기화 작업을 한 경우 -> @Autowired나 @Inject 사용
//@AllArgsConstructor
public class ReplyController {

	@Autowired
	@Qualifier("rs")
	private ReplyService service;
	
	private final String module = "reply";
	
	//1. 댓글 리스트 - get
		@GetMapping("/pages/{no}/{page}")
		public ResponseEntity<List<ReplyDTO>> list(Model model, @PathVariable int no,
				@PathVariable int page) {
			PageObject pageObject = new PageObject(page, 10);
			log.info(pageObject);
			// 동기식 데이터 처리 -> 브라우저의 주소가 바뀐다.
			// 지금 처리는 비동기식 데이터 처리
			// DB에서 데이터 가져오기 -> 페이지 계산, JSP에서 표시할 페이지네이션 정보가 계산된다.
//			model.addAttribute("list", service.list(pageObject));
//			model.addAttribute("pageObject", pageObject);
			// /WEB-INF/views/ + reply + /list + .jsp
			return new ResponseEntity<>(service.list(pageObject, no),
					HttpStatus.OK);
		}
		
		//2. 댓글 글쓰기 처리
		// consumes : 전달되는 데이터 지정
		// produces : 돌려주는 값에 대한 데이터 설정
		@PostMapping(value = "/new", consumes = "application/json",
				 produces = "application/text; charset=utf8")
		public ResponseEntity<String> write(@RequestBody ReplyDTO dto) {
			log.info(dto);
			try {
				service.write(dto);
				return new ResponseEntity<>("댓글이 등록되었습니다.", HttpStatus.OK);
			}
			catch (Exception e) {
				return new ResponseEntity<>("댓글 등록 중 오류가 발생되었습니다.\\n"+
						e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
			}
		}
	
	//3. 댓글 글수정 처리 - 전체 데이터
//	@PostMapping("/update.do")
		// consumes : 전달되는 데이터 지정
				// produces : 돌려주는 값에 대한 데이터 설정
	@RequestMapping(value="/{rno}", consumes = "application/json", 
			produces = "application/text; charset=utf8", method = RequestMethod.PATCH)
	public ResponseEntity<String> update(@RequestBody ReplyDTO dto, @PathVariable int rno) {
		System.out.println("업데이트");
		dto.setRno(rno);
		log.info("############"+dto);
		int result = service.update(dto);
		if(result > 0)
			// 자동으로 글보기로 이동한다.
			return new ResponseEntity<>("댓글이 수정되었습니다.", HttpStatus.OK);
		else
			// 오류보여주는 jsp 페이지로 이동 -> 수정이 정상적으로 안된 경우 : 비밀번호가 틀림
			return new ResponseEntity<>("댓글 수정 중 오류가 발생되었습니다.\\n",HttpStatus.INTERNAL_SERVER_ERROR);	}
	
	//4. 댓글 글삭제 처리 - 글번호, 비밀번호
	@RequestMapping(value="/delete", consumes = "application/json", 
			produces = "application/text; charset=utf8", method = {RequestMethod.POST})
	public ResponseEntity<String> delete(@RequestBody ReplyDTO dto) {
		System.out.println("삭제");
		log.info(dto);
		try {
			service.delete(dto);
			return new ResponseEntity<>("댓글이 삭제되었습니다.", HttpStatus.OK);
		}
		catch (Exception e) {
			return new ResponseEntity<>("댓글 삭제 중 오류가 발생되었습니다.\\n"+
					e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
