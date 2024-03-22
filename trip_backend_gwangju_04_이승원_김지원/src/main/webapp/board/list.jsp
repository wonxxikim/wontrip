<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" import="java.util.List,com.ssafy.trip.board.model.BoardDto,com.ssafy.trip.board.model.dao.BoardDaoImpl"%>
<%
String root = request.getContextPath();
String userId = (String)session.getAttribute("userId");
List<BoardDto> list = (List<BoardDto>) request.getAttribute("articles");
%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
   
    <title>board</title>
      <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
  <script type ="text/javascript" src="apikey.js">
  </script>
    
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
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-sm-12">
          <h2 class="my-3 py-3  text-center" style = "color : rgb(119, 76, 12)">
            <span>여행 계획 </span>게시판
          </h2>
        </div>
        <div class="col-lg-8 col-md-10 col-sm-12">
          <div class="row align-self-center mb-2">
            <div class="col-md-2 text-start">
              <button type="button" id="btn-mv-register" class="btn btn-outline-primary btn-sm" >
               +
              </button>
            </div>
            <div class="col-md-7 offset-3">
              <form class="d-flex">
                <select
                  id="key"
                  class="form-select form-select-sm ms-5 me-1 w-50"
                  aria-label="검색조건"
                >
                  <option selected>검색조건</option>
                  <option value="articleno">글번호</option>
                  <option value="subject">제목</option>
                  <option value="userid">작성자</option>
                </select>
                <div class="input-group input-group-sm">
                  <input type="text" class="form-control" placeholder="검색어..." />
                  <button class="btn" style ="background : burlywood; color : #fff"" type="button">search</button>
                </div>
              </form>
            </div>
          </div>
          <table class="table table-hover">
            <thead>
              <tr class="text-center">
                <th scope="col">글번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">조회수</th>
                <th scope="col">작성일</th>
              </tr>
            </thead>
            <tbody>
<%
for(BoardDto boardDto : list) {
%>           
              <tr class="text-center">
                <th scope="row"><%= boardDto.getArticleNo() %></th>
                <td class="text-start">
                  <a
                    href="#"
                    class="article-title link-dark"
                    data-no="<%= boardDto.getArticleNo() %>"
                    style="text-decoration: none"
                  >
                    <%= boardDto.getSubject() %>
                  </a>
                </td>
                <td><%= boardDto.getUserId() %></td>
                <td><%= boardDto.getHit() %></td>
                <td><%= boardDto.getRegisterTime() %></td>
              </tr>
<%
}
%>              
            </tbody>
          </table>
        </div>

      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous">
    </script>
    <script>
      let titles = document.querySelectorAll(".article-title");
      titles.forEach(function (title) {
        title.addEventListener("click", function () {
          console.log(this.getAttribute("data-no"));
          location.href = "<%= root %>/article?action=view&articleno=" + this.getAttribute("data-no");
        });
      });

      document.querySelector("#btn-mv-register").addEventListener("click", function () {
        location.href = "<%= root %>/article?action=mvwrite";
      });
    </script>
  </body>
</html>
