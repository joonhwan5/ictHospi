<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 소식</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>병원 소식 글쓰기</p>
				<hr>
			</div>
			<form action="${pageContext.request.contextPath}/news/newsRegist" method="post" id="newsRegistForm" enctype="multipart/form-data">
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="admin" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control newsDetailTitle" name="title" placeholder="제목">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control newsDetailContent" rows="10" name="content" placeholder="내용"></textarea>
				</div>
				<button type="button" class="btn btn-primary newsWriteBtn">등록</button>
				<button type="button" class="btn btn-dark newsRegistCancelBtn">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	$('.newsRegistCancelBtn').click(function() {
		location.href="${pageContext.request.contextPath}/news/newsMain?selectA=newList";
	});
	
	$('.newsWriteBtn').click(function() {
		
		let file = $('#file').val();
		file = file.slice(file.indexOf('.') +1).toLowerCase();
		
		if($('.newsDetailTitle').val().trim() === '') {
			alert('제목은 필수 입력 사항입니다.');
			$('.newsDetailTitle').focus();
			return;
		} else if($('.newsDetailContent').val().trim() === '') {
			alert('내용은 필수 입력 사항입니다.');
			$('.newsDetailContent').focus();
			return;
		} else if($('#file').val().trim() === '') {
			alert('사진을 업로드는 필수 사항입니다');
			return;
		} else if(file !== 'jpg' && file !== 'png' && file !=='jpeg' && file !== 'bmp') {
			alert('이미지 파일만 업로드 할 수 있습니다. (jpg, png, jpeg, bmp 파일)')
			$('#file').val('');
			return;
		} else {
			$('#newsRegistForm').submit();
		}
	});

</script>

