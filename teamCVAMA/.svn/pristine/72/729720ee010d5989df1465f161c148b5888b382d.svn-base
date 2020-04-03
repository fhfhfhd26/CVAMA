package com.cvama.reply.service;

import java.util.List;

import com.cvama.reply.dto.ReplyDTO;
import com.cvama.util.page.PageObject;

public interface ReplyService {

	// 1. 리스트 - list()
	public List<ReplyDTO> list(PageObject pageObject, int no);
	// 2. 댓글 쓰기 처리 - write(dto)
	public Integer write(ReplyDTO dto);
	// 3. 댓글 수정 처리 - update(dto)
	public Integer update(ReplyDTO dto);
	// 4. 댓글 삭제 처리 - delete(dto) ==> no와 pw:post 방식
	public Integer delete(ReplyDTO dto);
	

}
