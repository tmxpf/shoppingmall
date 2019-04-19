<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- MouseOver-->
<link href="/resources/css/MouseOver.css" rel="stylesheet">

<!-- Default-page-->
<link href="/resources/css/default-page.css" rel="stylesheet">

<link type="text/css" rel="stylesheet" href="chrome-extension://eobejphpabbjeehffmbiecckpkggpbai/style.css">

<style>
.small-window {
	margin-left : 20px;
	margin-right : 20px;
	margin-bottom : 20px;
	margin-top : 20px;
}
</style>

</head>
<body>

<div class="small-window">
	<div class="row">
		<div class="dropdown col-sm-4 mb-3 mb-sm-0">
           <select class="form-control">
           	  <option>1</option>
			  <option>2</option>
			  <option>3</option>
			  <option>4</option>
			  <option>5</option>
           </select>
         </div>
         <div class="input-group col-sm-8">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
	            <button class="btn btn-primary" type="button">
	                <i class="fas fa-search fa-sm"></i>
	            </button>
            </div>
         </div>
	</div>
	<hr/>
	<div class="table-responsive">
		<table class="table table-bordered">
			<th>상품이름</th>
			<th>상품 사이즈</th>
			<th>상품 컬러</th>
			<th>상품 가격</th>
			<th>상품 수량</th>
			<tr><!-- 첫번째 줄 시작 -->
			    <td>첫번째 칸</td>
			    <td>두번째 칸</td>
			    <td>세번째 칸</td>
			    <td>네번째 칸</td>
			    <td>다섯번째 칸</td>
			</tr><!-- 첫번째 줄 끝 -->
			<tr><!-- 두번째 줄 시작 -->
			    <td>첫번째 칸</td>
			    <td>두번째 칸</td>
			    <td>세번째 칸</td>
			    <td>네번째 칸</td>
			    <td>다섯번째 칸</td>
			</tr><!-- 두번째 줄 끝 -->
		</table>
	</div>
</div>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

</body>
</html>