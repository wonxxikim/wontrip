package com.ssafy.trip.members.model.service;

import com.ssafy.trip.members.model.MembersDto;
import com.ssafy.trip.members.model.dao.MembersDaoImpl;

public class MembersServiceImpl implements MembersService{
	
	private static MembersService instance = new MembersServiceImpl();
	private MembersServiceImpl() {};
	
	public static MembersService getInstance() {
		return instance;
	}
	
	
	@Override
	public int idCheck(String userId) throws Exception {
		return MembersDaoImpl.getInstance().idCheck(userId);
	}

	@Override
	public int joinMember(MembersDto membersDto) throws Exception {
		return MembersDaoImpl.getInstance().joinMember(membersDto);
	}

	@Override
	public MembersDto loginMember(String userId, String userPwd) throws Exception {
		return MembersDaoImpl.getInstance().loginMember(userId, userPwd);
	}

	@Override
	public MembersDto getMember(String userId) throws Exception{
		return MembersDaoImpl.getInstance().getMember(userId);
	}

	@Override
	public int updateMember(MembersDto membersDto) throws Exception {
		return MembersDaoImpl.getInstance().updateMember(membersDto);
	}

	@Override
	public int deleteMember(MembersDto membersDto) throws Exception {
		return MembersDaoImpl.getInstance().deleteMember(membersDto);
	}


	
	
}
