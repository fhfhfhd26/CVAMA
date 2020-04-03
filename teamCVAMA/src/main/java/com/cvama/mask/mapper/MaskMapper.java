package com.cvama.mask.mapper;

import java.util.List;
import java.util.Map;

import com.cvama.mask.dto.MaskReplyDTO;
import com.cvama.mask.dto.SalesDTO;

public interface MaskMapper {
	
	public List<SalesDTO> remainList(Map<String, String> map);

	public List<MaskReplyDTO> replyList(Map<String, Object> map);
	
	public Integer getTotalRow(String code);
	
	public Integer replyWrite(MaskReplyDTO dto);

	public Integer replyDelete(MaskReplyDTO dto);
}
