package com.wt.hottoon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wt.hottoon.domain.HotToon;

import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class HotToonDAO {
	
	
	public List<HotToon> selectHotToon()
	{
		List<HotToon> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from t97_hottoon");
			
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				HotToon hottoon = new HotToon();
				hottoon.setNo(rs.getInt("no"));
				hottoon.setId(rs.getString("id"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setImagePath(rs.getString("imagepath"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setUrl(rs.getString("url"));
				hottoon.setRegDate(rs.getDate("reg_date"));
				list.add(hottoon);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return list;
	}
	
	public List<HotToon> selectByGenre(String genre)
	{
		List<HotToon> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from t97_hottoon");
			sql.append(" where genre = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, genre);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				HotToon hottoon = new HotToon();
				hottoon.setNo(rs.getInt("no"));
				hottoon.setId(rs.getString("id"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setImagePath(rs.getString("imagepath"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setUrl(rs.getString("url"));
				hottoon.setRegDate(rs.getDate("reg_date"));
				list.add(hottoon);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return list;
	}
	//create sequence s_board_no;
	public void createHotToon(HotToon hottoon)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert " );
			sql.append("  into t97_hottoon(no, id, genre, completion, title, content, imagepath, url)");
			sql.append("values(s_board_no.nextval, ?, ?, ?, ?, ?, ?, ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, hottoon.getId());
			pstmt.setString(2, hottoon.getGenre());
			pstmt.setString(3, hottoon.getCompletion());
			pstmt.setString(4, hottoon.getTitle());
			pstmt.setString(5, hottoon.getContent());
			pstmt.setString(6, hottoon.getImagePath());
			pstmt.setString(7, hottoon.getUrl());
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
	}
	
	public boolean checkMine(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			
			//권한 체크
			StringBuffer sql = new StringBuffer();
			sql.append("select id ");
			sql.append("  from t97_hottoon");
			sql.append(" where id = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		return false;
	}
	
	public String checkAdmin(String id)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			
			//권한 체크
			StringBuffer sql = new StringBuffer();
			sql.append("select admin_yn ");
			sql.append("  from t97_users");
			sql.append(" where id = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getString("admin_yn");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return null;
	}
	
	public HotToon detailHotToon(int no)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			
			//권한 체크후에 
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from t97_hottoon");
			sql.append(" where no = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			HotToon hottoon = new HotToon();
			if(rs.next())
			{
				hottoon.setNo(rs.getInt("no"));
				hottoon.setId(rs.getString("id"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setImagePath(rs.getString("imagepath"));
				hottoon.setUrl(rs.getString("url"));
				hottoon.setRegDate(rs.getTimestamp("reg_date"));	
				return hottoon;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return null;
	}
	
	public boolean deleteHotToon(int no)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("delete ");
			sql.append("  from t97_hottoon");
			sql.append(" where no = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			int check = pstmt.executeUpdate();
			
			if(check != 0)
				return true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return false;
	}
}
