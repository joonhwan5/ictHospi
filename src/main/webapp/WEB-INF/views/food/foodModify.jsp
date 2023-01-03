<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<style>

	.foodBtnBox {
		width: 100%;
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
				<p>병원 식단 수정</p>
			</div>

			<form action="${pageContext.request.contextPath}/food/foodUpdate" method="post" name="updateForm" enctype="multipart/form-data">
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
					<input class="form-control" id="foodTitle" name="title" value="${article.title}">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label>
					<input type="file" id="file"  name="file" value="${article.uploadPath/fileLoca/fileName}">
				</div>
				<button type="button" id="updateBtn" class="btn btn-primary">수정</button>
				<button type="button" id="listBtn" class="btn btn-dark">취소</button>
				<button type="button" id="delBtn" class="btn btn-info food-delete-btn">삭제</button>
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

	$(function() {
		//취소 버튼 이벤트 처리
		$('#listBtn').click(function() {
			location.href="${pageContext.request.contextPath}/food/foodMain";
		});
		
		//수정 버튼 이벤트 처리
		$('#updateBtn').click(function() {
			if($('input[name=title]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=title]').focus();
				return;
			} else {
				document.updateForm.submit();
			}
		});
		
		//삭제 버튼 이벤트 처리
		$('#delBtn').click(function() {
			if(confirm('정말 삭제하시것어여?')) {
				$('form[name=updateForm]').attr('action', '${pageContext.request.contextPath}/food/foodDelete');
				$('form[name=updateForm]').submit();
			}
		});
	});

</script>






