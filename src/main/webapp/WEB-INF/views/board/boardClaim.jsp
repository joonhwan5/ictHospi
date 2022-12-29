<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>



<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>게시판</h2></li>
				<li><a href="${pageContext.request.contextPath}/board/noticeMain">공지사항</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/board/boardClaim">고객의 소리<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/board/boardFood">병원 식단</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">고객의 소리</h1>

			<div class="row placeholders search-main-box">
				<div class="col-xs-6 col-sm-3 placeholder search-main-box">
					<form id="select-form search-main-box">
						<div class="search-wrap board-search-group clearfix search-main-box">
							<button type="button" id="search-btn" class="btn btn-info search-btn board-search-btn">검색</button>
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
							<td><a href="${pageContext.request.contextPath}/board/claimDetail">첫번째 문의 글</a></td>
							<td>흰둥이</td>
							<td>2022-12-26</td>
							<td>10</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>




<%@include file="../include/footer.jsp"%>