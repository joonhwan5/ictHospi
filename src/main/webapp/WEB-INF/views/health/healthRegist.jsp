<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>소식</h2></li>
				<li><a href="${pageContext.request.contextPath}/news/newsMain?selectA=newList">병원 소식<span class="sr-only">(current)</span></a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/health/healthMain?selectA=newList">건강 컬럼</a></li>
			</ul>
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">건강 컬럼</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>건강 컬럼 글쓰기</p>
				<hr>
			</div>

			<form action="${pageContext.request.contextPath}/health/healthRegist" method="post" id="healthRegistFrom" enctype="multipart/form-data">
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="admin" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control healthDetailTitle" name="title" placeholder="제목">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control healthDetailContent" rows="10" name="content" placeholder="내용"></textarea>
				</div>

				<button type="button" class="btn btn-primary healthWriteBtn">등록</button>
				<button type="button" class="btn btn-dark healthRegistCancelBtn">취소</button>
			</form>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp"%>

<script>

	$('.healthRegistCancelBtn').click(function() {
		location.href="${pageContext.request.contextPath}/health/healthMain?selectA=newList"
	});
	
	$('.healthWriteBtn').click(function() {
		if($('.healthDetailTitle').val().trim() === '') {
			alert('제목은 필수 입력 사항입니다.');
			$('.healthDetailTitle').focus();
			return;
		} else if($('.healthDetailContent').val().trim() === '') {
			alert('내용은 필수 입력 사항입니다.');
			$('.healthDetailContent').focus();
			return;
		} else if($('#file').val().trim() === '') {
			alert('사진을 업로드는 필수 사항입니다');
			return;
		} else {
			$('#healthRegistFrom').submit();
		}
	});

</script>

