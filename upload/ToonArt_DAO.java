package com.wt.dao.toonart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wt.common.domain.Search;
import com.wt.common.domain.ToonArt;
import com.wt.util.ConnectionPool;
import com.wt.util.JdbcUtil;

public class ToonArt_DAO {
	int no = 0;
	Connection con = null;
	PreparedStatement stmt  = null;
	
	public List<ToonArt> selectToon(Search art){
		List<ToonArt> list = new ArrayList<>();
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("  from toon ");
			sql.append(" where type = ? ");
			if (art.getType().equals("no")) {
				sql.append("and no = ?");
			} else if (art.getType().equals("title")) {
				sql.append("and title like  '%' || ? || '%'");
			}
				
			sql.append(" order by no desc ");
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, "t");	

			if (art.getType().equals("no") ||  art.getType().equals("title")) {
				stmt.setString(2, art.getWord());	
			}
			
			
			ResultSet rs = stmt.executeQuery();
			while(rs.next()){
				ToonArt tart = new ToonArt();
				tart.setNo(rs.getInt("no"));
	            tart.setTitle(rs.getString("title"));
	            tart.setContent(rs.getString("contents"));
	            tart.setImage(rs.getString("image"));
	            tart.setHits(rs.getInt("hits"));
	            tart.setRegdate(rs.getDate("reg_date"));
	            tart.setType(rs.getString("Type"));
	            tart.setId(rs.getString("id"));
				list.add(tart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return list;
	}

	public void updateToon(ToonArt tart){
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update toon ");
			sql.append("   set title = ? ");
			sql.append("       content = ?");
			sql.append(" where no = ?, ");
			sql.append(" 	   type = t ");
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, tart.getTitle());
			stmt.setString(2, tart.getContent());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
			
		}
	}
	public boolean deleteToon(int no){
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("delete");
			sql.append("  from toon");
			sql.append(" where no = ?, ");
			sql.append(" 	   type = t ");
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, no);
			int cnt = stmt.executeUpdate();
			if(cnt == 0){
				return false;
			}else{
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally{
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	
	
	
	
}//.class
