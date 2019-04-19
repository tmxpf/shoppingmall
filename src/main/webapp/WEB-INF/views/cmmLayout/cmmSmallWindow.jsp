<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<table border="1" class="table table-bordered">
		<thead>
            <tr>
                <th scope="col" nowrap="nowrap">상품명</th>
                <th scope="col" nowrap="nowrap">사이즈</th>
                <th scope="col" nowrap="nowrap">색상</th>
                <th scope="col" nowrap="nowrap">가격</th>
                <th scope="col" nowrap="nowrap">수량</th>
                <th scope="col" nowrap="nowrap">선택</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="row_data" items="${list}">
			<tr>
			    <td>${row_data.objName}</td>
			    <td>${row_data.objSize}</td>
			    <td>${row_data.objColor}</td>
			    <td>${row_data.objPrice}</td>
			    <td>${row_data.objAmount}</td>
			    <td><input class="btn btn-success" type="button" value="선택"/></td>
			</tr>
			</c:forEach>
		</tbody>
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