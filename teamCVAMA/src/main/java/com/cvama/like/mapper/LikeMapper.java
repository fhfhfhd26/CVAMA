package com.cvama.like.mapper;



import com.cvama.like.dto.LikeDTO;
import com.cvama.util.page.PageObject;

public interface LikeMapper {
	//1.좋아요 숫자 리턴
	public Integer getCnt(LikeDTO dto);
	// 3. 좋아요 업데이트
	public Integer update(LikeDTO dto);
	
	//4. 좋아요 아이피 기록
	public Integer writeIp(LikeDTO dto);


}
