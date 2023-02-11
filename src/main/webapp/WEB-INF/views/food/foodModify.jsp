<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		
		
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<h1>병원 식단(수정)</h1>
			<hr>
			<form action="${pageContext.request.contextPath}/food/foodUpdate" method="post" id="foodUpdateForm" enctype="multipart/form-data">
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="admin" value="${admin}" readonly>
					<input type="hidden" name="bno" value="${article.bno}">
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="foodTitle" name="title" value="${article.title}" maxlength="33">
				</div>
				<div class="form-group">
					<label>이미지 업로드</label>
					<input type="file" name="file" id="file">
					<!-- 파일 이름 -->
					<div class="foodBlind">
						${article.fileRealName}
					</div>
					<img id="boardImg" class="img-responsive" alt="foodImg" src="${pageContext.request.contextPath}/food/display?fileLoca=${article.fileLoca}&fileName=${article.fileName}&fileRealName=${article.fileRealName}">
					<input type="hidden" name="fileLoca" value="${article.fileLoca}">
					<input type="hidden" name="fileName" value="${article.fileName}">
					<input type="hidden" name="fileRealName" value="${article.fileRealName}">
					<input type="hidden" name="pageNum" value="${p.pageNum}" >
                	<input type="hidden" name="condition" value="${p.condition}" >
                	<input type="hidden" name="keyword" value="${p.keyword}" >
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
			history.back();
		});
		
		$('#foodTitle').keyup(function() {
			if($(this).val().length > 33) {
				alert('제목은 최대 33자 입니다.');
				$(this).focus();
				return;
			}
		});
		
		let flag = false;
		noneImg = false;
		
		//파일 태그 변경
		$('#file').change(function() {
			$('.foodBlind').css('display', 'none');
			let flag = true;
			noneImg = false;
			
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data) {
					$('#boardImg').attr("src", data.target.result).width(500);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
		
		//수정 버튼 이벤트 처리
		$('#updateBtn').click(function() {
			
			let file = $('#file').val();
			file = file.slice(file.indexOf('.') + 1).toLowerCase();
		
			if($('#foodTitle').val().trim() === '') {
				alert('제목은 필수 입력 사항입니다.');
				$('#foodTitle').focus();
				return;
			} else if(noneImg) {
				alert('사진입력은 필수입니다.');
				return;
			} else if(flag) {
				if(file !== 'jpg' && file !== 'png' && file !=='jpeg' && file !== 'bmp') {
					alert('이미지 파일만 업로드 할 수 있습니다. (jpg, png, jpeg, bmp 파일)');
					$('#file').val('');
					noneImg = true;
					flag = false;
					return;
				}
			} else {
				$('#foodUpdateForm').submit();
			}
		});
	});

</script>






