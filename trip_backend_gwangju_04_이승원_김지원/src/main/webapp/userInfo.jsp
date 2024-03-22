<%@page import="com.ssafy.trip.members.model.MembersDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%> 
<%
String root = request.getContextPath();
String userId = (String)session.getAttribute("userId");
MembersDto membersDto = (MembersDto)request.getAttribute("membersDto");
%>
<!DOCTYPE html>
<html lang="en">

<head>
  
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>WonTrip</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/ssafy_logo.png" rel="icon">
  <link href="assets/img/ssafy_logo.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">


  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <script type ="text/javascript" src="apikey.js">
  </script>

  <!--로그인, 회원가입 기능이 담김-->
  <script type="text/javascript" src="./assets/js/mainHeader.js"></script>
  <script type="text/javascript" src="./assets/js/userInfo.js"></script>


  <!-- =======================================================
  * Template Name: BizLand
  * Updated: Mar 10 2023 with Bootstrap v5.2.3
  * Template URL: https://bootstrapmade.com/bizland-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  
</head>

<body>
  
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="index.jsp">Won-Trip<span>.</span></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

      <nav id="navbar" class="navbar">
        <ul>
<%
if (userId == null) {
%>
          <li class="nav-item">
            <a href="#" class="btn btn-white" id="loginButton" data-bs-toggle="modal" data-bs-target="#loginModal">
              Login
            </a>
          </li>
          <li class="nav-item">
            <a href="#" class="btn btn-white" id="signupButton" data-bs-toggle="modal" data-bs-target="#signupModal">
              Signup
            </a>
          </li>

<%
} else {
%>
          <li class="nav-item">
            <a href="<%=root %>/members?action=logoutmember" class="btn btn-white" id="logoutButton">
              Logout
            </a>
          </li>
	
          <li><a class="nav-link scrollto" href="#customPlan">My plan</a></li>
          <li><a class="nav-link scrollto" id="myPage" href="<%= root %>/members?action=mypage&userId=<%= userId %>">My Page</a></li>
<%
}
%>
          <!--승원구현-->
          <li><a class="nav-link scrollto" href="#byRegion">Search</a></li>
          <li><a class="nav-link scrollto " href="#">공지사항</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header>
  <!-- End Header -->

  <!-- ======= Home Section ======= -->
  <section id="home" class="d-flex align-items-center">
    <div class="container" id="userInfoTmp" data-aos="zoom-out" data-aos-delay="100">
      <!--js자동 주입-->
      <div class="card text-center">
    	<div class="card-body">
      	<h5 class="card-title">사용자 정보</h5>
      	<ul class="list-group list-group-flush">
        	<li class="list-group-item"><strong>이름:</strong> <%= membersDto.getUserName() %></li>
        	<li class="list-group-item"><strong>아이디:</strong> <%= membersDto.getUserId() %></li>
        	<li class="list-group-item"><strong>이메일:</strong> <%= membersDto.getEmailId() %>@<%= membersDto.getEmailDomain() %></li>
        	<li class="list-group-item"><strong>가입날짜:</strong> <%= membersDto.getJoinDate()%></li>
     	 </ul>
    	</div>
  	  </div>
    </div>

  </section><!-- End Login -->
  <div class="card-footer" align="center" style="margin-top: 20px;">
    <button class="btn btn-primary" id="infoChange" data-bs-toggle="modal" data-bs-target="#changeModal" style="background-color: burlywood; border-color: burlywood;">회원 정보 수정</button>
    <a class="btn btn-danger" href="<%= root %>/members?action=deletemember&userId=<%= userId %>" style="background-color: rgb(119, 76, 12); border-color: rgb(119, 76, 12);">회원 정보 삭제</a>
  </div>
  
  <main id="main">







  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  

  <!-- 수정 모달 -->
  <div class="modal fade" id="changeModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="signupModalLabel">회원 정보 수정</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <form action="<%= root %>/members?action=updatemember&userId=<%= userId %>" method="post">
	        <div class="modal-body" id="changeModal">
	          <!-- 수정 폼 -->
	          <div class="mb-3">
	            <label for="userPassword" class="form-label">기존비밀번호</label>
	            <input type="password" class="form-control" id="preUserPassword">
	          </div>
	          <div class="mb-3">
	            <label for="userPassword" class="form-label">바꿀 비밀번호</label>
	            <input type="password" class="form-control" id="userPassword" name="userPassword">
	          </div>
	          <div class="mb-3">
	            <label for="confirmPassword" class="form-label">바꿀 비밀번호 확인</label>
	            <input type="password" class="form-control" id="confirmPassword">
	          </div>
	          <div class="mb-3">
	            <label for="userEmail" class="form-label">이메일</label>
	            <input type="text" class="form-control" id="userEmail" name="email_id">
	            <select class="form-select" id="userEmailDomain" name="email_domain">
	              <option value="naver.com">naver.com</option>
	              <option value="google.com">google.com</option>
	              <option value="ssafy.com">ssafy.com</option>
	            </select>
	          </div>
	          <div class="modal-footer">
	            <input type="submit" class="btn btn-primary" style="background-color: rgb(119, 76, 12); border-color: rgb(119, 76, 12);">회원정보 수정</button>
	          </div>
  		  </form>
        </div>
        
      </div>
    </div>
  </div>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>