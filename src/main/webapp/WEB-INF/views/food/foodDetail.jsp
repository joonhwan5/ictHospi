<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<style>

	.row .main .file {
		border: 2px solid black;
		float: right;
		margin-right: 10px;
	}
	
	.food-delete-btn {
		float: right;
	}

</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>게시판</h2></li>
				<li><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리<span class="sr-only">(current)</span></a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 식단</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>상세보기</p>
			</div>
			
			<!-- <div class="file">
				<a>파일</a>
			</div>
			<div class="image">
					
			</div> -->
			<form action="<c:url value='/food/foodModify' />" method="post" name="mainForm">
				<div>
					<label>DATE</label>
					<p><fmt:formatDate value="${article.regDate}" pattern="yyyy-MM-dd HH:mm" /></p>
				</div>
				<div class="form-group">
					<label>번호</label>
					<input class="form-control" name="bno" value="${article.bno}" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="adminId" value="${article.adminId}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" name="title" value="${article.title}" readonly>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content" readonly>${article.content}</textarea>
				</div>

				<button type="button" id="updateBtn" class="btn btn-primary" onclick="return confirm('수정 페이지로 이동합니다.')">수정</button>
				<button type="button" id="listBtn" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/food/foodMain?pageNum=${p.pageNum}&cpp=${p.cpp}&condition=${p.condition}&keyword=${p.keyword}'">목록</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
</script>



