package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

/*
 * Map : {키key : 값 value} 쌍
 * 유저가 선택한 필드 : 제목 / 글쓴이
 * 유저가 입력한 키워드 : __
 * Map<키 데이터형식, 값 데이터형식> 자료이름
 * 
 * 자료이름.put(키) = 값;
 * 자료이름.get(키) => 값이 존재하면 값 출력 / 값이 없으면 null 출력;
 * */

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	// 1. board 테이블에 저장된 게시물의 개수를 반환 : selectCount()
	// 유저가 검색을 희망하는 필드 searchField(제목/글쓴이)에 어떤 데이터searchWord(검색 키워드)가 저장되어있는지!
	public int selectCount(Map<String, Object> map) {
		
		int totalCount = 0;	
		String query = "SELECT COUNT(*) FROM board";
		// 만약 유저가 검색 키워드를 무언가라도 입력했다면!
		if (map.get("searchWord") != null) {
			
			// WHERE 컬럼명 LIKE 조건
			// "WHERE searchField LIKE searchWord 포함하는가 '%searachWord%'
			 
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			
		}
		
		// LIKE 구문 : 부분적으로 일치하는 요소
		// select * from board where like [조건]
		
		// 제목이 A로 시작하는 요소를 찾기
		// select * from board where title LIKE 'A%'
		
		// 제목이 A로 끝나는 요소를 찾기
		// select * from board where title LIKE '%A'
		
		// 제목에 A를 포함하는 요소를 찾기
		// select * from board where title LIKE '%A%'
		
		// 제목이 A로 시작하지 않는 요소를 찾기
		// select * from board where title LIKE '[^A]'
		
		// 제목이 A로 시작하며, 제목이 2글자인 요소 찾기
		// select * from board where title LIKE 'A_';
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			rs.next();
			totalCount = rs.getInt(1); // 인덱스값
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	// 2. board 테이블의 레코드(저장된 데이터)를 가져와서 반환 : selectList()
	
	public List<BoardDTO> selectList(Map<String, Object> map) {
		
		List<BoardDTO> bbs = new Vector<BoardDTO>();
		
		int totalCount = 0;	
		String query = "SELECT * FROM board";
		// 만약 유저가 검색 키워드를 무언가라도 입력했다면!
		if (map.get("searchWord") != null) {
			
			// WHERE 컬럼명 LIKE 조건
			// WHERE searchField LIKE searchWord 포함하는가 '%searachWord%'
			 
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			
		}
		
		// 내림차순 : DESC
		query += " ORDER BY num DESC ";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()) {
				// BoardDTO 안에 데이터를 넣은 뒤, 그 객체를 bbs를 넣어야겠군!
				
				BoardDTO bto = new BoardDTO();
				
				bto.setNum(rs.getString("num"));
				bto.setTitle(rs.getNString("title"));
				bto.setContent(rs.getString("Content"));
				bto.setPostdate(rs.getDate("postdate"));
				bto.setId(rs.getString("id"));
				bto.setVisitcount(rs.getString("visitcount"));
				
				bbs.add(bto);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bbs;
		
	}
	
	public int inserWrite(BoardDTO bto) {
		
		int result=0;
		
		try {
			
			String sql = "INSERT INTO board VALUES(seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
	
			// 게시물 데이터(title, content -> BoradDTO)를 전달받아 DB에 추가!
				

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, bto.getTitle());
			psmt.setString(2, bto.getContent());
			psmt.setString(3, bto.getId());
				
			result = psmt.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 4. 게시글 제목 클릭 시 해당 게시물의 상세 내용을 보여주는, 
	// 즉 게시물의 내용을 반환하는 함수 selectView
	
	//게시물 구분방법 : 전달받은 num을 기준으로 board에서 검색 & 
	//id값을 기준으로 member table에서 name값을 함께 가져와야 함!
	public BoardDTO selectView(String num) { 
		
		BoardDTO bto = new BoardDTO();
		
		try {
			
			String sql = "SELECT board.*, member.name FROM board INNER JOIN member ON board.id = member.id WHERE num=?";
			//SELECT B.*, M.name FROM member M INNER JOIN board B on B.id = M.id WHERE num=?

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);			
			rs = psmt.executeQuery();
			
			if ( rs.next()) {
				bto.setNum(rs.getString("num"));
				bto.setTitle(rs.getNString("title"));
				bto.setContent(rs.getString("content"));
				bto.setId(rs.getString("id"));
				bto.setPostdate(rs.getDate("postdate"));
				bto.setVisitcount(rs.getString("visitcount"));
				
				bto.setName(rs.getString("name"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bto;
	}
	
	//5. 유저가 게시물을 클릭 시, 해당 게시물의 조회수를 1 증가시키는 updateVisitCount() 함수
	
	public void updateVisitCount(String num) {
		
		// UPDATE 테이블명 SET 컬럼 = 변경할값 WHERE 조건
		String sql = "UPDATE board SET visitcount=visitcount+1 WHERE num=?";
		
		try {
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
