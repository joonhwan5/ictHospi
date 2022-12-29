<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<style>

	.food-group {
		padding: 10px;
		display: block;
	}
	
	.foodBtnBox {
		width: 100%;
	}
	
	.food-write-btn {
		float: right;
	}

</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>게시판</h2></li>
				<li><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단<span class="sr-only">(current)</span></a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 식단</h1>

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
							<td><a href="${pageContext.request.contextPath}/food/foodDetail">2022.12.26 ~ 2023.01.01 식단</a></td>
							<td>ICT 병원 관리자</td>
							<td>2022-12-26</td>
							<td>500</td>
						</tr>
					</tbody>
				</table>
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