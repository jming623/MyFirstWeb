package com.myweb.board.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.myweb.board.model.BoardDAO;
import com.myweb.board.model.BoardVO;
import com.myweb.util.PageVO;

public class GetListServiceImpl implements IBoardService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//1. 화면전환시에 조회하는 페이지번호 and 화면에 그려질 개수2개를 전달받음.
		
		//첫 페이지 경우 (기본값)
		int pageNum = 1;
		int amount = 10; //한페이지에 보여줄 데이터의 갯수
		
		//페이지번호를 클릭하는 경우 (변경사항을 저장)
		if(request.getParameter("pageNum")!= null && request.getParameter("amount") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		//DAO생성		
		BoardDAO dao = BoardDAO.getInstance();
		ArrayList<BoardVO> list = dao.getList(pageNum,amount);
		
		int total  = dao.getTotal(); //전체게시글수
		PageVO pageVO = new PageVO(pageNum,amount,total);
		
		//화면에 가지고 나갈 list를 request에 저장! (다음화면에서만 쓰면되기때문에 session,application은 안씀)
		request.setAttribute("list",list);
		
		//화면에 가지고 나갈 pageVO를 request에 저장
		request.setAttribute("pageVO", pageVO);
	}

}
