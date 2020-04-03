package com.cvama.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.cvama.board.dto.BoardDTO;
import com.cvama.util.page.PageObject;
//SQL은 resources 안의 패키지에맞는 폴드에 BoardMapper.xml을 만들고 각각의 태그에 맞는 메소드를 작성해준다 
public interface BoardMapper {
	
	//1. 리스트
	public List<BoardDTO> list(PageObject pageObject);
	public Integer getTotalRow(PageObject pageObject);
	//1-2. 인기글리스트
	public List<BoardDTO> plist(PageObject pageObject);
	public Integer getTotalPRow(PageObject pageObject);
	//2. 글쓰기
	public int write(BoardDTO dto);
	//2-2. 답글쓰기
	public int rewrite(BoardDTO dto);
	public int setGroupOrd(BoardDTO dto);
	//3. 글보기
	public BoardDTO view(int no);
	public int increaseHit(int no);
	//4. 글수정
	public int update(BoardDTO dto);
	//5. 글삭제	
	public int delete(BoardDTO dto);
	public Integer findnextDNo(BoardDTO dto);
	public int nextdelete(BoardDTO dto);
	public int reduceNo(BoardDTO dto);
	
}
