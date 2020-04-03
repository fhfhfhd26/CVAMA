package com.cvama.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cvama.board.dto.BoardDTO;
import com.cvama.board.mapper.BoardMapper;
import com.cvama.util.page.PageObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

//로그를 출력하기 위함 - log.info()
@Log4j
//자동생성 - @Controller, @Service, @Repository, @Component, @RestController
@Service
@Qualifier("bs")
//생성자를 이용해서 private 멤버 변수에 DI적용
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	//DB처리를 위한 mapper설정
	private BoardMapper mapper;
	
	@Override
	public List<BoardDTO> list(PageObject pageObject) {
		// TODO Auto-generated method stub
		System.out.println("ServiceImpl");
		//페이지 정보를 계산하는 메소드 호출
		pageObject.calcuPageInfo();
		pageObject.setTotalRow(mapper.getTotalRow(pageObject));
		return mapper.list(pageObject);
	}
	
	@Override
	public List<BoardDTO> plist(PageObject pageObject) {
		// TODO Auto-generated method stub
		System.out.println("ServiceImpl");
		//페이지 정보를 계산하는 메소드 호출
		pageObject.calcuPageInfo();
		pageObject.setTotalRow(mapper.getTotalPRow(pageObject));
		return mapper.plist(pageObject);
	}

	@Override
	public int write(BoardDTO dto) {
		// TODO Auto-generated method stub

		return mapper.write(dto);
	}
	
	@Override
	public int rewrite(BoardDTO dto) {
		// TODO Auto-generated method stub
		mapper.setGroupOrd(dto);
		return mapper.rewrite(dto);
	}
	
	@Override
	public BoardDTO view(int no) {
		// TODO Auto-generated method stub
		mapper.increaseHit(no);
		return mapper.view(no);
	}

	@Override
	public int increaseHit(int no) {
		// TODO Auto-generated method stub
		return mapper.increaseHit(no);
	}

	@Override
	public int update(BoardDTO dto) {
		// TODO Auto-generated method stub
		return mapper.update(dto);
	}

	@Override
	public int delete(BoardDTO dto) {
		// TODO Auto-generated method stub
		//1. 삭제할 글 정보 조회 및 저장(originNo, groupOrd, groupLayer)
		BoardDTO ddto= mapper.view(dto.getNo());
		BoardDTO ndto = new BoardDTO();
		//2. 삭제 범위 확인(originNo, groupLayer동일, groupOrd는 삭제글보다 큰 글)
		Integer nextGNo = mapper.findnextDNo(ddto);
		System.out.println(ddto.getOriginNo()+","+ddto.getGroupOrd());
		//3. 범위 내 글 삭제(삭제글의 groupOrd이상, 삭제범위 미만 글 삭제)
		if(nextGNo==null) {
			ndto.setOriginNo(ddto.getOriginNo());
			ndto.setGroupOrd(ddto.getGroupOrd());
			ndto.setGroupLayer(99999);
			mapper.nextdelete(ndto);
		}
		else {
			ndto.setOriginNo(ddto.getOriginNo());
			ndto.setGroupOrd(ddto.getGroupOrd());
			ndto.setGroupLayer(nextGNo);
			mapper.nextdelete(ndto);
		}
		System.out.println(1);
		//4. 범위밖(groupOrd가 삭제범위와 같거나 큰 글의 GroupOrd를  글 GroupOrd감소
		//nextGNo갸 null이 아닐 경우에만
		if(nextGNo!=null) {
			//감소량은 두 수의 차와 같다
			int reduceNo = nextGNo-ddto.getGroupOrd();
			//nextGNO이상 글들의 Groupord를 reduceNo만큼 감소시킴
			ndto.setOriginNo(ddto.getOriginNo());
			ndto.setGroupOrd(nextGNo);
			ndto.setGroupLayer(reduceNo);
			mapper.reduceNo(ndto);
		}
		
		return 1;
	}

}
