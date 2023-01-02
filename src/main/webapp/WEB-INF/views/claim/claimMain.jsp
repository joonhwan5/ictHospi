<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>게시판</h2></li>
				<li><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">고객의 소리</h1>

			<div class="row placeholders search-main-box">
				<div class="col-xs-6 col-sm-3 placeholder search-main-box">
					<form id="select-form search-main-box">
						<div class="search-wrap board-search-group clearfix search-main-box">
							<button type="button" id="search-btn" class="btn btn-info search-btn board-search-btn"
								onclick="location.href='${pageContext.request.contextPath}/claim/claimMain?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">검색</button>
							<input type="text" name="keyword" class="form-control search-input board-search-input" placeholder="검색어">
							<select name="condition" class="form-control search-select board-search-select">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="writer">작성자</option>
								<option value="titleContent">제목+내용</option>
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
						<tr>
							<td>1</td>
							<td><a href="${pageContext.request.contextPath}/claim/claimDetail">첫번째 고객의 소리</a></td>
							<td>ICT 병원 관리자</td>
							<td>2022-12-23</td>
							<td>300</td>
						</tr>
					</tbody>
				</table>
				<form action="<c:url value='/claim/claimMain' />" name="pageForm">
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
			<div class="claim-group clearfix">
				<div class="claimBtnBox">
					<button type="button" id="uploadBtn" class="btn btn-info claim-write-btn" onclick="location.href='${pageContext.request.contextPath}/claim/claimRegist'">글쓰기</button> 		
				</div>
			</div>
		</div>
	</div>
</div>




<%@include file="../include/footer.jsp"%>