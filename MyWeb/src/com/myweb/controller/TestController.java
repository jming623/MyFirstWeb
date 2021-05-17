package com.myweb.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//1. 서블릿을 확장장 패턴으로 변경

//@WebServlet("/TestController") //디렉토리 패턴
@WebServlet("*.test") //확장자 패턴
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public TestController() {
        super();
        
    }
    //2. get,post 요청을 doAction메서드 하나로 연결
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
		
	}
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uri = request.getRequestURI(); //uri값
		String path = request.getContextPath(); //path값
		
		String command = uri.substring(path.length() ); //path값을 제외한 
		
		System.out.println(command);
		
		if(command.equals("/controller/join.test")) {
			//..가입요청 처리
		}else if(command.equals("/controller/login.test")) {
			//..로그인 처리
		}else if(command.equals("/controller/logout.test")) {
			//..로그아웃 처리
		}
		
	}
	
	
}
