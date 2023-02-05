<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<h1>건강 컬럼</h1>
			<hr>
			<form action="${pageContext.request.contextPath}/health/healthRegist" method="post" id="healthRegistFrom" enctype="multipart/form-data" class="clearfix">
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control healthDetailTitle" name="title" placeholder="제목" maxlength="33">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control healthDetailContent" rows="10" name="content" maxlength="4000" placeholder="내용"></textarea>
				</div>
				
				<div class="healthDetailByteContent right">
					<span id="healthContentByte">0</span><span>/ 4000</span>
				</div>
				<button type="button" class="btn btn-primary healthWriteBtn">등록</button>
				<button type="button" class="btn btn-dark healthRegistCancelBtn">취소</button>
			</form>
		</div>
	</div>
</div>


<%@include file="../include/footer.jsp"%>

<script>
	
	let contentByteLength = 0;
	
	$('.healthDetailTitle').keyup(function() {
		if($(this).val().length > 33) {
			alert('제목은 최대 33자 까지 가능합니다.');
			return;
		}
	});

	$('.healthDetailContent').keyup(function() {
		//글자수 바이트 체크를 위한 변수 선언
		let content = $('.healthDetailContent').val();
		let contentLength = content.length;

		contentByteLength = (function(s, b, i, c) {
			for (b = i = 0; c = s.charCodeAt(i++); b += c >> 11 ? 3
					: c >> 7 ? 2 : 1)
				;
			return b
		})(content);

		$('#healthContentByte').text(contentByteLength);
	});

	$('.healthRegistCancelBtn').click(function() {
		history.back();
	});

	$('.healthWriteBtn').click(function() {

			let file = $('#file').val();
			file = file.slice(file.indexOf('.') + 1).toLowerCase();

			if ($('.healthDetailTitle').val().trim() === '') {
				alert('제목은 필수 입력 사항입니다.');
				$('.healthDetailTitle').focus();
				return;
			} else if ($('.healthDetailContent').val().trim() === '') {
				alert('내용은 필수 입력 사항입니다.');
				$('.healthDetailContent').focus();
				return;
			} else if (contentByteLength > 4000) {
				alert('내용은 4000 Byte를 넘을 수 없습니다.');
				$('.healthDetailContent').focus();
				return;
			} else if ($('#file').val().trim() === '') {
				alert('사진을 업로드는 필수 사항입니다');
				return;
			} else if (file !== 'jpg' && file !== 'png' && file !== 'jpeg'
					&& file !== 'bmp') {
				alert('이미지 파일만 업로드 할 수 있습니다. (jpg, png, jpeg, bmp 파일)')
				$('#file').val('');
				return;
			} else {
				$('#healthRegistFrom').submit();
			}
		});
</script>

