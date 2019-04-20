<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
			    <td><input class="btn btn-success" type="button" value="선택" data-obj="${row_data.objUuid}" onclick="selectProduct(event);"/></td>
			</tr>
			</c:forEach>
		</tbody>
</table>

<div class="col-md-3 .col-md-offset-3">
	<ul class="pagination">
		<c:choose>
			<c:when test="${pagination.curPage ne 1}">
				<li class="paginate_button page-item previous" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onClick="fn_paging('${pagination.prevPage}')">Previous</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="paginate_button page-item previous disabled" id="dataTable_previous">
					<a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" onClick="fn_paging('${pagination.prevPage}')">Previous</a>
				</li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
			<c:choose>
				<c:when test="${pageNum eq  pagination.curPage}">
					<li class="paginate_button page-item active">
						<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${pageNum}</a>
					</li>
				</c:when>
				<c:otherwise>
					<li class="paginate_button page-item">
						<a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link" onClick="fn_paging('${pageNum }')">${pageNum}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:choose>
			<c:when test="${(pagination.curPage ne pagination.pageCnt) && (pagination.pageCnt > 0)}">
				<li class="paginate_button page-item next" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onClick="fn_paging('${pagination.nextPage}')">Next</a>
				</li>
			</c:when>
			<c:otherwise>
				<li class="paginate_button page-item next disabled" id="dataTable_next">
					<a href="#" aria-controls="dataTable" data-dt-idx="7" tabindex="0" class="page-link" onClick="fn_paging('${pagination.nextPage}')">Next</a>
				</li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
	
<div>
        총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
</div>