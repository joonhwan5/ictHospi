<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<style>

	.foodBtnBox {
		width: 100%;
	}
	
	.hidden {
		display: none;
	}

</style>

<div class="container-fluid">
	<div class="row">
		
		
		<%@ include file="../include/noticeSide.jsp" %>
		
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
					<input class="form-control" name="admin" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="foodTitle" name="title" value="${article.title}">
				</div>
				<div class="form-group">
					<label>식단</label>
					<br>
					<input type="checkbox" id="modifyImg"> 이미지를 수정하시겠습니까?
					<img id="boardImg" class="img-responsive" alt="foodImg" src="${pageContext.request.contextPath}/food/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}&fileRealName=${article.fileRealName}">
					<input type="file" id="file" class="hidden" name="file">
				</div>
				<button type="button" id="updateBtn" class="btn btn-primary">수정</button>
				<button type="button" id="listBtn" class="btn btn-dark">취소</button>
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
		
		// 이미지 수정 체크박스 이벤트
		$('#modifyImg').change(function(){
			if ($(this).is(':checked')) {
				console.log('체크됨');
				$('.checkbox').addClass('hidden');
				$('#boardImg').addClass('hidden');
				$('#file').removeClass('hidden');
			} else {
				console.log('체크 해제됨');
				$('.checkbox').removeClass('hidden');
				$('#boardImg').removeClass('hidden');
				$('#file').addClass('hidden');
			}
		});
		
	});

</script>






