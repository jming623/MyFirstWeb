package com.myweb.util;

public class PageVO {

	/*
	 * 화면에 그려질 pageNation을 계산하는 클래스(pageNum, amount값을 가지고 다님)
	 */
	
	private int startPage; //게시글 화면에 보여질 첫번째 번호
	private int endPage; //게시글 화면에 보여질 마지막 번호
	private boolean prev, next; //이전버튼, 다음버튼 활성화 여부
	private int pageNum; //현재 조회하는 페이지번호
	private int amount = 10; //화면에 그려질 데이터
	private int total; //전체게시글 수
	
	// 생성자에서는 객체가 생성될때 계산을 처리
	public PageVO(int pageNum, int amount, int total) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;
		
		//1. endPage결정
		//ex) 조회하는 페이지1 -> 끝번호 10 , 조회하는 페이지 9 -> 끝번호 10 , 조회하는 페이지 11 -> 끝번호 20
		//공식 (int)Math.ceil(페이지번호/페이지네이션 갯수.0) * 페이지네이션 갯수
		this.endPage = (int)Math.ceil(this.pageNum / 10.0)*10;
							
		//2. startPage결정
		//공식 = 끝페이지 - 페이지네이션개수 +1  (endPage가 10일때 startPage는 1 )
		this.startPage = this.endPage - 10 + 1;
				
		//3. realEnd(진짜끝번호) 구해서 endPage값을 다시 결정
		//만약 게시글이 52개라면 -> 진짜끝번호 6
		//만약 게시글이 105개라면 -> 진짜 끝번호11
		//공식 = (int)Math.ceil(전체게시글수(total)/ 화면에 보여질데이터갯수(amount))
		
		int realEnd = (int)Math.ceil(this.total / (double)this.amount); //total이 105개고 amount가 10이면 나눴을때 10.5 올림하면 11  
		
		//마지막페이지에 도달했을때 보여져야하는 끝번호가 달라집니다.
		//ex : 131개 게시물
		//1번페이지 클릭시 -> endpage = 10, realEnd = 14 (endPage로 세팅)
		//11번페이지 클릭시 -> endpage = 20, realEnd = 14 (realEnd로 세팅)
		// endPage가 realEnd보다 커졌을때 realEnd를 따라간다.
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
		
		//4. prev결정 (startPage의 번호는 1,11,21....)
		//이전(prev)버튼은 1이 아닐경우에 나타나면된다.
		
		this.prev = this.startPage > 1 ; //1보다 크면 prev에 true를 전달	
				
		//5. next결정
		//ex : 131개 게시문
		//1~10 클릭시 endPage= 10, realEnd 14 -> 다음버튼 true
		//11번 클릭시 endPage=14, realEnd 14 -> 다음버튼 false;
		
		this.next = this.endPage < realEnd; // realEnd값이 endPage보다 더 크면 true
		
		//확인 
		System.out.println("시작페이지:" + this.startPage + ", 끝페이지:" + this.endPage);
		
		//GetListService에서 페이지VO계산처리 코드작성..
	}//end생성자 

	
	//getter,setter
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	};
	

	
	
	
}
