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

  <title>Search</title>
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
  <style>
    #map {
      width: 100%;
      height: 500px;
      margin-top: 20px;
    }
    .container {
      max-width: 900px;
      margin: auto;
      padding-top: 20px;
    }
    .custom-select {
      margin: 10px 0;
    }
  </style>

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

      <h1 class="logo"><a href="<%=root %>/index.jsp">Won-Trip<span>.</span></a></h1>
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
  </header><!-- End Header -->

  <!-- ======= Home Section ======= -->
  <section id="homef" class="d-flex align-items-center">
    <div class="container" data-aos="zoom-out" data-aos-delay="100">
        <h1 class="text-center">Map</h1>
        <div class="row">
          <div class="col">
            <select id="location" class="custom-select">
              <option value="">---지역을 선택해주세요---</option>
              <option value="서울">서울</option>
              <option value="부산">부산</option>
              <option value="인천">인천</option>
              <option value="대구">대구</option>
              <option value="안양">안양</option>
              <option value="대전">대전</option>
            </select>
          </div>
          <div class="col">
            <select id="type" class="custom-select">
              <option value="">---컨텐츠를 선택해주세요---</option>
              <option value="AT4">관광명소</option>
              <option value="MT1">대형마트</option>
              <option value="CS2">편의점</option>
              <option value="SW8">지하철역</option>
              <option value="CT1">문화시설</option>
            </select>
          </div>
          <div class="col">
            <button
              onclick="setPosition(document.getElementById('location').value, document.getElementById('type').value)"
              class="btn btn-primary"
              style="background-color: burlywood; border-color: burlywood"
            >
              search
            </button>
          </div>
        </div>
        <div id="map"></div>
    </div>

  </section><!-- End Login -->







  <main id="main">


  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

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
            <div class="mb-3">
              <label for="userName" class="form-label">이름</label>
              <input type="text" class="form-control" id="userName">
            </div>
            <div class="mb-3">
              <label for="userId" class="form-label">아이디</label>
              <input type="text" class="form-control" id="userId">
            </div>
            <div class="mb-3">
              <label for="userPassword" class="form-label">비밀번호</label>
              <input type="password" class="form-control" id="userPassword">
            </div>
            <div class="mb-3">
              <label for="confirmPassword" class="form-label">비밀번호 확인</label>
              <input type="password" class="form-control" id="confirmPassword">
            </div>
            <div class="mb-3">
              <label for="userEmail" class="form-label">이메일</label>
              <input type="email" class="form-control" id="userEmail">
            </div>
            <div class="mb-3">
              <label for="userRegion" class="form-label">지역</label>
              <select class="form-select" id="userRegion">
                <option selected>지역 선택</option>
                <!-- 지역 옵션 추가 -->
                <option>광주</option>
                <option>서울</option>
                <option>대전</option>
                <option>구미</option>
                <option>부울경</option>
              </select>
            </div>
    
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
              <button type="button" class="btn btn-primary" onclick="signup()">회원가입</button>
              <button type="button" class="btn btn-danger" onclick="init()">초기화</button>
            </div>
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
              <form id="loginForm">
                <div class="mb-3">
                  <label for="userId" class="form-label">아이디</label>
                  <input type="text" class="form-control" id="userId2">
                </div>
                <div class="mb-3">
                  <label for="userPassword" class="form-label">비밀번호</label>
                  <input type="password" class="form-control" id="userPassword2">
                </div>
                <div class="modal-footer">
                  <button type="button" class="btn btn-primary" onclick="login()">로그인</button>
                  <button type="button" class="btn btn-primary">아이디 찾기</button>
                  <button type="button" class="btn btn-danger">비밀번호 찾기</button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <!--모달 끝-->
  

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

  <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c3d66eda5b359362432348cc2093c184&libraries=services"
    ></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
      var positions = {
        서울: { lat: 37.56667, lng: 126.97806 },
        부산: { lat: 35.1046, lng: 129.0432 },
        인천: { lat: 37.4723, lng: 126.4219 },
        대구: { lat: 35.522, lng: 128.3609 },
        안양: { lat: 37.234, lng: 126.572 },
        대전: { lat: 36.2104, lng: 127.2306 },
      };
      var cur_lat;
      var cur_lng;
      var cur_type;
      function setPosition(location, type) {
        cur_lat = positions[location].lat;
        cur_lng = positions[location].lng;
        cur_type = type;
        createMap();
      }

      function createMap() {
        var mapContainer = document.getElementById("map"), // 지도를 표시할 div
          mapOption = {
            center: new kakao.maps.LatLng(cur_lat, cur_lng), // 지도의 중심좌표
            level: 8, // 지도의 확대 레벨
          };
        var map = new kakao.maps.Map(mapContainer, mapOption);

        var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

        var ps = new kakao.maps.services.Places(map);

        ps.categorySearch(cur_type, placesSearchCB, { useMapBounds: true });

        function placesSearchCB(data, status, pagination) {
          if (status === kakao.maps.services.Status.OK) {
            for (var i = 0; i < data.length; i++) {
              displayMarker(data[i]);
            }
          }
        }

        function displayMarker(place) {
          console.log(place);
          // 마커를 생성하고 지도에 표시합니다
          var marker = new kakao.maps.Marker({
            map: map,
            position: new kakao.maps.LatLng(place.y, place.x),
            cliackable: true, //마커 클릭시 지도 클릭 안되게
            address: place.address_name,
            category: place.category_name,
            name: place.place_name,
            url: place.place_url,
          });

          // 마커에 클릭이벤트를 등록합니다
          kakao.maps.event.addListener(marker, "click", function () {
            // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
            var iwContent = `<div style="padding:5px;">
                    ${place.place_name}<br>
                    ${place.address_name}<br>
                    <a href="${place.place_url}" target="_blank">${place.place_url}</a><br>
                    <input type="button" value="내 여행지에 등록" onclick='addMyTrip()'></input>
                </div>`;
            var iwRemoveable = true;
            var infowindow = new kakao.maps.InfoWindow({
              content: iwContent,
              removable: iwRemoveable,
            });

            infowindow.open(map, marker);
          });
        }
      }

      function addMyTrip() {
        alert("여행지 목록에 추가되었습니다.");
      }

      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    </script>

</body>

</html>