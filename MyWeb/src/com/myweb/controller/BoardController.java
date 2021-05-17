package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myweb.board.service.DeleteServiceImpl;
import com.myweb.board.service.GetContentServiceImpl;
import com.myweb.board.service.GetListServiceImpl;
import com.myweb.board.service.IBoardService;
import com.myweb.board.service.RegistServiceImpl;
import com.myweb.board.service.UpdateServiceImpl;
import com.myweb.board.service.UphitServiceImpl;


@WebServlet("*.board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//자바측에서 세션값을 얻는 방법
//		HttpSession session = request.getSession();
//		String user_id = (String)session.getAttribute("uesr_id");
		
		
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String path = request.getContextPath();
		
//		System.out.println("uri="+uri);
//		System.out.println("path="+path);
		
		String command = uri.substring(path.length()); //요청경로
		
		System.out.println(command);
		//service의 인터페이스 타입을 선언하고(if문 안에서 알맞은 서비스 클래스로 연결)
		IBoardService service;
		
		//MVC2방식은 forward이동을 기본적으로 사용합니다. redirect는 다시 컨트롤러를 연결할 때 사용합니다.  
		
		if(command.equals("/board/list.board")) {
			//....조회 메서드를 값을 가지고 화면으로 이동..
			
			service = new GetListServiceImpl();
			service.execute(request, response);
			
			//화면에 전달할 값이 있으니 forward이동
			request.getRequestDispatcher("board_list.jsp").forward(request, response);
			
			//response.sendRedirect("board_list.jsp"); 
		}else if(command.equals("/board/write.board")) {//글작성 화면요청
			
			//자바측에서 세션값을 꺼내와서 세션값을 검사해 로그인이 되어있지않은 사용자면 글쓰기 기능을 사용하지못하게 막는 법 
//			HttpSession session = request.getSession();
//			String user_id = (String)session.getAttribute("user_id");
//			
//			if(user_id == null) {
//				response.sendRedirect("/MyWeb");
//				return;
//			}
			
			//권한이 없으면 진입하지 못하도록 하는 작업. filter에서 처리
			
			
//			response.sendRedirect("board_write.jsp");
			request.getRequestDispatcher("board_write.jsp").forward(request, response);
			
			
		}else if(command.equals("/board/regist.board")) { //글 등록요청
			
			service = new RegistServiceImpl();
			service.execute(request, response);
			response.sendRedirect("list.board"); //리다이렉트는 다시 컨트롤러를 태울때 사용합니다.
		
		}else if(command.equals("/board/getContent.board")) { //글 상세보기
			
			//조회수 증가 (service영역)
			service = new UphitServiceImpl();
			service.execute(request, response);
			
			
			//게시글 정보 조회
			service = new GetContentServiceImpl();
			service.execute(request, response);
			request.getRequestDispatcher("board_content.jsp").forward(request, response);
		
		}else if(command.equals("/board/modify.board")) { //수정요청
			
			//GetContentServiceImpl을 재활용
			service = new GetContentServiceImpl();
			service.execute(request, response);
			request.getRequestDispatcher("board_modify.jsp").forward(request, response);
			
		}else if(command.equals("/board/update.board")) {
			
			/*
			 * 1. UpdateServiceImpl클래스 생성하고 execute메서드 실행
			 * 2. 서비스영영에서 bno, title, content를 받아서 DAO의 update()메서드 실행
			 * 3. update메서드는 sql문을 이용해서 해당 글 번호의 내용을 수정
			 * 4. update를 완료한 후에 컨트롤러에서는 컨텐츠화면으로 이동. (content가 필요한 값을 자바측에서 전송)
			 */
			
 			service = new UpdateServiceImpl();
			service.execute(request, response);
			response.sendRedirect("getContent.board?bno="+request.getParameter("bno"));
			
		}else if(command.equals("/board/delete.board")) {
			
			service = new DeleteServiceImpl();
			service.execute(request, response);
			response.sendRedirect("list.board");
		}
	}
}
