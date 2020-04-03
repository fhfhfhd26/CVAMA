package com.cvama.like.controller;

import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RestController;

import com.cvama.like.dto.LikeDTO;
import com.cvama.like.service.LikeService;
import com.cvama.reply.dto.ReplyDTO;
import com.cvama.reply.service.ReplyService;
import com.cvama.util.page.PageObject;

//import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// @Controller는 jsp로 포워트나 url로 리다이렉트 시키는 기능을 처리하기 위한 객체
// @RestController는 순수한 데이터를 전달하는 기능을 처리하기 위한 객체
@RestController
@Log4j
@RequestMapping("/like")
// 생성자에 의해서 멤버 변수를 초기화 시키는 작업을 한다.
// 멤버 변수 중에서 직접 지정한 변수들을 따로 초기화 작업을 한 경우 -> @Autowired나 @Inject 사용
//@AllArgsConstructor
public class LikeController {

	@Autowired
	@Qualifier("ls")
	private LikeService service;
	
	private final String module = "like";
	

		
		//2. 댓글 글쓰기 처리
		// consumes : 전달되는 데이터 지정
		// produces : 돌려주는 값에 대한 데이터 설정
		@PostMapping(value = "/{bno}")
		@ResponseBody
		public int update(LikeDTO dto) {
			System.out.println("좋아요 처리"+dto.getBno()+","+dto.getLikecnt());
			
			try {
				return service.update(dto);
			}
			catch (Exception e) {
				return -1;
			}
		}

}
