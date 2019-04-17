<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sign Up</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
<script
  src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60=" crossorigin="anonymous"></script>
</head>
<body class="bg-gradient-primary">

  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
              </div>
              <form action="/login/signUpAction.do" class="user" id="signup" method="POST">
                <div class="form-group row">
                  <div class="col-sm-8 mb-2 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="name" name="name" placeholder="이름" maxlength="50" onKeyup="validator(event);"/>
                  </div>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-2 mb-sm-0">
                    <input type="text" class="form-control form-control-user" id="id" name="id" placeholder="아이디" maxlength="20" onKeyup="validator(event);"/>
                  </div>
                  <button type="button" class="btn btn-success" onClick="idCheck();">아이디 중복 확인</button>
                  <!-- <a href="#" class="btn btn-success btn-icon-split" onClick="idCheck();">
                    <span class="text">아이디 중복 확인</span>
                  </a> -->
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="password" class="form-control form-control-user" id="pw" name="pw" placeholder="비밀번호" onKeyup="pwCheck();"/>
                  </div>
                  <div class="col-sm-6">
                    <input type="password" class="form-control form-control-user" id="pwcheck" name="pwcheck" placeholder="비밀번호 확인" onKeyup="pwCheck();"/>
                  </div>
                </div>
                <div>
                	<p id="pw-compare">

                	</p>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <input type="email" class="form-control form-control-user" id="email" name="email" placeholder="이메일" onKeyup="validator(event);"/>
                  </div>
                  <div class="col-sm-6">
                  	<span class="input-group-addon" id="basic-addon1">@</span>
                    <input type="email" class="form-control form-control-user" id="dns" name="dns" placeholder="주소" onKeyup="validator(event);"/>
                  </div>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-user" id="rrn" name="rrn" maxlength="8" placeholder="생년월일 ex)19910728" onKeyup="rrnValidator(event);"/>
                </div>
                <a href="#" class="btn btn-primary btn-user btn-block" onclick="joinSubmit();">
                  	회원가입
                </a>
              </form>
              <hr>
              <a href="/" class="btn btn-danger btn-user btn-block">
                	취소
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<script>

var numberRegex = /[^0-9]/g;
var specialCharRegex = /[\{\}\[\]\/?,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/g;
var idChk = false;	//id중복체크 확인여부

/* 특수문자 제거 */
function validator(event) {
	event.target.value = event.target.value.replace(specialCharRegex, '');
	
	/* 아이디 값 변경 시 중복체크 false*/
	if(event.target.id === "id")
		idChk = false;
}

/* 주민번호 숫자만 가능 */
function rrnValidator(event) {
	event.target.value = event.target.value.replace(numberRegex, '');
}

/* 아이디 중복체크 */
function idCheck() {
	var id = document.getElementById('id').value;
	
	$.ajax({
		type : 'POST',
		data : {'id' : id},
		url : '/login/idCheck.do',
		success : function(result) {
			if(result === "") {
				alert("사용가능한 아이디입니다.");
				idChk = true;
			}
			else {
				alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
				document.getElementById('id').value = "";
			}
		},
		error : function(result) {
			alert("error : " + result);
		}
	})
}

/* 비밀번호 체크 */
function pwCheck() {
	var pw = document.getElementById('pw').value;
	var pwChk = document.getElementById('pwcheck').value;
	var pwCom = document.getElementById('pw-compare');
	
	if(pw === pwChk) {
		pwCom.style.color="green";
		pwCom.innerHTML = "※ 비밀번호가 일치합니다.";
	} else {
		pwCom.style.color="red";
		pwCom.innerHTML = "※ 비밀번호가 일치하지 않습니다.";
	}
	
	//비밀번호를 입력하지 않았을 경우
	if(pw === "" && pwChk === "")
		pwCom.innerHTML = "";
}

/* 회원가입 */
function joinSubmit() {
	var pw = document.getElementById('pw').value;
	var pwChk = document.getElementById('pwcheck').value;
	var name = document.getElementById('name').value;
	var id = document.getElementById('id').value;
	var email = document.getElementById('email').value;
	var dns = document.getElementById('dns').value;
	var rrn = document.getElementById('rrn').value;
	
	if(pw === "" || pwChk === "") {
		alert("패스워드를 입력하세요.");
	} else if(pw != pwChk) {
		alert("패스워드가 일치하지 않습니다.");
	} else if(name === "") {
		alert("이름을 입력하세요.");
	} else if(id === "") {
		alert("아이디를 입력하세요.");
	} else if(idChk == false) {
		alert("아이디 중복확인을 하세요.");
	} else if(email === "" || dns === "") {
		alert("이메일 입력하세요.");
	} else if(rrn === "") {
		alert("생년월일을 입력하세요.");
	} else {
		document.getElementById('signup').submit();	
	}
}

</script>

</body>
</html>