package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class MemberDAO {
	//멤버변수(클래스 전체 멤버메소드에서 접근 가능)
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	
	//기본생성자
	public MemberDAO() {
		System.out.println("MemberDAO생성자 호출");
	}

	public MemberDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "kosmo61_user";
			String pw = "1234";
			con = DriverManager.getConnection(url,id,pw);
			System.out.println("DB연결성공");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//방법1: 회원의 존재유무만 판단한다.
	public boolean isMember(String id, String pass) {
		String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pass=?";
		int isMember = 0;
		boolean isFlag = false;
		
		try {
			//prepare객체로 쿼리문 전송
			psmt = con.prepareStatement(sql);
			//인파라미터 설정
			psmt.setString(1, id);
			psmt.setString(2, pass);
			//쿼리실행
			rs = psmt.executeQuery();
			//실행결과를 가져오기 위해 next() 호출
			rs.next();
			
			isMember = rs.getInt(1);
			System.out.println("affected:"+ isMember);
			if(isMember==0) {
				isFlag = false;
			}
			else {
				isFlag = true;
			}
		}
		catch (Exception e) {
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	
	//방법2: 회원인증 후 MemberDTO객체로 회원정보를 반환한다.
	public MemberDTO getMemberDTO(String uid, String upw) {
		//DTO객체를 생성한다.
		MemberDTO dto = new MemberDTO();
		//쿼리문을 작성
		String query = "SELECT id,pass,name FROM member WHERE id=? AND pass=?";
		
		try {
			//prepared 객체 생성
			psmt = con.prepareStatement(query);
			//쿼리문의 인파라미터 설정
			psmt.setString(1, uid);
			psmt.setString(2, upw);
			//오라클로 쿼리문 전송 및 결과셋(ResultSet) 반환받음
			rs = psmt.executeQuery();
			//오라클이 반환해준 ResultSet이 있는지 확인
			//반환값이 여러개일 경우 while문으로 계속 loop를 돌며 확인을 하고, 현재의 경우 레코드값이 1개이므로 if문을 사용한다.
			if(rs.next()) {
				//rs.next()가 true를 반환했다면 결과셋 있음
				//DTO객체에 회원 레코드의 값을 저장한다.
				dto.setId(rs.getString("id")); //컬럼명을 써도 되고, 인덱스 넘버를 써도 된다.
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString("pass"));
			}
			else {
				//false를 반환했다면 결과셋 없음
				System.out.println("결과셋이 없습니다.");
			}
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}
		//DTO객체를 반환한다. 오라클이 반환한 ResultSet의 값이 없는 경우 내용이 빈 DTO객체를 반환한다.
		return dto;
	}
	
	
	//방법3:
	public Map<String, String> getMemberMap(String id, String pwd) {
		
		Map<String, String> maps = new HashMap<String, String>();
		String query = "SELECT id, pass, name FROM member WHERE id=? AND pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				maps.put("id", rs.getString(1));
				maps.put("pass", rs.getString("pass"));
				maps.put("name", rs.getString("name"));
			}
			else {
				System.out.println("결과셋이 없습니다.");
			}
		}
		catch (Exception e) {
			System.out.println("getMemberDTO오류");
			e.printStackTrace();
		}
		return maps;
	}
	
}
