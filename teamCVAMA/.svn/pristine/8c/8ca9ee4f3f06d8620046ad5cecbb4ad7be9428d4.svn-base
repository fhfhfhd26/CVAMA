/**
 * 페이지 처리를 위한 객체
 * - 페이지 처리
 * 작성일: 2019-11-28
 * 작성자: 김기현
 */

package com.cvama.util.page;

public class PageObject {

	// 현재 페이지
	private int page;
	// 한 페이지에 표시할 데이터의 개수
	private int perPageNum;
	// 시작 번호
	private int startRow;
	// 끝 번호
	private int endRow;	
	// == jsp에서 사용할 페이지 처리 변수
	// 전체 데이터의 개수 - dao에서 count(*) -> service에서 데이터를 세팅.
	private int totalRow;
	// 전체 페이지 totalRow 데이터가 들어오면 자동으로 계산하도록 한다. setTotalRow() 작성
	private int totalPage;
	// 하단 부분의 페이지 링크부분(페이지네이션)에 나타날 페이지의 개수 -> perGroupPageNum
	private int perGroupPageNum;
	// 페이지 그룹에 나타나는 처음과 끝 페이지 - 현재 페이지에 따라 다르게 설정된다.
	// totalPage가 나오면 계산할 수 있다. - totalPage가 25면 endPage가 30으로 세팅되는 경우
	// - endPage가 total
	private int startPage;	
	private int endPage;
	
	private String category;
	private String grade;
	private String state;
	
	private String key;
	private String word;
	private String odk;//정렬방식을 받는다(1:no 내림차순, 2:no 오름차순, 3:낮은가격순, 4:높은가격순)
	private String ttk;//팝니다삽니다(1:전체, 2:팝니다, 3:삽니다)
	private String stk;//거래가능(1:전체, 2:거래가능, 3:거래중, 4:거래완료, 5:삭제)
	private String user;//id를 담아서 넘겨준다
	private String min;
	private String max;
	private String my;
	private String admin;
	private String startDate;
	private String endDate;
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getMy() {
		return my;
	}

	public void setMy(String my) {
		this.my = my;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getOdk() {
		return odk;
	}

	public void setOdk(String odk) {
		this.odk = odk;
	}
	
	public String getTtk() {
		return ttk;
	}

	public void setTtk(String ttk) {
		this.ttk = ttk;
	}

	public String getStk() {
		return stk;
	}

	public void setStk(String stk) {
		this.stk = stk;
	}

	public String getMin() {
		return min;
	}

	public void setMin(String min) {
		this.min = min;
	}

	public String getMax() {
		return max;
	}

	public void setMax(String max) {
		this.max = max;
	}

	// 기본 값을 세팅하기위한 기본 생성자
	public PageObject() {
		// 페이지: 1, perPageNum: 10(개발자가 정한다)
		this(1,10);
	}
	
	public PageObject(int page, int perPageNum) {
		// 페이지: 1, perPageNum: 8(개발자가 정한다)
		this(page, perPageNum, 10);
	}
	
	// 현재 페이지와 한 페이지 당 표시하는 데이터의 개수를 전달받아서 처리한다.
	public PageObject(int page, int perPageNum, int perGroupPageNum) {
		this.page= page;
		this.perPageNum = perPageNum;
		this.perGroupPageNum = perGroupPageNum;
		// 현재 페이지의 시작 줄 번호 계산.
		// 시작 줄 번호 = 이전 페이지의 개수를 넘긴 다음 번호: (page-1)*perPageNum + 1
		this.startRow = (page - 1) * perPageNum + 1;
		// 끝 줄 번호 = 시작 줄 번호에 한 페이지 당 표시하는 데이터의 개수를 더하면 다음 페이지의 시작 번호가 되는데
		// 여기서 1을 빼주면 현재 페이지의 마지막 번호가 된다
		this.endRow = page * perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	// 리스트 표시 요청이 있을 때 마다 새로운 PageObject 객체가 새로 생성이 되므로 처리하는 동안에는 변경되지 않는다.
	// 생성자에서 데이터를 처리하도록 작성한다.
	public void setPage(int page) {
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	// 리스트 표시 요청이 있을 때 마다 새로운 PageObject 객체가 새로 생성이 되므로 처리하는 동안에는 변경되지 않는다.
	// 생성자에서 데이터를 처리하도록 작성한다.
//	public void setPerPageNum(int perPageNum) {
//		this.perPageNum = perPageNum;
//	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public int getTotalRow() {
		return totalRow;
	}
	
	// 전체 데이터의 개수가 정해지면 전체 페이지를 구할 수 있다.
	// 전체 페이지가 구해지면 리스트 화면 하단 부분 페이지네이션에 시작 페이지와 끝 페이지를 계산할 수 있다.
	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
		this.totalPage = (totalRow - 1)/perPageNum + 1;
		this.startPage = (page - 1)/perGroupPageNum*perGroupPageNum + 1;
		this.endPage = startPage + perGroupPageNum - 1;
		// 끝 페이지가 전체 페이지보다 큰 경우 조정
		if(this.endPage>this.totalPage) this.endPage = this.totalPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word.trim();
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "PageObject [page=" + page + ", perPageNum=" + perPageNum + ", startRow=" + startRow + ", endRow="
				+ endRow + ", totalRow=" + totalRow + ", totalPage=" + totalPage + ", perGroupPageNum="
				+ perGroupPageNum + ", startPage=" + startPage + ", endPage=" + endPage + ", category=" + category
				+ ", grade=" + grade + ", state=" + state + ", key=" + key + ", word=" + word + ", odk=" + odk
				+ ", ttk=" + ttk + ", stk=" + stk + ", user=" + user + ", min=" + min + ", max=" + max + ", my=" + my
				+ ", admin=" + admin + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
	
	
	public void calcuPageInfo() {
		// 현재 페이지의 시작 줄 번호 계산.
				// 시작 줄 번호 = 이전 페이지의 개수를 넘긴 다음 번호: (page-1)*perPageNum + 1
				startRow = (page - 1) * perPageNum + 1;
				// 끝 줄 번호 = 시작 줄 번호에 한 페이지 당 표시하는 데이터의 개수를 더하면 다음 페이지의 시작 번호가 되는데
				// 여기서 1을 빼주면 현재 페이지의 마지막 번호가 된다
				endRow = page * perPageNum;
	}
	
	// page 문자열과 perPageNum 문자열을 받아서 객체를 생성해주는 메서드
	public static PageObject getInstance(String strPage, String strPerPageNum) {
		PageObject pageObject = null;
		// 처름 게시판으로 들어오거나 페이지 데이터가 넘어오지 않으면 1페이지로 간주한다.: 기본 생성자 사용
		if(strPage==null||strPage.equals("")) {
			pageObject = new PageObject(); // page: 1, perPageNum: 10
		}	else {
			int page = Integer.parseInt(strPage);
			// 한 페이지 당 데이터의 개수가 넘어오지 않는 경우 처리: 10으로 세팅한다.
			if(strPerPageNum == null||strPerPageNum.equals("")) {
				strPerPageNum = "10";
			}
			int perPageNum = Integer.parseInt(strPerPageNum);
			pageObject = new PageObject(page, perPageNum);
		}
		System.out.println("PageObject.getInstance.pageObject:"+pageObject);
		
		return pageObject;
	}
}
