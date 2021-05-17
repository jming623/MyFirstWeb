package com.myweb.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;


public class UserDAO {

	private static UserDAO instance = new UserDAO();
	
	
	private UserDAO() {
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//커넥션풀을 얻는방법
			InitialContext ctx = new InitialContext(); //이안에 커넥션풀이 담겨있음
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("드라이버 호출 에러!");
		}
	}
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	//필요한 변수 선언	
//	private String url = "jdbc:oracle:thin:@localhost:1521/XEPDB1"; 
//	private String uid = "JSP";
//	private String upw = "JSP";
	
	private DataSource ds;//데이터베이스 연결풀을 저장해놓은 객체
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//아이디 중복검사
	public int checkId(String id) {
		int result = 0;
		
		String sql = "select * from users where id =?";
		
		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) { //true라면 중복
				result = 0; 
			}else {
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//닫아주는 작업을 (close작업)을 클래스로 생성해놓고 호출.
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result; //값이1이라면 중복되지않는 아이디
	}
	
	//회원가입 메서드 
	public int join(UserVO vo) {
		int result = 0;
		
		String sql ="insert into users(id,pw,name,email,address) values(?,?,?,?,?)";
		
		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPw());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getEmail());
			pstmt.setString(5, vo.getAddress());
			
			result = pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null); //rs는 사용하지 않았으니 그냥 null값을 넣어줌(사실 그냥 넣어도 상관없긴 함.) 
		}
		
		return result;
	}
	
	//로그인 메서드
	public UserVO login(String id, String pw) {
		UserVO vo =null;
		
		String sql = "select * from users where id =? and pw =?";
		
		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo = new UserVO();
				vo.setId(rs.getString("id"));
				vo.setName(rs.getString("name"));
				
			}
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	//getInfo 메서드
	public UserVO getInfo(String id) {
		UserVO vo = null;
		
		String sql = "select * from users where id = ?";
		
		try {
			
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String id2 = rs.getString("id");
				String pw = rs.getString("pw");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String address = rs.getString("address");
				
				vo = new UserVO(id2,pw,name,email,address,null);
				
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return vo;
	}
	
	//update 메서드
	public int update(UserVO vo) {
		int result = 0;
		
		String sql = "update users set pw = ?, name = ?, email = ?, address = ? where id = ?";
		
		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPw());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	//delete 메서드
	public int delete(String id) {
		int result = 0;
		
		String sql = "delete from users where id =?";
		
		try {
//			conn = DriverManager.getConnection(url, uid, upw);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			result = pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null);
		}
		return result;
	}
	
	
}//end
