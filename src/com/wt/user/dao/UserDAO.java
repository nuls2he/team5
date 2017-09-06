package com.wt.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Calendar;

import com.wt.user.domain.User;

import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class UserDAO {
	
	public void join(User usr) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into tb_users (id, nick, pwd, email, hintQ, hintA) ");
			sql.append(" values (?, ?, ?, ?, ?, ?) ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, usr.getID());
			pstmt.setString(2, usr.getNick());
			pstmt.setString(3, usr.getPwd());
			pstmt.setString(4, usr.getEmail());
			pstmt.setString(5, usr.getHintQ());
			pstmt.setString(6, usr.getHintA());
			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	
	public User login(User user) {
		Connection con = null;
		PreparedStatement pstmt = null;
		User usr = new User();

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append(" select * ");
			sql.append("   from tb_users ");
			sql.append("  where id = ? and pwd = ? ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, user.getID());
			pstmt.setString(2, user.getPwd());
			
			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				usr.setID(rs.getString("id"));
				usr.setNick(rs.getString("nick"));
				usr.setEmail(rs.getString("email"));
				usr.setName(rs.getString("name"));
				usr.setCall(rs.getString("call"));
				usr.setAddr(rs.getString("addr"));
				return usr;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		return null;
	}
	
	
	public User showInfo(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append(" select * ");
			sql.append("   from tb_users ");
			sql.append(" where id = ? ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			System.out.println("쿼리시작");
			while (rs.next()) {
				User usr = new User();
				usr.setID(rs.getString("id"));
				usr.setNick(rs.getString("nick"));
				usr.setEmail(rs.getString("email"));
				usr.setName(rs.getString("name"));
				usr.setCall(rs.getString("call"));
				String[] addr = rs.getString("addr").split("_");
				usr.setAddHead(addr[0]);
				usr.setAddTail(addr[1]);
				return usr;
			} 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		return null;
	}
	
	public void updateInfo(User usr) {
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append(" update tb_users ");
			sql.append("    set email = ?, ");
			sql.append("    	name = ?, ");
			sql.append("    	call = ?, ");
			sql.append("    	addr = ?, ");
			sql.append(" where id = ? ");
			
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, usr.getEmail());
			pstmt.setString(2, usr.getName());
			pstmt.setString(3, usr.getCall());
			pstmt.setString(4, usr.getAddr());
			pstmt.setString(5, usr.getID());
			
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	
	public String findID(User usr) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append(" select id ");
			sql.append("   form tb_users ");
			sql.append("  where nick = ? and email = ? ");

			pstmt = con.prepareStatement(sql.toString());

			pstmt.setString(1, usr.getNick());
			pstmt.setString(2, usr.getEmail());
			
			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) return rs.getString("id");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		return null;
	}
	
	public String findPW(User usr) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ConnectionPool.getConnection();

			StringBuffer sql = new StringBuffer();
			sql.append(" select pwd ");
			sql.append("   from tb_users ");
			sql.append("  where id = ? and hintQ = ? and hintA = ? ");

			pstmt = con.prepareStatement(sql.toString());

			ResultSet rs = pstmt.executeQuery();
			
			if (rs.next()) return rs.getString("pwd");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		return null;
	}
	
	 public String adult(String id, int birthYear, int birthMonth, int birthDay){
	         Calendar now = Calendar.getInstance();
	         int nowYear  = now.get(Calendar.YEAR);
	         int nowMonth = now.get(Calendar.MONTH) + 1;
	         int nowDay   = now.get(Calendar.DAY_OF_MONTH);
	        
	         // 만 나이
	         int age = nowYear - birthYear;
	         // 생일 안 지난 경우 -1
	         if (birthMonth > nowMonth || birthMonth == nowMonth && birthDay > nowDay) {
	        	 age--;
	        	 
	         }
	        
	        if (age >= 19) {
	        	Connection con = null;
				PreparedStatement pstmt = null;

				try {
					con = ConnectionPool.getConnection();

					StringBuffer sql = new StringBuffer();
					sql.append(" insert into tb_users (chekAD)");
					sql.append(" values (y) ");
					sql.append("  where id = ? ");

					pstmt = con.prepareStatement(sql.toString());
					
					pstmt.setString(1, id);
					
					pstmt.executeUpdate();
					return "인증 완료";
				} catch (Exception e) {
					e.printStackTrace();
					return "인증 오류";
				} finally {
					JdbcUtil.close(pstmt);
					ConnectionPool.releaseConnection(con);
				}
	        } else return "만 19세 이상이 아닙니다.";
	       
	 }
} // .class
