package com.cvama.clocalrep.service;

import java.util.Map;

import com.cvama.clocalrep.dto.ClocalReplyDTO;
import com.cvama.util.page.PageObject;

public interface ClocalReplyService {

	// 1.리스트 - list()
	public Map<String, Object> replist(PageObject pageObject);
	
	// 2.댓글쓰기 처리 - write(dto)
	public Integer write(ClocalReplyDTO dto);
	// 3.댓글수정 처리 - update(dto)
	public Integer update(ClocalReplyDTO dto);
	// 4.댓글삭제 - delete(dto) ==> no와 pw:post 방식
	public Integer delete(ClocalReplyDTO dto);

	
	

}
