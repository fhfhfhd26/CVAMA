package com.cvama.mask.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cvama.mask.dto.MaskReplyDTO;
import com.cvama.mask.dto.SalesDTO;
import com.cvama.mask.mapper.MaskMapper;
import com.cvama.util.page.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

// 로그를 출력하기 위해서 - log.info()
@Log4j
// 자동생성 - @Controller, @Service, @Repository, @Component,
// @RestController, @ControllerAdvice, @RestControllerAdvice
@Service
@Qualifier("masks")
// 생성자를 이용해서 private 멤버 변수에 DI 적용 -> mapper가 적용
@AllArgsConstructor
// interface를 상속받은 클래스라는 뜻의 Impl
public class MaskServiceImpl implements MaskService{

	// DB처리를 위함 mapper 변수 선언
	private MaskMapper mapper;
	
	@Override
	public List<SalesDTO> remainList(String date, String code) {
		
		System.out.println("MaskServiceImpl.remainList()");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("date", date);
		map.put("code", code);
		
		return mapper.remainList(map);
	}

	@Override
	public Map<String, Object> replyList(PageObject pageObject, String code) {
		// 페이지 정보 계산 메서드 호출
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		pageObject.calcuPageInfo();
		pageObject.setTotalRow(mapper.getTotalRow(code));
		System.out.println("MaskServiceImpl.replyList().pageObject:"+pageObject);
		map.put("pageObject", pageObject);
		map.put("code", code);
		List<MaskReplyDTO> list = mapper.replyList(map);
		for(MaskReplyDTO dto:list) {
			String ip = dto.getIp();
			int fPointIdx = ip.indexOf(".");
			int sPointIdx = ip.indexOf(".", fPointIdx+1);
			int lPointIdx = ip.indexOf(".", sPointIdx+1);
			dto.setIp(ip.substring(0,sPointIdx)+".xxx"+ip.substring(lPointIdx));			
		}
		resultMap.put("replyList", list);
		resultMap.put("pageObject", pageObject);
		return resultMap;
	}

	@Override
	public Integer replyWrite(MaskReplyDTO dto) {
		return mapper.replyWrite(dto);
	}

	@Override
	public Integer replyDelete(MaskReplyDTO dto) {
		return mapper.replyDelete(dto);
	}
}
