package com.cvama.livechat.mapper;

import java.util.List;
import com.cvama.livechat.dto.LiveChatDTO;

public interface LiveChatMapper {
	
	// 1. 댓글 리스트
	public List<LiveChatDTO> liveChatList(String stime);
		
	// 2. 댓글 등록
	public Integer write(LiveChatDTO dto);

	// 3. 댓글 삭제
	public Integer delete(LiveChatDTO dto);

}
