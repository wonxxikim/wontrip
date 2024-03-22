package com.ssafy.trip.members.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.ssafy.trip.members.model.MembersDto;
import com.ssafy.trip.members.model.service.MembersServiceImpl;
import com.ssafy.trip.util.DBUtil;

@WebServlet("/members")
public class MembersController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		String root = request.getContextPath();
		HttpSession session = request.getSession();
		System.out.println("action: " + action);
		if ("idcheck".equals(action)) {
			
			
			
		} else if ("joinmember".equals(action)) {
			String userName = request.getParameter("user_name");
			String userId = request.getParameter("user_id");
			String userPassword = request.getParameter("user_password");
			String emailId = request.getParameter("email_id");
			String emailDomain = request.getParameter("email_domain");
			MembersDto membersDto = new MembersDto();
			membersDto.setUserName(userName);
			membersDto.setUserId(userId);
			membersDto.setUserPwd(userPassword);
			membersDto.setEmailId(emailId);
			membersDto.setEmailDomain(emailDomain);
			
			try {
				int cnt = MembersServiceImpl.getInstance().joinMember(membersDto);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			response.sendRedirect("index.jsp");
			
		} else if ("loginmember".equals(action)) {
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPwd");
			try {
				MembersDto membersDto = MembersServiceImpl.getInstance().loginMember(userId, userPwd);
				System.out.println("아이디; 비번" + userId + " " + userPwd);
				if (membersDto != null) {
					//로그인 on 세션에 추가
					session.setMaxInactiveInterval(3000);
					session.setAttribute("userId", userId);
				} else {
					//로그인 실패. alert창 띄우기
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			response.sendRedirect("index.jsp");
			
			
		} else if ("logoutmember".equals(action)) {
			session.invalidate();
			response.sendRedirect("index.jsp");
		} else if ("mypage".equals(action)) {
			String userId = request.getParameter("userId");
			try {
				MembersDto membersDto = MembersServiceImpl.getInstance().getMember(userId);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/userInfo.jsp");
				request.setAttribute("membersDto", membersDto);
				dispatcher.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if ("updatemember".equals(action)) {
			String userId = request.getParameter("userId");
			String userPwd = request.getParameter("userPassword");
			String emailId = request.getParameter("email_id");
			String emailDomain = request.getParameter("email_domain");
			MembersDto membersDto = new MembersDto();
			
			membersDto.setUserId(userId);
			membersDto.setUserPwd(userPwd);
			membersDto.setEmailId(emailId);
			membersDto.setEmailDomain(emailDomain);
			
			int cnt = 0;
			
			try {
				cnt = MembersServiceImpl.getInstance().updateMember(membersDto);
				response.sendRedirect("index.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} else if ("deletemember".equals(action)) {
			String userId = request.getParameter("userId");
			MembersDto membersDto = new MembersDto();
			membersDto.setUserId(userId);
			
			int cnt = 0;
			
			try {
				cnt = MembersServiceImpl.getInstance().deleteMember(membersDto);
				response.sendRedirect("index.jsp");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
