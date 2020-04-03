package com.cvama.livechat.service;

import java.util.List;
import com.cvama.livechat.dto.LiveChatDTO;

public interface LiveChatService {

	// 1.리스트 - list()
	public List<LiveChatDTO> liveChatList(String stime);
	
	// 2.댓글쓰기 처리 - write(dto)
	public Integer write(LiveChatDTO dto);

	// 3.댓글삭제 - delete(dto) ==> no와 writer 방식
	public Integer delete(LiveChatDTO dto);
}
