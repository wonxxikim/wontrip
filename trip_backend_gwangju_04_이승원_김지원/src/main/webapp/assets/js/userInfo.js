document.addEventListener("DOMContentLoaded", function () {
  displayUserInfo();
});

function displayUserInfo() {
  var userInfoContainer = document.getElementById("userInfo");

  //로컬 스토리지에서 유저 정보 가져오기
  var storedUserData = localStorage.getItem("userData");
  var userData = JSON.parse(storedUserData);

  if (userData) {
    userInfoContainer.innerHTML = `
    <div class="card text-center">
    <div class="card-body">
      <h5 class="card-title">사용자 정보</h5>
      <ul class="list-group list-group-flush">
        <li class="list-group-item"><strong>이름:</strong> ${userData.userName}</li>
        <li class="list-group-item"><strong>아이디:</strong> ${userData.userId}</li>
        <li class="list-group-item"><strong>이메일:</strong> ${userData.userEmail}</li>
        <li class="list-group-item"><strong>지역:</strong> ${userData.userRegion}</li>
      </ul>
    </div>
  </div>
    `;
  } else {
    userInfoContainer.innerHTML = "<p>회원 정보가 없습니다.</p>";
  }
}

function changeUp() {
  //preUserPassword
  var preUserPassword = document.getElementById("preUserPassword").value;
  var userPassword = document.getElementById("userPassword").value;
  var confirmPassword = document.getElementById("confirmPassword").value;
  var userEmail = document.getElementById("userEmail").value;
  var userRegion = document.getElementById("userRegion").value;
  //로컬 스토리지에서 사용자 정보 가져오기
  var storedUserData = localStorage.getItem("userData");

  var userData = JSON.parse(storedUserData);

  // 입력값 유효성 검사
  if (!preUserPassword || !userPassword || !confirmPassword || !userEmail || !userRegion) {
    alert("모든 항목을 입력해주세요.");
    return;
  }

  if (userData.userPassword != preUserPassword) {
    alert("비밀번호가 틀립니다.");
    return;
  }

  if (userPassword !== confirmPassword) {
    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    return;
  }

  // JSON 형태로 만들기
  var userData = {
    userName: userData.userName,
    userId: userData.userId,
    userPassword: userPassword,
    userEmail: userEmail,
    userRegion: userRegion,
  };

  // 로컬 스토리지에 저장
  localStorage.setItem("userData", JSON.stringify(userData));

  // 회원정보 수정 성공 알림
  alert("회원 정보가 수정되었습니다.");
  window.location.href = "userInfo.html";
}

function deleteUserInfo() {
  var confirmDelete = confirm("정말로 삭제하시겠습니까?");
  if (confirmDelete) {
    // 세션 및 로컬 스토리지 초기화
    sessionStorage.clear();
    localStorage.clear();
    // 메인 페이지로 이동
    window.location.href = "index.html";
  } else {
    // 삭제 취소
    return;
  }
}
