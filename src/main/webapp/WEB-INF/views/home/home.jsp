<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<style type="text/css">
.select{
 	text-align:center
	border:2px solid #000;
}
</style>

</head>
<body id="page-top">

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

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">Cards</h1>
          </div>

          <div class="row">

          <div class="row">

            <div class="col-lg-6">

              <!-- Default Card Example -->
              <div class="card mb-4">
                <div class="card-header">
                  Default Card Example
                </div>
                <div class="card-body">
                  This card uses Bootstrap's default styling with no utility classes added. Global styles are the only things modifying the look and feel of this default card example.
                </div>
              </div>

              <!-- Basic Card Example -->
              <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary">소핑몰 홍보 동영상</h6>
                </div>
                <div class="card-body">
                  	쇼핑몰 홍보동영상 입니다. 잘 나오는지 확인해봅시다.
                  	<button class="btn btn-success btn-icon-split" id="remote">동영상 시청</button>
                </div>
              </div>

            </div>

            <div class="col-lg-6">

              <!-- Dropdown Card Example -->
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Dropdown Card Example</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  Dropdown menus can be placed in the card header in order to extend the functionality of a basic card. In this dropdown card example, the Font Awesome vertical ellipsis icon in the card header can be clicked on in order to toggle a dropdown menu.
                </div>
              </div>

              <!-- Collapsable Card Example -->
              <div class="card shadow mb-4">
                <!-- Card Header - Accordion -->
                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                  <h6 class="m-0 font-weight-bold text-primary">Collapsable Card Example</h6>
                </a>
                <!-- Card Content - Collapse -->
                <div class="collapse show" id="collapseCardExample">
                  <div class="card-body">
                    This is a collapsable card example using Bootstrap's built in collapse functionality. <strong>Click on the card header</strong> to see the card body collapse and expand!
                  </div>
                </div>
              </div>

            </div>

          </div>
          
        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

		
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

<section id="idPopLayer" class="select" style="width:590px; height:690px; top:150px; left:300px;">
	<div class="title">
		<h2>2019 5월 이벤트</h2>		
	</div>
	<div class="cont">
		<a href="#" class="thumbnail">
       		<img src="/resources/img/clothe_1.jpg" alt="100%x180" data-holder-rendered="true" style="height: 300px; width: 100%; display: block;">
        	스승의 날 어린이날 이벤트 : 1.설문&출석 이벤트, 2. e학습터 자랑하기, 3.e학습터 소문내기 ##각 이벤트 참여시 다양한 경품을 드려요 ~ 이벤트 참여하기
        </a>
	</div>
	<div class="bar">
		<ul>
			<input type="checkbox" id="bwc1_151"/>
			<label for="bwc1_151">오늘 하루 이 창 열지 않기</label>
			<span class="close">
				<a href="#none">X 닫기</a>
			</span>
		</ul>	
	</div>
</section>

<!-- Bootstrap core JavaScript-->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="/resources/js/sb-admin-2.min.js"></script>

<!-- jQuery -->
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous">
</script>

<!-- jQuery UI -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$('.select').draggable();

document.getElementById("remote").onclick = function() {
	window.open("/cmm/cmmPlayer.do", "홍보 동영상", "width=1450, height=850, left=100, top=50");
}

</script>

</body>
</html>
