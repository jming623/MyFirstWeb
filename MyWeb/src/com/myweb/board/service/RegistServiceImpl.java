package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;

public class RegistServiceImpl implements IBoardService {  //뒤에 Impl을 관습적으로 붙혀줌 구현체라는 의미 

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//controller에서 처리할 내용을 service클래스가 분담...
		
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
	
		BoardDAO dao = BoardDAO.getInstance();
		dao.regist(writer,title,content);
	}

	

}
