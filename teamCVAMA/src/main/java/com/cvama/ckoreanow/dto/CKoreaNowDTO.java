package com.cvama.ckoreanow.dto;


import lombok.Data;

@Data
// getter, setter, 생성자, toString() 자동생성
public class CKoreaNowDTO {

	private int testTotal, testTotal2;
	private int testToday, testToday2;
	private int coronaTrue, coronaTrue2;
	private int coronaFalse, coronaFalse2;
	private int death, death2;
	private int safe, safe2;
	private float deathRate; 
}