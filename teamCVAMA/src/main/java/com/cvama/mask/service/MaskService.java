package com.cvama.mask.service;

import java.util.List;
import java.util.Map;

import com.cvama.mask.dto.MaskReplyDTO;
import com.cvama.mask.dto.SalesDTO;
import com.cvama.util.page.PageObject;

public interface MaskService {

	public List<SalesDTO> remainList(String date, String code);
	
	public Map<String, Object> replyList(PageObject pageObject, String code);
	
	public Integer replyWrite(MaskReplyDTO dto);
	
	public Integer replyDelete(MaskReplyDTO dto);	
}