package com.cvama.like.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cvama.like.dto.LikeDTO;
import com.cvama.like.mapper.LikeMapper;
import com.cvama.reply.dto.ReplyDTO;
import com.cvama.reply.mapper.ReplyMapper;
import com.cvama.util.page.PageObject;

import lombok.AllArgsConstructor;

// 자동생성 - @Controller, @Service, @Repository, @Component, 
//      @RestController, @ControllerAdvice, @RestControllerAdvice
@Service
@Qualifier("ls")
// 생성자를 이용해서 private 멤버 변수에 DI 적용 -> mapper가 적용
@AllArgsConstructor
// interface를 상속받은 클래스라는 뜻의 Impl
public class LikeServiceImpl implements LikeService{
	
	// DB 처리를 위한 mapper 변수 선언
	private LikeMapper mapper;


	@Override
	public Integer update(LikeDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("likeserviceImpl");		
		mapper.update(dto);
		int newCnt = mapper.getCnt(dto);		
		if(newCnt == dto.getLikecnt()) {
			newCnt = -1;
		}
		else {
			mapper.writeIp(dto);
		}
		return newCnt;
	}


}
