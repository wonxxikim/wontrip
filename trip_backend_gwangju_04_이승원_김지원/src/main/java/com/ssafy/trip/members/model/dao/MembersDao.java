package com.ssafy.trip.members.model.dao;

import com.ssafy.trip.members.model.MembersDto;

public interface MembersDao {
	int idCheck(String userId) throws Exception;
	int joinMember(MembersDto membersDto) throws Exception;
	MembersDto loginMember(String userId, String userPwd) throws Exception;
	MembersDto getMember(String userId) throws Exception;
	int updateMember(MembersDto membersDto) throws Exception;
	int deleteMember(MembersDto membersDto) throws Exception;
}
