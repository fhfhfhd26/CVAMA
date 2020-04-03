package com.cvama.livechat.controller;

import java.util.List;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.RestController;
import com.cvama.livechat.dto.LiveChatDTO;
import com.cvama.livechat.service.LiveChatService;


// 멤버 변수 중에서 직접 지정한 변수들을 따로 초기화 작업을 한 경우 -> @Autowired나 @Inject 사용
//@AllArgsConstructor // 생성자에 의해서 멤버 변수를 초기화 시키는 작업을 한다.
// @Controller는 jsp로 포워드나 url로 리다이렉트 시키는 기능을 처리하기 위한 객체
// @RestController는 순수한 데이터를 전달하는 기능을 처리하기 위한 객체 (ex:json)
@RequestMapping("/liveChat")
@RestController
public class LiveChatController {
	
	@Qualifier("lc")
	@Autowired
	private LiveChatService liveChatService;
	
	// 1. 채팅 리스트
	@GetMapping("/list/{stime}")
	public ResponseEntity<List<LiveChatDTO>> liveChatList(Model model, @PathVariable String stime) {
		return new ResponseEntity<>(liveChatService.liveChatList(stime), HttpStatus.OK);
	}

	// 2. 채팅 글쓰기
	@PostMapping(value = "/new", consumes = "application/json", 
			produces = "application/text; charset=utf-8")
	public ResponseEntity<String> write(@RequestBody LiveChatDTO dto, HttpSession session) {
		try {
			liveChatService.write(dto);
			return new ResponseEntity<>("채팅이 등록되었습니다", HttpStatus.OK);
			
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>("채팅 등록 중 오류가 발생되었습니다.\\n"+
					e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	// 3. 채팅 글삭제
	@PostMapping(value = "/del", consumes = "application/json", 
			produces = "application/text; charset=utf-8")
	public ResponseEntity<String> delete(@RequestBody LiveChatDTO dto, HttpSession session) {
		try {
			liveChatService.delete(dto);
			return new ResponseEntity<>("채팅이 삭제되었습니다", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			return new ResponseEntity<>("채팅 삭제중 오류발생.\\n"+
					e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
}
