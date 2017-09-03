package com.wt.common.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wt.common.domain.Common;
import com.wt.common.domain.Search;
import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class CommonDao {
	// 글번호 처리 
	int no = 0;
	
	// 전체조회, 검색(no, title)
	// 검색버튼 클릭시 -> search에 (no,title)과 data입력 과 동시에 메소드 실행  
	public List<Common> searchToon(Search search){
		List<Common> list = new ArrayList<>();
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
			con = ConnectionPool.getConnection();
			
			String type = search.getType_NT();
			StringBuffer sql = new StringBuffer();
			sql.append("select * ");
			sql.append("from toon ");
			sql.append("where type = ? ");
			if (type != null) { 
			if("no".equals(type)) {
				sql.append("	 and no = ? ");
			}
			else if("title".equals(type)) {
				sql.append("	 and title = ? ");
			}
			}
			sql.append(" order by no desc ");
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, search.getType());
			if (type != null) { 
				if(type.equals("no") || type.equals("title")) {
					stmt.setString(2, search.getWord());
				}
			}
			System.out.println("조회dao 실행");
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Common toon = new Common();
				toon.setNo(rs.getInt("no"));
				toon.setTitle(rs.getString("title"));
				toon.setContent(rs.getString("content"));
				toon.setImage(rs.getString("image"));
				toon.setHits(Integer.parseInt(rs.getString("hits")));
				//toon.setRegdate(rs.getDate("reg_date"));
				toon.setType(rs.getString("type"));
				toon.setId(rs.getString("id"));
				list.add(toon);
		
			}	
			
		} catch (Exception e) {
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return list;
	}
	
	
	
	// no,date sql에서 자동입력
	// type html클릭시 자동 입력
	// 게시판 진입시 id확인하여 동일한 id만 수정버튼 활성화
	// 수정 버튼 클릭시 NewToon에서 id,no,type 자동 입력
	public void insertBoard(Common newToon) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("insert into toon(no, title, id, content, image, type) ");
			sql.append("values(toon_seq.nextval, ?, ?, ?, ?, ?) ");
			
			stmt = con.prepareStatement(sql.toString());
		
			stmt.setString(1, newToon.getTitle());
			stmt.setString(2, newToon.getId());
			stmt.setString(3, newToon.getContent());
			stmt.setString(4, newToon.getImage());
			stmt.setString(5, newToon.getType());		
			stmt.executeUpdate();
			System.out.println("등록dao 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}	
	
	// no,date,type 수정 X
	// 게시판 진입시 id확인하여 동일한 id만 수정버튼 활성화
	// 수정 버튼 클릭시 NewToon에서 id 자동 입력
	public void updateBoard(Common newToon) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("update toon ");
			sql.append("set title = ?, ");
			sql.append("    content = ?, ");
			sql.append("    image = ? ");			
			sql.append("where no = ? ");
			/*and id = ?*/
			System.out.println(sql);
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, newToon.getTitle());
			stmt.setString(2, newToon.getContent());
			stmt.setString(3, newToon.getImage());
			stmt.setInt(4, newToon.getNo());
			System.out.println(newToon.getTitle());
			System.out.println(newToon.getContent());
			System.out.println(newToon.getImage());
			System.out.println(newToon.getNo());
			/*stmt.setString(5, id);*/
			stmt.executeUpdate();

			System.out.println("수정dao 실행");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}
	
	// 게시판 진입시 id확인하여 동일한 id만 수정버튼 활성화
	// no 삭제시 자동 입력
	public boolean deleteBoard(int no) {
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("delete from toon ");
			sql.append("where no = ? " /*"and id = ? "*/);
			
			stmt = con.prepareStatement(sql.toString());
			stmt.setInt(1, no);
			/*stmt.setString(2,id);*/
	
			int cnt = stmt.executeUpdate();
			if (cnt == 1) return true;

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return false;
	}
}
