<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
<div class="row">

<%@include file="../include/newsSide.jsp"%>
		
		<!-- 파일 이름 -->
		<div class="blind" style="background: white; position: absolute; left: 21.5vw; top: 44vh; z-index: 50000;">
			${article.fileName}
		</div>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 소식</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>병원 소식 글 수정</p>
				<hr>
			</div>
			<form action="${pageContext.request.contextPath}/news/newsUpdate" method="post" id="newsUpdateFrom" enctype="multipart/form-data">
				<div class="form-group">
					<input type="hidden" class="form-control" name="bno" value="${article.bno}">
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="${article.adminId}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control newsModifyTitle" name="title" value="${article.title}">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control newsModifyContent" rows="10" name="content">${article.content}</textarea>
				</div>
				<button type="button" id="newsUpdateBtn" class="btn btn-primary news-modify-btn">수정</button>
				<button type="button" id="newsModifyCancelBtn" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>


	$('#newsModifyCancelBtn').click(function() {
		location.href="${pageContext.request.contextPath}/news/newsMain?selectA=newList";
	});
	
	
	$('#newsUpdateBtn').click(function() {
		
		
			$('#newsUpdateFrom').submit();
		
	});

</script>