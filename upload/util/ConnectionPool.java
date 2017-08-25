package kr.co.mlec.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.List;

public class ConnectionPool {
	private static final int INIT_COUNT = 5;						// 최초 로딩시 연결할 커넥션 갯수
	private static List<Connection> free = new ArrayList<>();		// 사용가능한 커넥션
	private static List<Connection> used = new ArrayList<>();		// 사용중인 커넥션
	
	static {		// 클래스정보 로딩시 자동 실행
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			for (int i = 0; i < INIT_COUNT; i++) {
				Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "hr", "hr");
				free.add(con);
			}
		} catch (Exception e) {
			System.out.println("초기 풀 생성시 오류 발생");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws Exception {
		if (free.isEmpty()) {		// free가 비어있다면 -> 모든 커넥션이 사용중...
			throw new Exception("모든 커넥션이 사용중입니다.");
		}
		
		
		Connection con = free.remove(0);		// free 0번째 커넥션으 꺼낸다.	꺼낸공간은 비어있게됨
		used.add(con);							// 꺼낸 커넥션을 used로 옮기고
		return con;								// 호출한 곳으로 커넥션을 반환해준다.
	}
	
	public static void releaseConnection(Connection con) {		// 커넥션 반환
		used.remove(con);
		free.add(con);
	}
	
	public static void main(String[] args) {
		try {
			for (int i = 0; i < 10; i++) {
				System.out.println(i+1 + "번째 요청");
				Thread.sleep(1000);		// 일정 시간동안 멈추었다 실행되게함.  1000 -> 1초 이므로 1초마다 실행
				Connection con = ConnectionPool.getConnection();
				System.out.println(con);
				ConnectionPool.releaseConnection(con);
			}
		} catch (Exception e) {
			e.printStackTrace();		// 오류 멘트 확인
		}
	}
}
