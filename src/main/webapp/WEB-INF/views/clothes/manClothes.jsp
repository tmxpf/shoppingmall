<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>남성 의류</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- MouseOver-->
<link href="/resources/css/MouseOver.css" rel="stylesheet">

<!-- Default-page-->
<link href="/resources/css/default-page.css" rel="stylesheet">
</head>

<body>

  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
	<jsp:include page="/WEB-INF/views/cmmLayout/cmmSidebarLayout.jsp" flush="false"/>
	
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

        <!-- Topbar -->
        <jsp:include page="/WEB-INF/views/cmmLayout/cmmTopLayout.jsp" flush="false"/>

       <!-- /////////////////////////////////////////////// -->
      <div class="defaul-page">
      <h1 class="h3 mb-2 text-gray-800">남성 의류</h1>
      <p class="mb-4">다양한 남성 의류 판매</p>

	  <div class="bs-example" id="manClothes">
	      <div class="row">
	          <c:forEach var="list" items="${list}" varStatus="status">
			          <div class="col-xs-6 col-md-3 hovereffect" style="margin-bottom:13px;">
				           <a href="#" class="thumbnail" onClick="modalEvent('${list.board_seq}');">
				               <img src="${list.img_path}" alt="100%x180" data-holder-rendered="true" style="height: 300px; width: 100%; display: block;"/>
				           </a>
				      </div>
			   </c:forEach>
	      </div>
	  </div>

  	  <hr>
  	  <div class="row">
  	  	<div class="pull-right">
	  	  	<a href="/manclothes/writeGallery.do" class="btn btn-success btn-icon-split">
	          <span class="text">글쓰기</span>
	        </a>
        </div>
  	  </div>
      <div class="row">
      	<div class="col-sm-12 col-md-9">
      		<div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div>
      	</div>
      	<div class="col-sm-12 col-md-3">
      		<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
      			<ul class="pagination">
      				<li class="paginate_button page-item previous disabled" id="dataTable_previous">
      					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
      				</li>
      				<li class="paginate_button page-item active">
      					<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
      				</li>
      				<li class="paginate_button page-item ">
      					<a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">2</a>
      				</li>
      				<li class="paginate_button page-item ">
      					<a href="#" aria-controls="dataTable" data-dt-idx="3" tabindex="0" class="page-link">3</a>
      				</li>
      				<li class="paginate_button page-item ">
      					<a href="#" aria-controls="dataTable" data-dt-idx="4" tabindex="0" class="page-link">4</a>
      				</li>
      				<li class="paginate_button page-item ">
      					<a href="#" aria-controls="dataTable" data-dt-idx="5" tabindex="0" class="page-link">5</a>
      				</li>
      				<li class="paginate_button page-item ">
      					<a href="#" aria-controls="dataTable" data-dt-idx="6" tabindex="0" class="page-link">6</a>
      				</li>
      				<li class="paginate_button page-item next" id="dataTable_next">
      					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link">Next</a>
      				</li>
      			</ul>
      		</div>
      	</div>
      </div>
  </div>
       <!-- //////////////////////////////////////////////// -->

      <!-- Footer -->
      <jsp:include page="/WEB-INF/views/cmmLayout/cmmFooter.jsp" flush="false"/>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- galleryModal -->
  <jsp:include page="/WEB-INF/views/cmmLayout/cmmModal.jsp" flush="false"/>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<script>

function modalEvent(seq) {
	
	$.ajax({
	    url : "/manclothes/manBoard.do?board_seq=" + seq,
	    dataType : "json",
	    type : "post",
	    success : function(result) {
	    	$('#galleryModal').modal();
	    	
	    	$('#myModalLabel').text(result.board_title);
	    	$('.modal-body').text(result.board_content);
	    	
	    	/* $('#myModalLabel').html('<p>' + result.board_title + '</p>'); */
	    	
	    	}
	});
}

</script>
</body>
</html>