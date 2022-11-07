package common;

import javax.servlet.ServletContext;

// Data Access Object : DB의 데이터에 접근하는 객체. CRUD  작업 수행
public class MemberDAO extends JDBConnect {
	
	/*
	 * public MemberDAO() { super(); }
	 */
	
	// DB에 연결이 완료된 상태의 DAO 객체가 생성!
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	
	 public MemberDAO(ServletContext application) { super(application); }
	 
	
	// 로그인 처리(id, pw값과 일치하는 회원 정보 반환)
	public MemberDTO getMemberDTO(String uid, String upass) {
		
		MemberDTO dto = new MemberDTO();
		
		String sql = "SELECT * FROM member where id=? AND pass=?";
		
		try {
			 psmt = conn.prepareStatement(sql);
			 psmt.setString(1, uid);
			 psmt.setString(2,  upass);
			 rs = psmt.executeQuery();
			 
			 if(rs.next()) {
				 dto.setId(rs.getString("id"));
				 dto.setPass(rs.getString("pass"));
				 dto.setName(rs.getString("name"));
				 dto.setRegidate(rs.getString("regidate"));
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
		
	}
	
	
	public boolean deleteUser(String uid, String upass) {

		String sql = "delete FROM member where id=? AND pass=?";
		
		/*
		 * String sql1 = "SELECT * FROM member WHERE id=? AND pass=?";
		 * String sql2 = "DELETE FROM member WHERE id=? AND pass=?";
		 * try {
		 * 	 psmt = conn.prepareStatement(sql);
		 *   psmt.setString(1, uid);
		 *   psmt.setString(2, upass);
		 *   rs = psmt.executeQuery();
		 *  
		 *  if ( rs.next() ) {
		 *  	psmt = conn.prepareStatement(sql2);
		 *  	psmt.setString(1, uid);
		 *  	psmt.setString(2, upass);
		 *  
		 *  	int result = psmt.executeUpdate();
		 *  	System.out.println(result+"개의 데이터가 삭제되었습니다.");
		 *  	
		 *  	return true;
		 *  }
		 *   catch (Exception e) {
		 *  	e.printStackTrace();
		 *  }
		 *  
		 *  return false;
		 *  
		 * */
		
		try {
			 // X conn.createStatement();
			 psmt = conn.prepareStatement(sql);
			 psmt.setString(1, uid);
			 psmt.setString(2, upass);
			 int result = psmt.executeUpdate();
			 
			 if ( result == 1 ) {
				 return true; 
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}