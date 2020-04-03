package com.cvama.ckorea.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.cvama.ckorea.dto.CKoreaDTO;
import com.cvama.ckorea.mapper.CKoreaMapper;
import lombok.AllArgsConstructor;
//import lombok.extern.log4j.Log4j;

// 로그를 출력하기 위해서 - log.info()
//@Log4j
// 자동생성 - @Controller, @Service, @Repository, @Component, 
//      @RestController, @ControllerAdvice, @RestControllerAdvice
@Service
@Qualifier("ckorea")
// 생성자를 이용해서 private 멤버 변수에 DI 적용 -> mapper가 적용
@AllArgsConstructor
// interface를 상속받은 클래스라는 뜻의 Impl
public class CKoreaServiceImpl implements CKoreaService{
	
	// DB 처리를 위한 mapper 변수 선언
	private CKoreaMapper mapper;

	@Override
	public List<CKoreaDTO> list() {
		return mapper.list();
	}
}
