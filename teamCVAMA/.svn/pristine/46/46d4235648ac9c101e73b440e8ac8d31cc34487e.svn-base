package com.cvama.livechat.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import com.cvama.livechat.dto.LiveChatDTO;
import com.cvama.livechat.mapper.LiveChatMapper;
import lombok.AllArgsConstructor;

@Service
@Qualifier("lc")
@AllArgsConstructor
public class LiveChatServiceImpl implements LiveChatService{
	
	// DB 처리를 위한 mapper 변수 선언
	private LiveChatMapper liveChatMapper;
	
	@Override
	public List<LiveChatDTO> liveChatList(String stime) {
		return liveChatMapper.liveChatList(stime);
	}

	@Override
	public Integer write(LiveChatDTO dto) {
		// TODO Auto-generated method stub
		return liveChatMapper.write(dto);
	}

	@Override
	public Integer delete(LiveChatDTO dto) {
		// TODO Auto-generated method stub
		return liveChatMapper.delete(dto);
	}
	
}
