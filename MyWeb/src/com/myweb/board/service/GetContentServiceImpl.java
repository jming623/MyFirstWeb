package com.myweb.board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;

public class GetContentServiceImpl implements IBoardService{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bno = request.getParameter("bno");
				
		BoardDAO dao = BoardDAO.getInstance();
				
		BoardVO vo = dao.getContent(bno);
			
		request.setAttribute("vo", vo);
		
		
	}

}
