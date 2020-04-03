package com.cvama.util.page;

import java.sql.PreparedStatement;

public class SearchCondition {

	// 검색을 SQL쿼리에 추가하는 메서드
	public static String getSearchSQLWithAnd(PageObject pageObject) {
		System.out.println("SearchCondition.getSearchSQLWithAnd()");
		String sql = "";
		if(pageObject.getWord() != null && !pageObject.getWord().equals("")) {
			sql += " and (1 = 2 ";			
			if(pageObject.getKey().indexOf("i") >= 0) sql += " or id like ? ";
			if(pageObject.getKey().indexOf("n") >= 0) sql += " or name like ? ";
			if(pageObject.getKey().indexOf("e") >= 0) sql += " or email like ? ";
			if(pageObject.getKey().indexOf("t") >= 0) sql += " or title like ? ";
			if(pageObject.getKey().indexOf("c") >= 0) sql += " or content like ? ";
			
			sql += " ) ";
		}
		return sql;
	}

	// 실행객체에 검색 데이터를 셋팅하는 메서드
	public static int setPreparedStatement(PreparedStatement pstmt, 
			PageObject pageObject, int idx) throws Exception {
		if(pageObject.getWord() != null && !pageObject.getWord().equals("")) {
			if(pageObject.getKey().indexOf("i") >= 0) pstmt.setString(idx++, "%" + pageObject.getWord() + "%");
			if(pageObject.getKey().indexOf("n") >= 0) pstmt.setString(idx++, "%" + pageObject.getWord() + "%");
			if(pageObject.getKey().indexOf("e") >= 0) pstmt.setString(idx++, "%" + pageObject.getWord() + "%");
			if(pageObject.getKey().indexOf("t") >= 0) pstmt.setString(idx++, "%" + pageObject.getWord() + "%");
			if(pageObject.getKey().indexOf("c") >= 0) pstmt.setString(idx++, "%" + pageObject.getWord() + "%");
		}
		return idx;
	}
	
}
