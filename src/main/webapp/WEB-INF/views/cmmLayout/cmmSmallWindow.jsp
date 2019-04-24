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
	<input type="hidden" name="searchKwd"/>
	<input type="hidden" name="optionKwd" value="0"/>
	
	<form id="frm" method="post">
		<%-- <input type="hidden" value="${pagination.curPage}"/> --%>
		<div class="row">
			<div class="dropdown col-sm-4 mb-3 mb-sm-0">
	           <select class="form-control" name="searchOption">
	           	  <option value="1">상품명</option>
				  <option value="2">사이즈</option>
				  <option value="3">수량</option>
	           </select>
	         </div>
	         <div class="input-group col-sm-8">
	            <input type="text" name="search" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
	            <div class="input-group-append">
		            <button class="btn btn-primary" type="button" onclick="objSubmit();">
		                <i class="fas fa-search fa-sm"></i>
		            </button>
	            </div>
	         </div>
		</div>
	</form>
	<hr/>
	
	<div class="table-responsive">
		
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
var curPage = 1;

$(document).ready(function() {
	ajaxBoardList(curPage, false);
});

function ajaxBoardList(curPage, pageIdx) {
	
	/* var param = {
			url : "/manclothes/ajaxselectBoardList.do?curPage=" + curPage,
			dataType : "html",
			type : "post",
			success : function(result) {
		        $(".table-responsive").html(result);
		    }
	}
	
<<<<<<< HEAD
	if(dividePage === true)
		param.data = {"dividePage" : dividePage};	//페에지만 넘길 경우
	else
		param.data = $('#frm').serialize();	//검색 옵션을 주고 이동할 경우
	
	$.ajax(param);
=======
	if(pageIdx === true) {
		param.data = $('#frm').serialize();	
	}
	else {
		var data = {
				"searchOption" : $("input[name='optionKwd']").val(),
				"search" : $("input[name='searchKwd']").val()
		}
		
		param.data = data;
	}
>>>>>>> 6dec0167a9afe33b0d9db78bfd054c9c8fcb5edb
	
	$.ajax(param); */
	 
	var data = {
			"searchOption" : $("input[name='optionKwd']").val(),
			"search" : $("input[name='searchKwd']").val()
	}
	
	$.ajax({
	    url : "/manclothes/ajaxselectBoardList.do?curPage=" + curPage,
	    dataType : "html",
	    type : "post", 
	    /* data : $('#frm').serialize(), */
	    data : (pageIdx === true) ? $('#frm').serialize() : data,
	    success : function(result) {
	        $(".table-responsive").html(result);
	    }
	});
}

function fn_paging(curPage) {
	ajaxBoardList(curPage, false);
}

function selectProduct(event) {
	var product_uuid = event.target.dataset.obj;
	var con_test = confirm("선택한 상품을 등록하시겠습니까?");
	
	if(con_test === true) {
		
		$.ajax({
		    url : "/manclothes/insertProductInfo.do",
		    dataType : "json",
		    type : "post",
		    data : {"objUuid" : product_uuid},
		    success : function(result) {
		    	var product =  opener.document.getElementById("product");
		    	
		    	//물품등록 버튼 비활성화
		    	opener.document.getElementById("register").disabled = 'disabled';
		    	
		    	//물품정보 hidden저장
		    	opener.document.getElementsByName("objUuid")[0].value = result.objUuid;
		    	opener.document.getElementsByName("objName")[0].value = result.objName;
		    	opener.document.getElementsByName("objSize")[0].value = result.objSize;
		    	opener.document.getElementsByName("objColor")[0].value = result.objColor;
		    	opener.document.getElementsByName("objPrice")[0].value = result.objPrice;
		    	opener.document.getElementsByName("objAmount")[0].value = parseInt(result.objAmount);
		    	opener.document.getElementsByName("userCode")[0].value = parseInt(result.userCode);
		    	
		    	//물품정도 SHOW
		    	product.innerHTML += '<hr/>';
		    	product.innerHTML += '<sapn>상품명 :' + result.objName + '</sapn>&nbsp; &nbsp;';
		    	product.innerHTML += '<sapn>사이즈 :' + result.objSize + '</sapn>&nbsp; &nbsp;';
		    	product.innerHTML += '<sapn>색상 :' + result.objColor + '</sapn>&nbsp; &nbsp;';
		    	product.innerHTML += '<sapn>가격 :' + result.objPrice + '</sapn>&nbsp; &nbsp;';
		    	product.innerHTML += '<sapn>수량 :' + result.objAmount + '</sapn>&nbsp;';
		    	
		    	//물품정보 hidden저장
		    	/* product.innerHTML += "<input type='hidden' name='objUuid' value=" + result.objUuid + "></input>";
		    	product.innerHTML += "<input type='hidden' name='objName' value=" + result.objName + "></input>";
		    	product.innerHTML += "<input type='hidden' name='objSize' value=" + result.objSize + "></input>";
		    	product.innerHTML += "<input type='hidden' name='objColor' value=" + result.objColor + "></input>";
		    	product.innerHTML += "<input type='hidden' name='objPrice' value=" + result.objPrice + "></input>";
		    	product.innerHTML += "<input type='hidden' name='objAmount' value=" + result.objAmount + "></input>";
		    	product.innerHTML += "<input type='hidden' name='userCode' value=" + result.userCode + "></input>"; */
		    	
		    	//물품정보 삭제버튼 생성
		    	product.innerHTML += '<input type="button" value="삭제" onclick="deleteProduct();" class="pull-right bg-gradient-danger"/>';
		    	
		    	window.close();
		    }
		});
		/* window.close(); */
	}
	else {
		return;
	}
}

function objSubmit() {
	var searchOption = $("select[name='searchOption']").val();
	var searchText = $("input[name='search']").val();
	
	document.getElementsByName("optionKwd")[0].value = searchOption;
	document.getElementsByName("searchKwd")[0].value = searchText;
	
	ajaxBoardList(curPage, true);
}

</script>

</body>
</html>