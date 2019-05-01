<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Page</title>

<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>

<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>
<body class="bg-gradient-primary">

<div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-gray-900 mb-4">Welcome FusionMall!</h1>
                  </div>
                  <form action="/login/main.do" class="user" id="login" method="POST">
                    <div class="form-group">
                      <input type="text" class="form-control form-control-user" id="id" name="id" aria-describedby="emailHelp" placeholder="아이디를 입력하세요.">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="pw" name="pw" placeholder="비밀번호를 입력하세요.">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                          <input type="checkbox" class="custom-control-input" id="customCheck">
                          <label class="custom-control-label" for="customCheck">아이디 기억하기</label>
                      </div>
                    </div>
                    <a href="#" id="loginButton" class="btn btn-primary btn-user btn-block">
                      Login
                    </a>
                  </form>
                  <hr>
                  <a href="/login/signUp.do" class="btn btn-primary btn-user btn-block">
                    SingUp
                  </a>
                  <hr>
                </div>
              </div>
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

<!-- jQuery cookie -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="/resources/js/jquery.cookie.js"></script>

<script>

var msg = '${msg}';

if(msg != "") {
	alert(msg);
}

$(document).ready(function() {
	$('#loginButton').click(function(event) {
		loginCheck();
	});
	
	if(typeof $.cookie("login_id") != "undefined") {
		$('#id').val($.cookie("login_id"));
		$("#customCheck").prop("checked", true);
	}
})

function loginCheck() {
	if($('#id').val().length < 1) {
		alert('아이디를 입력해주세요.');
	}
	else if($('#pw').val().length < 1) {
		alert('비밀번호를 입력해주세요');
	}
	else {
		if($("#customCheck").is(":checked")) {
			$.cookie("login_id", $("#id").val(), {expires: 1});
		}
		else {
			$.removeCookie("login_id");
		}
		
		document.getElementById('login').submit();
	}
}

</script>

</body>
</html>