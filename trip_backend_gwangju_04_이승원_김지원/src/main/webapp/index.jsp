<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String root = request.getContextPath();
String userId = (String)session.getAttribute("userId");
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
	
          <li><a class="nav-link scrollto" href="<%= root %>/article?action=list">Board</a></li>
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
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
      <h1>Won<span>Trip.</span></h1>
      <h3>여행을 원하다.<br>여행 정보를 알아보고<br>나만의 여행 계획을 만들어 보세요.</h3>
      <div class="d-flex">
        <a href="#customPlan" class="btn-get-started scrollto">Plan</a>
      </div>
    </div>
  </section><!-- End Login -->

  <main id="main">

    <!-- ======= ByRegion Section ======= -->
    <section id="byRegion" class="byRegion section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>여행지 추천</h2>
          <h3>검색 랭킹 <span>TOP 8</span></h3>
          <p>지역별 관광지 정보를 검색해보세요.<br>주변의 관광명소, 문화시설, 지역 축제 등을 보실 수도 있습니다.<br></br></p>
          <a href="<%=root %>/maptest.jsp" class="btn-more">search</a>
        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/1.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=6bba0262-c894-457a-ae49-124ea96e2db1&big_category=B02&mid_category=B0201&big_area=36" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>가천 다랭이 마을</h4>
                <span>경남 남해군<br></span>
                <h6>자연과 조화를 이룬 최고의 예술품. 명승지로 지정된 다랭이마을</h6>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/2.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=0c70bb97-5ea0-4f1c-99e8-9a8cad34a596&big_category=A01&mid_category=A0101&big_area=36" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>상주은모래비치</h4>
                <span>경남 남해군<br></span>
                <h6>수심이 완만하고 수온이 따뜻해 아이들과 함께하기 좋은 최적의 휴가지</h6>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/3.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=46f51d35-6b2d-4079-879c-5255ff00c3f2&big_category=A02&mid_category=A0206&big_area=1" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>아모레퍼시픽미술관</h4>
                <span>서울 용산구<br></span>
                <h6>아모레퍼시픽 본사에서 만나볼 수 있는 현대 미술 전시</h6>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/4.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=b647a5ef-755d-43ea-83a2-7533ec8feb3c&big_category=A02&mid_category=A0203&big_area=38" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>광양 매화마을</h4>
                <span>전남 광양시<br></span>
                <h6>새하얀 매화 향기 그윽한 광양 매화마을</h6>
              </div>
            </div>
          </div>

        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/5.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=8af99362-9c0b-4da2-8e60-81a1b0a003df&big_category=A01&mid_category=A0101&big_area=39" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>여미지식물원</h4>
                <span>제주 서귀포시<br></span>
                <h6>희귀식물을 포함한 2천여 종의 식물이 있는 온실과, 특색 있는 야외정원을 관람할 수 있는 여미지식물원</h6>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/6.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=8198c334-6d6c-4d87-bdc6-5625b772cc59&big_category=A02&mid_category=A0201&big_area=1" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>창경궁</h4>
                <span>서울 종로구<br></span>
                <h6>그 시절부터 우리가 사랑한 서울의 다섯 궁궐</h6>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/7.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=db820688-14d0-44e7-9f39-82bea9142547&big_category=A01&mid_category=A0101&big_area=36" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>거제식물원(거제정글돔)</h4>
                <span>경남 거제시<br></span>
                <h6>꽃과 나무의 숨결 속에서 자연과 함께하는 공간</h6>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/place/8.jpg" class="img-responsive" alt="" style="height: 400px;">
                <div class="social">
                  <a href="https://korean.visitkorea.or.kr/detail/ms_detail.do?cotid=86f54cfe-54b8-4160-9c05-8d1088392e2d&big_category=A01&mid_category=A0101&big_area=39" target="_blank"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>산방산(제주)</h4>
                <span>제주 서귀포시<br></span>
                <h6>산방산의 자연을 만끽할 수 있는 장소</h6>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->

    <!-- ======= customPlan Section ======= -->
    <section id="customPlan" class="customPlan">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>My Plan</h2>
          <h3> <span>여행 계획 </span>게시판</h3>
          <p>나만의 멋진 계획을 세워 공유해주세요.<br><br></p>
          <a href = "<%= root %>/article?action=mvwrite" class="btn-more"> + </a>
        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/jeju.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href="https://blog.naver.com/gokim0928/222687901573"> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@wonxxi</h4>
                <span>3월 제주도 여행</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/yeosu.jpg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@sw_swl98</h4>
                <span>여수 라테라스리조트</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/pipe.png" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@wxooo_kk</h4>
                <span>서울 한남동 맛집 투어</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/jindo.jpeg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@limyoonsub</h4>
                <span>진도 쏠비치</span>
              </div>
            </div>
          </div>

        </div>

        <div class="row">

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/cafe1.jpeg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@d.i.son
                </h4>
                <span>서울 카페 투어</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/damyang.jpeg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@claireroux</h4>
                <span>담양 여행</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="300">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/busan.jpeg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more</a>
                </div>
              </div>
              <div class="member-info">
                <h4>@ji1hun</h4>
                <span>부산 맛집 투어</span>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="400">
            <div class="member">
              <div class="member-img">
                <img src="assets/img/plan/lotteworld.jpeg" class="img-fluid" alt="">
                <div class="social">
                  <a href=""> more </a>
                </div>
              </div>
              <div class="member-info">
                <h4>@minggwn</h4>
                <span>서울 롯데월드</span>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Team Section -->

    </section><!-- End Services Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Enjoy Trip<span>.</span></h3>
            <p>
              SSAFY 11th <br>
              <a href="https://lab.ssafy.com/kimsg64090/s914_frontend_trip_kimseunggyu_yooseungah"><img src="/assets/img/gitlab.png" alt="" style="height: 25px;"></a>
               김지원 & 이승원
            </p>
          </div>

        </div>
      </div>
    </div>

    <div class="container py-4">
      <div class="copyright">
        &copy; Copyright <strong><span>Enjoy Trip</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
        <!-- You can delete the links only if you purchased the pro version. -->
        <!-- Licensing information: https://bootstrapmade.com/license/ -->
        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/bizland-bootstrap-business-template/ -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <!-- 회원가입 모달 -->
  <div class="modal fade" id="signupModal" tabindex="-1" aria-labelledby="signupModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="signupModalLabel">회원가입</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <!-- 회원가입 폼 -->
          <form action="<%=root%>/members?action=joinmember" method="post">
	          <div class="mb-3">
	            <label for="userName" class="form-label">이름</label>
	            <input type="text" class="form-control" id="userName" name="user_name">
	          </div>
	          <div class="mb-3">
	            <label for="userId" class="form-label">아이디</label>
	            <input type="text" class="form-control" id="userId" name="user_id">
	          </div>
	          <div class="mb-3">
	            <label for="userPassword" class="form-label">비밀번호</label>
	            <input type="password" class="form-control" id="userPassword" name="user_password">
	          </div>
	          <div class="mb-3">
	            <label for="confirmPassword" class="form-label">비밀번호 확인</label>
	            <input type="password" class="form-control" id="confirmPassword" name="confirm_password">
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
	            <input type="submit" value="회원가입" class="btn btn-primary" style="background-color: rgb(119, 76, 12); border-color: rgb(119, 76, 12);">
	          </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  
    <!--로그인 모달-->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="loginModalLabel">로그인</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <!-- 로그인 폼 -->
            <form id="loginForm" method="post" action="<%= root %>/members?action=loginmember">
              <div class="mb-3">
                <label for="userId" class="form-label">아이디</label>
                <input type="text" class="form-control" id="userId2" name="userId">
              </div>
              <div class="mb-3">
                <label for="userPassword" class="form-label">비밀번호</label>
                <input type="password" class="form-control" id="userPassword2" name="userPwd">
              </div>
              <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="로그인" style="background-color: rgb(119, 76, 12); border-color: rgb(119, 76, 12);">
                <button type="button" class="btn btn-primary" style="background-color: burlywood; border-color: burlywood;">아이디 찾기</button>
                <button type="button" class="btn btn-danger" style="background-color: burlywood; border-color: burlywood;">비밀번호 찾기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
      <!--모달 끝-->


  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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