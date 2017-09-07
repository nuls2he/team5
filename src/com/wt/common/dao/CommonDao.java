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
			
			String selT = search.getSelType();
			StringBuffer sql = new StringBuffer();
			sql.append("select B.* from (select rownum rnum, A.* ");
			sql.append("			   from ( ");
			sql.append("				 select *");
			sql.append("				 from toon ");
			sql.append("				 where type = ? ");
			if (selT != null) { 
//				String tot = "select count(*) as totalCount from toon where type = '?'";
//				stmt = con.prepareStatement(tot.toString());
//				stmt.setString(1, tot);
				if("no".equals(selT)) {
					sql.append("	 	 and no = ? ");
				}
				else if("title".equals(selT)) {
					sql.append("	 	 and title = ? ");
				}
				else {
					sql.append("	 	 and no = ? ");
				}
			}
			sql.append("				 order by no desc ");
			sql.append("	 	 	)A");
			sql.append(")B");
			sql.append(" where rnum <= 5*(?+1) and rnum > 5*(?) ");
			System.out.println(sql);
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, search.getType());
			if (selT != null) { 
				if(selT.equals("no") || selT.equals("title")  ) {
					stmt.setString(2, search.getWord());
					stmt.setInt(3, search.getRnum());
					stmt.setInt(4, search.getRnum());
				}
			}
			else {
				stmt.setInt(2, search.getRnum());
				stmt.setInt(3, search.getRnum());
			}
			
			System.out.println("조회dao 실행");
			System.out.println("조회 dao word: " + search.getWord());
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				Common toon = new Common();
				toon.setNo(rs.getInt("no"));
				toon.setTitle(rs.getString("title"));
				toon.setContent(rs.getString("content"));
				toon.setImagepath(rs.getString("imagepath"));
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
			
			sql.append("insert into toon(no, title, id, content, imagepath, type) ");
			sql.append("values(toon_seq.nextval, ?, ?, ?, ?, ?) ");
			
			stmt = con.prepareStatement(sql.toString());
			System.out.println(newToon.getTitle());
			System.out.println(newToon.getId());
			System.out.println(newToon.getContent());
			System.out.println(newToon.getImagepath());
			System.out.println(newToon.getType());
			System.out.println("등록dao 실행");
		
			stmt.setString(1, newToon.getTitle());
			stmt.setString(2, newToon.getId());
			stmt.setString(3, newToon.getContent());
			stmt.setString(4, newToon.getImagepath());
			stmt.setString(5, newToon.getType());		
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
	}	
	
	public int pageBoard(String type) {
		Connection con = null;
		PreparedStatement stmt = null;
		int pnum = 0;
		try {
			con = ConnectionPool.getConnection();
			StringBuffer sql = new StringBuffer();
			
			sql.append("select count(*) as totalCount from toon where type = ?");
			
			stmt = con.prepareStatement(sql.toString());
		
			stmt.setString(1, type);
			ResultSet rs = stmt.executeQuery();
			if(rs.next()) {				
				pnum = rs.getInt("totalcount");		
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(stmt);
			ConnectionPool.releaseConnection(con);
		}
		return pnum;
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
			sql.append("    imagepath = ? ");			
			sql.append("where no = ? ");
			/*and id = ?*/
			System.out.println(sql);
			stmt = con.prepareStatement(sql.toString());
			stmt.setString(1, newToon.getTitle());
			stmt.setString(2, newToon.getContent());
			stmt.setString(3, newToon.getImagepath());
			stmt.setInt(4, newToon.getNo());

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
