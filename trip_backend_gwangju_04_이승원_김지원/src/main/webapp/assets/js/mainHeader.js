window.onload = function () {
  loginCheck();
};

function loginCheck() {
  if (sessionStorage.length > 1) {
    document.getElementById("loginButton").style.display = "none";
    document.getElementById("logoutButton").style.display = "block";
    document.getElementById("signupButton").style.display = "none";
    document.getElementById("myPage").style.display = "block";

    // 직접 모달을 감추기
    document.getElementById("loginModal").classList.remove("show");
    document.getElementById("loginModal").style.display = "none";
    // document.querySelector('.modal-backdrop').remove();
    // 아이디와 비밀번호 입력란 초기화
  } else {
    document.getElementById("loginButton").style.display = "block";
    document.getElementById("logoutButton").style.display = "none";
    document.getElementById("signupButton").style.display = "block";
  }
}

function login() {
  // 사용자가 입력한 값을 가져오기
  var user_id = document.getElementById("userId2");
  var user_pw = document.getElementById("userPassword2");

  //로컬 스토리지에서 사용자 정보 가져오기
  var storedUserData = localStorage.getItem("userData");

  var userData = JSON.parse(storedUserData);
  // 로그인 처리 코드
  // 여기에 로그인 처리 코드를 추가하세요.
  if (user_id.value == userData.userId && user_pw.value == userData.userPassword) {
    alert("로그인 성공!");

    sessionStorage.setItem("userData", storedUserData);
    location.reload();
    // document.getElementById("loginButton").style.display = "none";
    // document.getElementById("logoutButton").style.display = "block";
    // document.getElementById("signupButton").style.display = "none";

    // // 직접 모달을 감추기
    // document.getElementById("loginModal").classList.remove("show");
    // document.getElementById("loginModal").style.display = "none";
    // document.querySelector('.modal-backdrop').remove();
    // // 아이디와 비밀번호 입력란 초기화
    // user_id.value = "";
    // user_pw.value = "";
  } else {
    alert("로그인 실패.");
  }
}

function logout() {
  // document.getElementById("loginButton").style.display = "block";
  // document.getElementById("logoutButton").style.display = "none";
  // document.getElementById("signupButton").style.display = "block";
  sessionStorage.clear();
  alert("로그아웃 되었습니다.");
  window.location.href = "index.html";
}

function signup() {
  // 입력된 값을 가져오기
  var userName = document.getElementById("userName").value;
  var userId = document.getElementById("userId").value;
  var userPassword = document.getElementById("userPassword").value;
  var confirmPassword = document.getElementById("confirmPassword").value;
  var userEmail = document.getElementById("userEmail").value;
  var userRegion = document.getElementById("userRegion").value;

  // 입력값 유효성 검사
  if (!userName || !userId || !userPassword || !confirmPassword || !userEmail || !userRegion) {
    alert("모든 항목을 입력해주세요.");
    return;
  }

  if (userPassword !== confirmPassword) {
    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    return;
  }

  // JSON 형태로 만들기
  var userData = {
    userName: userName,
    userId: userId,
    userPassword: userPassword,
    userEmail: userEmail,
    userRegion: userRegion,
  };

  // 로컬 스토리지에 저장
  localStorage.setItem("userData", JSON.stringify(userData));

  // 회원가입 성공 알림
  alert("회원가입이 완료되었습니다.");

  // 회원가입 모달 닫기
  var modal = document.getElementById("signupModal");
  var bootstrapModal = bootstrap.Modal.getInstance(modal);
  bootstrapModal.hide();

  // 입력란 초기화
  document.getElementById("userName").value = "";
  document.getElementById("userId").value = "";
  document.getElementById("userPassword").value = "";
  document.getElementById("confirmPassword").value = "";
  document.getElementById("userEmail").value = "";
  document.getElementById("userRegion").value = "";
}
