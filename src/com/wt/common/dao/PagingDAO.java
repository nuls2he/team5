package com.wt.common.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wt.common.domain.PagingVO;
import com.wt.hottoon.domain.HotToon;

import kr.co.mlec.util.ConnectionPool;
import kr.co.mlec.util.JdbcUtil;

public class PagingDAO {
	
	// vo셋팅
	public PagingVO settingVO(int page, int block)
	{
		PagingVO vo = new PagingVO();
		
		vo.setTotalCount(getTotalCount());
		vo.setCountList(2);
		vo.setCountPage(5);
		vo.setPage(page);
		vo.setBlockCount(block);
		vo.setStartPage(1 + vo.getCountPage() * vo.getBlockCount());
		vo.setEndPage(vo.getStartPage() + vo.getCountPage() - 1);
		if(vo.getTotalCount() % vo.getCountList() > 0)
		{
			vo.setTotalPage((int)Math.ceil((double)vo.getTotalCount() / (double)vo.getCountList()) + 1);
		}
		vo.setTotalPage((int)Math.ceil((double)vo.getTotalCount() / (double)vo.getCountList()));
		
		if(vo.getEndPage() > vo.getTotalPage())
		{
			vo.setEndPage(vo.getTotalPage()); 
		}
		vo.setLastBlock(vo.getTotalPage() / vo.getCountPage());
		
		System.out.println("TotalList : " + vo.getTotalCount());
		System.out.println("나눌 게시물 개수 : " + vo.getCountList());
		System.out.println("나눌 페이지 개수 : " + vo.getCountPage());
		System.out.println("현재 페이지 : " + vo.getPage());
		System.out.println("현재 블록 : " + vo.getBlockCount());
		System.out.println("시작 페이지 : " + vo.getStartPage());
		System.out.println("끝 페이지 : " + vo.getEndPage());
		System.out.println("총 페이지 : " + vo.getTotalPage());
		return vo;
	}
	
	
	// 게시물 총 개수
	public int getTotalCount()
	{
		Connection con = null;
		PreparedStatement pstmt = null;
		int total = 0;
		try {
			con = ConnectionPool.getConnection();
			
			StringBuffer sql = new StringBuffer();
			sql.append("select COUNT(*) as count " );
			sql.append("  from t97_hottoon" );

			
			pstmt = con.prepareStatement(sql.toString());
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				total = rs.getInt("count");
			}
			return total;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(pstmt);
			ConnectionPool.releaseConnection(con);
		}
		
		return total;
	}
	
	
	
	// 페이지 블락 관련
	// 보여줄 테이블 수가 최대 페이지 수가 넘으면 최대 페이지 수로 보정
}
