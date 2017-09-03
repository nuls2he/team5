package com.wt.hottoon.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wt.hottoon.domain.HotToon;
import com.wt.hottoon.domain.HotToonReply;

import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class HotToonReplyDAO {
	public List<HotToonReply> selectReply(int no)
	{
		List<HotToonReply> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from t97_hotreply ");
			sql.append("order by ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				HotToonReply reply = new HotToonReply();
				reply.setRepNo(rs.getInt("rep_no"));
				reply.setNo(rs.getInt("no"));
				reply.setId(rs.getString("id"));
				reply.setContent(rs.getString("content"));
				reply.setRegDate(rs.getTimestamp("reg_date"));
				list.add(reply);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return list;
	}
	
	public void createReply(HotToon ht, String content)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into t97_hotreply(rep_no, no, id, content) ");
			sql.append(" values(s2_board.nextVal, ?, ?, ?)");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, ht.getNo());
			pstmt.setString(2, ht.getId());
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	public boolean deleteReply(int repNo)
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete ");
			sql.append(" from t97_hotreply");
			sql.append(" where rep_no = ?");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, repNo);
			int cnt = pstmt.executeUpdate();
			
			if(cnt != 0)
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
