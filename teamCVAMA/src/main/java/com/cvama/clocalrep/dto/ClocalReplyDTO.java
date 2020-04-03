package com.cvama.clocalrep.dto;

import java.util.Date;

import lombok.Data;

@Data // setter, getter, 생성자, toString)() 자동으로 생성해 준다.
public class ClocalReplyDTO {
	
	private int no;
	private String content, writer, pw;
	private Date writeDate;
	
}
