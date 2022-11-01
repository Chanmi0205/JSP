package common;

import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class JDBConnect {
	
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	  // 생성자1 test
	  public JDBConnect() {
		  try { // DB연결! -> JDBC 드라이버 사용 
			  Class.forName("oracle.jdbc.OracleDriver");
			  String url = "jdbc:oracle:thin:@localhost:1521:xe"; String id = "musthave";
			  String pw = "1234";
			  conn = DriverManager.getConnection(url, id, pw);
			  System.out.println("DB 연결 완료 (생성자 버전1)"); 
		  } catch (Exception e) {
			  e.printStackTrace(); 
		  } 		
	  }
	  
	  // 생성자2 test
	  public JDBConnect(String driver, String url, String id, String pw) {
		  try {
			  Class.forName(driver); conn = DriverManager.getConnection(url, id, pw);
			  System.out.println("DB 연결 완료 (생성자 버전2)");
		  } catch (Exception e) { 
			  e.printStackTrace(); 
	  	  } 
	  }
	  
	// 생성자3 test
	  public JDBConnect(ServletContext application) {
		  try { 
			  String driver = application.getInitParameter("OracleDriver"); 
			  String url = application.getInitParameter("OracleURL"); 
			  String id = application.getInitParameter("OracleId"); 
			  String pw = application.getInitParameter("OraclePw");
			  Class.forName(driver); conn = DriverManager.getConnection(url, id, pw);
	  		  System.out.println("DB 연결 완료(생성자 버전3)"); 
		  } catch (Exception e) {
			  e.printStackTrace(); 
		  }	 
	  }

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();

			System.out.println("JDBC 자원 반납완료~");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}