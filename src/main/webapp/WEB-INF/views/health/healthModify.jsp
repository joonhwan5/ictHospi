<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
				<p>건강 컬럼 글 수정</p>
				<hr>
			</div>

			<form action="${pageContext.request.contextPath}/health/healthUpdate" method="post" id="healthUpdateFrom">
				<div class="form-group">
					<input type="hidden" class="form-control" name="bno" value="${article.bno}">
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="${article.adminId}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control healthModifyTitle" name="title" value="${article.title}">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control healthModifyContent" rows="10" name="content">${article.content}</textarea>
				</div>

				<button type="button" id="healthUpdateBtn" class="btn btn-primary health-modify-btn">수정</button>
				<button type="button" id="healthModifyCancelBtn" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	$('#healthModifyCancelBtn').click(function() {
		location.href="${pageContext.request.contextPath}/health/healthMain?selectA=newList";
	});
	
	$('#healthUpdateBtn').click(function() {
		
		let file = $('#file').val();
		file = file.slice(file.indexOf('.') +1).toLowerCase();
		
		if($('.healthModifyTitle').val().trim() === '') {
			alert('제목은 필수 입력 사항입니다.');
			$('.healthModifyTitle').focus();
			return;
		} else if($('.healthModifyContent').val().trim() === '') {
			alert('내용은 필수 입력 사항입니다.');
			$('.healthModifyContent').focus();
			return;
		} else if($('#file').val().trim() === '') {
			alert('사진을 업로드는 필수 사항입니다');
			return;
		} else if(file !== 'jpg' && file !== 'png' && file !=='jpeg' && file !== 'bmp') {
			alert('이미지 파일만 업로드 할 수 있습니다. (jpg, png, jpeg, bmp 파일)')
			$('#file').val('');
			return;
		} else {
			$('#healthUpdateFrom').submit();
		}
	});

</script>