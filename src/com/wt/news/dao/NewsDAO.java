package com.wt.news.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.wt.news.domain.NewsVO;

import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class NewsDAO {
	
	int no = 0;
	List<NewsVO> list = new ArrayList<>();
	
	public List<NewsVO> selectNews() {
		List<NewsVO> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from tb97_news ");
			sql.append(" order by no desc ");
			
			stmt = con.prepareStatement(sql.toString());
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String pic = rs.getString("pic");
				String url = rs.getString("url");
				Date regDate = rs.getDate("regDate");
				
				NewsVO vo = new NewsVO();
				vo.setNo(no);
				vo.setTitle(title);
				vo.setContent(content);
				vo.setPic(pic);
				vo.setUrl(url);
				vo.setRegDate(regDate);
				
				list.add(vo);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return list;
	}
	
	public void insertNews(NewsVO news) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("insert into tb97_news(no, title, content, pic, url) ");
			sql.append("values(tb97_news_no.nextval, ?, ?, ?, ?) ");
			
			stmt = con.prepareStatement(sql.toString());
			
			int index = 1;
			stmt.setString(index++, news.getTitle());
			stmt.setString(index++, news.getContent());
			stmt.setString(index++, news.getPic());
			stmt.setString(index++, news.getUrl());
			stmt.executeUpdate();
			System.out.println("저장준비");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	public void updateNews(NewsVO news) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("update tb97_news ");
			sql.append("   set title = ?, ");
			sql.append("   	   content = ?, ");
			sql.append("   	   pic = ?, ");
			sql.append("   	   url = ? ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			
			stmt.setString(1, news.getTitle());
			stmt.setString(2, news.getContent());
			stmt.setString(3, news.getPic());
			stmt.setString(4, news.getUrl());
			stmt.setInt(5, news.getNo());
			stmt.executeUpdate();
			System.out.println("저장준비");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	public void deleteNews(int no) {
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("delete  ");
			sql.append("  from tb97_news ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, no);
			stmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	public NewsVO detailNews(int no) {
		Connection con = null;
		PreparedStatement stmt = null;
		NewsVO news = new NewsVO();
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select * from tb97_news ");
			sql.append(" where no = ? ");
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, no);
			System.out.println("번호");
			ResultSet rs = stmt.executeQuery();
			
			if(rs.next()) 
			{
				String title = rs.getString("title");
				String content = rs.getString("content");
				String pic = rs.getString("pic");
				String url = rs.getString("url");
				Date regDate = rs.getTimestamp("regDate");
				
				news.setNo(no);
				news.setTitle(title);
				news.setContent(content);
				news.setPic(pic);
				news.setUrl(url);
				news.setRegDate(regDate);
				System.out.println("board");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return news;
	}
	
}
