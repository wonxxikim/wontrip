package com.ssafy.trip.members.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Result;
import com.ssafy.trip.members.model.MembersDto;
import com.ssafy.trip.util.DBUtil;

public class MembersDaoImpl implements MembersDao {
	
	private static MembersDao instance = new MembersDaoImpl();
	
	private MembersDaoImpl() {};
	
	public static MembersDao getInstance() {
		return instance;
	}
	
	@Override
	public int idCheck(String userId) throws Exception {
		return 0;
	}

	@Override
	public int joinMember(MembersDto membersDto) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBUtil dbUtil = DBUtil.getInstance();
		int cnt = 0;
		try {
			conn = dbUtil.getConnection();
			String sql = "insert into members values(?, ?, ?, ?, ?, CURRENT_DATE)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersDto.getUserId());
			pstmt.setString(2, membersDto.getUserName());
			pstmt.setString(3, membersDto.getUserPwd());
			pstmt.setString(4, membersDto.getEmailId());
			pstmt.setString(5, membersDto.getEmailDomain());
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			dbUtil.close(pstmt, conn);
		}

		return cnt;
	}

	@Override
	public MembersDto loginMember(String userId, String userPwd) throws Exception {
		MembersDto membersDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBUtil dbUtil = DBUtil.getInstance();
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder loginMember = new StringBuilder();
			loginMember.append("select user_id, user_name \n");
			loginMember.append("from members \n");
			loginMember.append("where user_id = ? and user_password = ? \n");
			pstmt = conn.prepareStatement(loginMember.toString());
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				membersDto = new MembersDto();
				membersDto.setUserId(rs.getString("user_id"));
				membersDto.setUserName(rs.getString("user_name"));
				System.out.println("DaoImpl" + membersDto.getUserId());
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return membersDto;
	}

	@Override
	public MembersDto getMember(String userId) throws Exception{
		MembersDto membersDto = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBUtil dbUtil = DBUtil.getInstance();
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder loginMember = new StringBuilder();
			loginMember.append("select * \n");
			loginMember.append("from members \n");
			loginMember.append("where user_id = ?\n");
			pstmt = conn.prepareStatement(loginMember.toString());
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				membersDto = new MembersDto();
				membersDto.setUserId(rs.getString("user_id"));
				membersDto.setUserName(rs.getString("user_name"));
				membersDto.setEmailId(rs.getString("email_id"));
				membersDto.setEmailDomain(rs.getString("email_domain"));
				membersDto.setJoinDate(rs.getString("join_date"));
				System.out.println("DaoImpl" + membersDto.getUserId());
			}
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		return membersDto;
	}

	@Override
	public int updateMember(MembersDto membersDto) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBUtil dbUtil = DBUtil.getInstance();
		int cnt = 0;
		try {
			conn = dbUtil.getConnection();
			String sql = "update members set user_password=?, email_id=?, email_domain=?"
					+ " where user_id=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, membersDto.getUserPwd());
			pstmt.setString(2, membersDto.getEmailId());
			pstmt.setString(3, membersDto.getEmailDomain());
			pstmt.setString(4, membersDto.getUserId());
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			dbUtil.close(pstmt, conn);
		}
		
		
		return cnt;
	}

	@Override
	public int deleteMember(MembersDto membersDto) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		DBUtil dbUtil = DBUtil.getInstance();
		int cnt = 0;
		try {
			conn = dbUtil.getConnection();
			String sql = "delete from members where user_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, membersDto.getUserId());
			cnt = pstmt.executeUpdate();
			
		} finally {
			dbUtil.close(pstmt, conn);
		}

		return cnt;
	}


	
	
	
	
}
