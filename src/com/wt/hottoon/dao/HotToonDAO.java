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
	
	// 여기서는 페이지에 맞는 데이터를 반환
	public List<HotToon> selectHotToon(String genre, int countList, int page)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		List<HotToon> list = new ArrayList<>();
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select X.* " );
			sql.append("  from (select rownum as rnum, A.*");
			sql.append("		  from (select * ");
			sql.append("		          from t97_hottoon");
			if(genre != null)
			{
				if(!genre.isEmpty())
					sql.append("		         where genre = ?");
			}
			sql.append("  				order by reg_date) A");
			sql.append("  		 where rownum <= ?) X");
			sql.append(" where X.rnum >= ?");
			
			pstmt = con.prepareStatement(sql.toString());
			int index = 0;
			if(genre != null)
			{
				if(!genre.isEmpty())
					pstmt.setString(++index, genre);
			}
			int startList = page * countList;
			int endList = page * countList - (countList - 1);
			
			pstmt.setInt(++index, startList);
			pstmt.setInt(++index, endList);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				HotToon hottoon = new HotToon();
				hottoon.setNo(rs.getInt("no"));
				hottoon.setId(rs.getString("userid"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setImagePath(rs.getString("imagepath"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setRegDate(rs.getDate("reg_date"));
				list.add(hottoon);
			}
			
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return list;
	}
	
	/*public List<HotToon> selectHotToon(String genre)
	{
		List<HotToon> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from t97_hottoon ");
			if(genre != null)
			{
				sql.append(" where genre = ? ");
			}
			sql.append("order by no desc");
			pstmt = con.prepareStatement(sql.toString());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				HotToon hottoon = new HotToon();
				hottoon.setNo(rs.getInt("no"));
				hottoon.setId(rs.getString("userid"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setImagePath(rs.getString("imagepath"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setRegDate(rs.getDate("reg_date"));
				list.add(hottoon);
			}
			System.out.println("list: " + list);
			return list;
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return list;
	}*/
	
	public HotToon selectByNo(int no)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		HotToon hottoon = new HotToon();
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from t97_hottoon");
			sql.append(" where no = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				hottoon.setNo(rs.getInt("no"));
				hottoon.setId(rs.getString("userid"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setImagePath(rs.getString("imagepath"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setRegDate(rs.getDate("reg_date"));
			}
			return hottoon;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return hottoon;
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
			sql.append("  into t97_hottoon(no, userid, genre, completion, title, content, imagepath)");
			sql.append("values(s97_hottoon_no.nextval, ?, ?, ?, ?, ?, ?)");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, hottoon.getId());
			pstmt.setString(2, hottoon.getGenre());
			pstmt.setString(3, hottoon.getCompletion());
			pstmt.setString(4, hottoon.getTitle());
			pstmt.setString(5, hottoon.getContent());
			pstmt.setString(6, hottoon.getImagePath());
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
			sql.append(" where userid = ?");
			
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
			sql.append(" where userid = ?");
			
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
				hottoon.setId(rs.getString("userid"));
				hottoon.setGenre(rs.getString("genre"));
				hottoon.setCompletion(rs.getString("completion"));
				hottoon.setTitle(rs.getString("title"));
				hottoon.setContent(rs.getString("content"));
				hottoon.setImagePath(rs.getString("imagepath"));
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
