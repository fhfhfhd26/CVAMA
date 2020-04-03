package com.cvama.board.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardDTO {
	private int no, hit, reply_cnt, originNo, groupOrd, groupLayer, likecnt;
	private String title, content, writer, pw, fileName;
	private Date writeDate;
	private MultipartFile multiFile;
}
