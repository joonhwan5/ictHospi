<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<style>

	.foodBtnBox {
		width: 100%;
	}
		
	.food-write-btn {
		float: right;
	}

</style>

<div class="container-fluid">
	<div class="row">
		
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 식단</h1>
			<div class="row placeholders search-main-box">
				<div class="col-xs-6 col-sm-3 placeholder search-main-box">
					<form id="select-form search-main-box">
						<div class="search-wrap board-search-group clearfix search-main-box">
							<button type="submit" id="search-btn" class="btn btn-info search-btn board-search-btn">검색</button>
							<input type="text" name="keyword" class="form-control search-input board-search-input" value="${pc.paging.keyword}" placeholder="검색어">
							<select name="condition" class="form-control search-select board-search-select">
								<option value="title" ${pc.paging.condition == 'title' ? 'selected' : ''}>제목</option>
								<option value="content" ${pc.paging.condition == 'content' ? 'selected' : ''}>내용</option>
                           		<option value="writer" ${pc.paging.condition == 'writer' ? 'selected' : ''}>작성자</option>
                           		<option value="titleContent" ${pc.paging.condition == 'titleContent' ? 'selected' : ''}>제목+내용</option>
							</select>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="vo" items="${foodList}">
							<tr>
								<td>${vo.bno}</td>
								<td>
								<a href="<c:url value='/food/foodDetail/${vo.bno}${pc.makeURI(pc.paging.pageNum)}' />">${vo.title}</a>
								</td>
								<td>${vo.adminId}</td>
								<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${vo.count}</td>
							</tr>
						</c:forEach>
						<!-- <tr>
							<td>1</td>
							<td><a href="${pageContext.request.contextPath}/food/foodDetail">2022.12.26 ~ 2023.01.01 식단</a></td>
							<td>ICT 병원 관리자</td>
							<td>2022-12-26</td>
							<td>500</td>
						</tr> -->
					</tbody>
				</table>
				<form action="<c:url value='/food/foodMain' />" name="pageForm">
                    <div class="text-center">
	                    <hr>
	                    <ul id="pagination" class="pagination pagination-sm">
	                    	<c:if test="${pc.prev}">
	                        	<li><a href="#" data-pagenum="${pc.beginPage-1}">이전</a></li>
	                        </c:if>
	                        
	                        <c:forEach var="num" begin="${pc.beginPage}" end="${pc.endPage}">
	                        	<li class="${pc.paging.pageNum == num ? 'active' : ''}"><a href="#" data-pagenum="${num}">${num}</a></li>
	                        </c:forEach>
	                        
	                        <c:if test="${pc.next}">
	                        	<li><a href="#" data-pagenum="${pc.endPage+1}">다음</a></li>
	                        </c:if>
	                    </ul>
                    </div>
                    <!-- 페이지 관련 버튼(이전, 다음, 페이지번호)을 클릭 시 같이 숨겨서 보내줄 공통 값 -->
                    <input type="hidden" name="pageNum" value="${pc.paging.pageNum}" >
                    <input type="hidden" name="cpp" value="${pc.paging.cpp}" >
                    <input type="hidden" name="condition" value="${pc.paging.condition}" >
                    <input type="hidden" name="keyword" value="${pc.paging.keyword}" >
		    	</form>
			</div>
			<div class="food-group clearfix">
				<div class="foodBtnBox">
					<button type="button" class="btn btn-info food-write-btn" onclick="location.href='${pageContext.request.contextPath}/food/foodRegist'">글쓰기</button> 		
        		</div>
        	</div>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>
		
	$(function() {
			
		const msg = '${msg}';
		if(msg !== '') {
			alert(msg);
		}
			
			
		//사용자가 페이지 관련 버튼을 클릭했을 때, 기존에는 각각의 a태그의 href에다가 
		//각각 다른 파라미터를 묻힌 url을 작성해서 보내줬다면, 이번에는 클릭한 그 버튼이 무엇인지를
		//확인해서 그 버튼에 맞는 페이지 정보를 자바스크립트로 끌고 와서 요청을 보내 주겠습니다.
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault(); //a태그의 고유기능 중지.
			
			//현재 이벤트가 발생한 요소(버튼)의
			//data-pagenum의 값을 얻어서 변수에 저장.
			//const value = e.target.dataset.pagenum; -> Vanilla JS
			const value = $(this).data('pagenum'); // -> jQuery
			
			//페이지 버튼들을 감싸고 있는 form태그를 name으로 지목하여
			//그 안에 숨겨져 있는 pageNum이라는 이름을 가진 input태그의 value에
			//위에서 얻은 data-pagenum의 값을 삽입하고 submit
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
			
		});
			
			
	}); //end jQuery
	
</script>



