<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<h1 class="page-header">병원 식단</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<form action="${pageContext.request.contextPath}/food/foodRegist" method="post" name="registForm" enctype="multipart/form-data">
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="adminId" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="foodTitle" name="title" placeholder="제목을 입력하세요.">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label>
					<input type="file" name="file" id="file">
				</div>
				<button type="button" id="registBtn" class="btn btn-primary">등록</button>
				<button type="button" id="cancelBtn" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	$(function() {
		//취소 버튼 이벤트 처리
		$('#cancelBtn').click(function() {
			location.href="${pageContext.request.contextPath}/food/foodMain";
		});
		
		//등록 버튼 이벤트 처리
		$('#registBtn').click(function() {
			
			let file = $('#file').val();
			file = file.slice(file.indexOf('.') +1).toLowerCase();
			
			if($('input[name=title]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=title]').focus();
				return;
			} else if($('#file').val().trim() === '') {
				alert('사진 업로드는 필수 사항입니다');
				return;
			} else if(file !== 'jpg' && file !== 'png' && file !=='jpeg' && file !== 'bmp') {
				alert('이미지 파일만 업로드 할 수 있습니다. (jpg, png, jpeg, bmp 파일)')
				$('#file').val('');
				return;
			} else {
				document.registForm.submit();
			}
		});
	});

</script>




