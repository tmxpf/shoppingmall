<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>남성 의류 등록</title>

<!-- Custom fonts for this template-->
<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- MouseOver-->
<link href="/resources/css/MouseOver.css" rel="stylesheet">

<!-- Default-page-->
<link href="/resources/css/default-page.css" rel="stylesheet">
</head>

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
      
      <div class="container">
<table class="table table-bordered">
    <tbody>
        <form action="/manclothes/insertGallery.do" method="post" encType="multipart/form-data">
        	<input type="hidden" name="img_size"/>
        	<input type="hidden" name="img_name"/>
        	<input type="hidden" name="img_type"/>
        	
        	<!-- <input type="hidden" name="objUuid"/>
        	<input type="hidden" name="objName"/>
        	<input type="hidden" name="objSize"/>
        	<input type="hidden" name="objColor"/>
        	<input type="hidden" name="objPrice"/>
        	<input type="hidden" name="objAmount"/>
        	<input type="hidden" name="userCode"/> -->
        	
            <tr>
                <th>제목 </th>
                <td><input type="text" placeholder="제목을 입력하세요. " name="board_title" class="form-control"/></td>
            </tr>
            <tr>
                <th>내용 </th>
                <td><textarea cols="10" rows="10" placeholder="내용을 입력하세요. " name="board_content" class="form-control"></textarea></td>
            </tr>
            <tr>
                <th>이미지 등록 </th>
                <td>
                	<input type="file" name="upload" class="file" />
                	<div id="image_section">

                	</div>
                </td>
            </tr>
            <tr>
                <th>물품 등록 </th>
                <td>
                	<input type="button" id="register" value="물품등록" onclick="sendData();" class="pull-right bg-gradient-success"/>
                	<div id="product">
                	
                	</div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="등록" class="pull-right bg-gradient-success"/>
                    <input type="button" value="취소" class="pull-right bg-gradient-danger" onclick="javascript:location.href='/clothes/manClothes.do'"/>
                </td>
            </tr>
        </form>
    </tbody>
</table>
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

$('input[name=upload]').on("change" ,function() {
	var imgObj = this.files[0];
	var extension = ['gif', 'jpeg', 'jpg', 'png'];
	var typeChk = imgObj.type.split('/')[1];
	var IMAGE_WIDTH = 560;
	
	typeChk = extension.indexOf(typeChk);
	
	if(imgObj && (typeChk != -1)) {
		var reader = new FileReader();
		
		reader.onload = function(e) {
			var img = new Image(); 
			img.src = event.target.result;
			img.width = IMAGE_WIDTH;
			
			$("input[name=img_name]").val(imgObj.name);
			$("input[name=img_size]").val(imgObj.size);
			$("input[name=img_type]").val(imgObj.type.split('/')[1]);
			
			holder = document.getElementById('image_section');
			holder.innerHTML = '<hr/>';
			holder.appendChild(img);
		}
		
		reader.readAsDataURL(imgObj);
	} else {
		$('#upload').val("");
		alert("이미지 파일만 가능합니다. [gif, jpeg, jpg, png]");
	}
});

function sendData() {
	window.open("/manclothes/objectRegister.do", "물품 등록", "width=700, height=640" );
}

function deleteProduct() {
	$('#product').empty();
	
	//물품등록 버튼 활성화
	document.getElementById("register").disabled = '';
}

</script>

</body>
</html>