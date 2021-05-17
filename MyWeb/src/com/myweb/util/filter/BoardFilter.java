package com.myweb.util.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//1. Filter인터페이스를 상속받고 doFilter메서드를 오버라이딩 합니다.
//2. 필터등록 (@WebFilter 어노테이션 방법 or web.xml에 등록)

//   @WebFilter("/*") //모든요청 전부다 
//   @WebFilter("*.board") //board로 끝나는 요청들에게 필터를 적용시킴
//	 @WebFilter("/board/write.board") //특정요청에만 필터를 적용시킴
	 @WebFilter({"/board/write.board", "/board/regist.board"}) //글쓰기 화면이나, 글 등록시에만 실행 (여러개일때는 중괄호로 묶음)
public class BoardFilter implements Filter {	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//필터를 이용해 인가된 사용자만 사용할 수 있도록 처리
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
		
		HttpSession session = req.getSession();
		
		String user_id = (String)session.getAttribute("user_id");
		
		if(user_id == null) {
//			res.sendRedirect("list.board");//무한루프에 빠지지않도록 조심
			
			//브라우저 측으로 스크립트형식을 만들어서 전달
			
			res.setContentType("text/html"); //문서의 형식지정
			res.setCharacterEncoding("UTF-8");
			
			PrintWriter out = res.getWriter(); //출력의 방향 -> 브라우저
			out.println("<script>");
			out.println("alert('권한이 없습니다.');");
			out.println("location.href='list.board'");
			out.println("</script>");
					
			return; //return을 사용해서 아래 doFilter가 실행되지 않게 처리.
		}
		
		chain.doFilter(request, response);//서블릿이나 연결되어 있는 다른 필터를 실행시킴  (이구문은 반드시 실행시켜줘야함). 
		
	}
	
	
	
}
