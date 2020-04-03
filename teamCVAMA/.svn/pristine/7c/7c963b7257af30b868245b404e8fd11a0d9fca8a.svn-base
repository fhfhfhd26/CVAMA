package com.cvama.clocalrep.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cvama.clocalrep.dto.ClocalReplyDTO;
import com.cvama.clocalrep.mapper.ClocalReplyMapper;
import com.cvama.util.page.PageObject;

import lombok.AllArgsConstructor;

// interface를 상속받은 클래스라는 뜻의 Impl
// 로그를 출력하기 위해서 - log.info()
//@Log4j
// 자동생성 - @Controller @Service @Repository @Component @RestController 
//         @ControllerAdvice @RestControllerAdvice
@Service
@Qualifier("crs")
// 생성자를 이용해서 private 멤버 변수에 DI 적용 -> replymapper
@AllArgsConstructor
public class ClocalReplyServiceImpl implements ClocalReplyService{
	
	// DB 처리를 위한 mapper 변수 선언
	private ClocalReplyMapper replyMapper;
	
	
	@Override
	public Map<String, Object> replist(PageObject pageObject) {
		// TODO Auto-generated method stub
		// 페이지 정보 계산 메서드 호출
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resultMap = new HashMap<String, Object>();
		pageObject.calcuPageInfo();
		// jsp의 페이지 네이션을 위한 계산 -> jsp에 전달이 되어야 한다.
		pageObject.setTotalRow(replyMapper.getTotalRow());
		System.out.println("ReplyController.list().pageObject:"+pageObject);
		map.put("pageObject", pageObject);
		resultMap.put("pageObject", pageObject);
		resultMap.put("replyList", replyMapper.replist(map));
		return resultMap;
	}

	@Override
	public Integer write(ClocalReplyDTO dto) {
		// TODO Auto-generated method stub
		return replyMapper.write(dto);
	}

	@Override
	public Integer update(ClocalReplyDTO dto) {
		// TODO Auto-generated method stub
		return replyMapper.update(dto);
	}

	@Override
	public Integer delete(ClocalReplyDTO dto) {
		// TODO Auto-generated method stub
		return replyMapper.delete(dto);
	}
	
}
