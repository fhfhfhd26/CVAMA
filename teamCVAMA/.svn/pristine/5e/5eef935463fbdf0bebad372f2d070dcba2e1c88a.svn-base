package com.cvama.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;

import com.cvama.board.dto.BoardDTO;
import com.cvama.util.page.PageObject;


public interface BoardService {

	//1. 리스트
	public List<BoardDTO> list(PageObject pageObject);
	//1-2. 인기글리스트
	public List<BoardDTO> plist(PageObject pageObject);
	//2. 글쓰기
	public int write(BoardDTO dto);
	//2-2. 답글쓰기
	public int rewrite(BoardDTO dto);
	//3. 글보기
	public BoardDTO view(int no);
	public int increaseHit(int no);
	//4. 글수정
	public int update(BoardDTO dto);
	//5. 글삭제	
	public int delete(BoardDTO dto);
}
