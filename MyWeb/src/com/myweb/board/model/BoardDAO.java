package com.myweb.board.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.myweb.util.JdbcUtil;


public class BoardDAO {

private static BoardDAO instance = new BoardDAO();
	
	
	private BoardDAO() {
		try {
			//Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//커넥션풀을 얻는방법
			InitialContext ctx = new InitialContext(); //이안에 커넥션풀이 담겨있음
			ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
			
		} catch (Exception e) {
			System.out.println("드라이버 호출 에러!");
		}
	}
	
	public static BoardDAO getInstance() {
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
	
	//글등록 메서드
	public void regist(String writer,String title, String content) {
		
		String sql = "insert into board(bno,writer,title,content) values(board_seq.nextval,?,?,? ) ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}
	
	//글목록 조회
	/*public ArrayList<BoardVO> getList(){
		ArrayList<BoardVO> list = new ArrayList<>();
		
		String sql = "select * from board order by bno desc";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");//날짜형은 Timestamp() or Date()
				int hit = rs.getInt("hit");
				
				BoardVO vo = new BoardVO(bno,writer,title,content,regdate,hit);
				
				list.add(vo);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return list;
	}
	*/
	/////////////////////////////////pageNum과 amount를 파라미터로 받는 메서드 생성////////////////////////////////////////
	
	//글 목록 조회 메서드
	public ArrayList<BoardVO> getList(int pageNum, int amount){
		
		ArrayList<BoardVO> list = new ArrayList<>();
		
		String sql = "select *\r\n" + 
				"from(select rownum as rn,\r\n" + 
				"            a.* \r\n" + 
				"     from(select *\r\n" + 
				"          from board \r\n" + 
				"          order by bno desc\r\n" + 
				"          )a\r\n" + 
				") where rn > ? and rn <=? ";
		
		try {
			conn = ds.getConnection();
			 
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, (pageNum-1)*amount );
			pstmt.setInt(2, pageNum*amount);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				BoardVO vo = new BoardVO(bno,writer,title,content,regdate,hit);
				
				list.add(vo);
			}		
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		
		return list;
	}
	
	//전체게시글 수 
	public int getTotal() {
		int result = 0;
		
		String sql = "select count(*) as total from board";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
		if(rs.next()) {
			result = rs.getInt("total");
		}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	
	//글 상세조회 메서드
	public BoardVO getContent(String bno1) {
		BoardVO vo = null;
		
		String sql= "select * from board where bno=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bno1);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int bno = rs.getInt("bno");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp regdate = rs.getTimestamp("regdate");
				int hit = rs.getInt("hit");
				
				vo = new BoardVO(bno,writer,title,content,regdate,hit);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
		return vo;
	}
	
	//업데이트 메서드
	public void update(String bno, String title, String content) {
		
		String sql ="update board set title = ? ,content = ? , regdate = sysdate where bno= ? ";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, bno);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}

	//글 삭제 메서드
	public void delete(String bno) {
		
		String sql = "delete from board where bno = ?";
		
		try {
			conn= ds.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, rs);
		}
	}
	
	//upHit메서드
	public void upHit(String bno) {
		
		String sql = "update board set hit = hit + 1 where bno = ?";
		
		try {
			conn= ds.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, bno);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn, pstmt, null);
		}
	}
	
	
}//end
