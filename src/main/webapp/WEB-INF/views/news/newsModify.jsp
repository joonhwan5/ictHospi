<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<h1>병원 소식(수정)</h1>
			<hr>
			<form action="${pageContext.request.contextPath}/news/newsUpdate" method="post" id="newsUpdateFrom" enctype="multipart/form-data">
				<div class="form-group">
					<input type="hidden" class="form-control" name="bno" value="${article.bno}">
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="adminId" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control newsModifyTitle" name="title" value="${article.title}" maxlength="33">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
					<!-- 파일 이름 -->
					<div class="newsBlind">
						${article.fileName}
					</div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control newsModifyContent" rows="10" name="content">${article.content}</textarea>
				</div>
				<div class="right">
					<span id="newsContentByte"></span><span>/ 4000</span>
				</div>
				<input type="hidden" name="pageNum" value="${p.pageNum}">
				<input type="hidden" name="keyword" value="${p.keyword}">
				<input type="hidden" name="condition" value="${p.condition}">
				<input type="hidden" name="order" value="${p.order}">
				<button type="button" id="newsUpdateBtn" class="btn btn-primary news-modify-btn left">수정</button>
				<button type="button" id="newsModifyCancelBtn" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>
	let contentByteLength = 0;
	
	let firstContent = $('.newsModifyContent').val();
	let firstContentByteLength = 0;
	firstContentByteLength = (function(s,b,i,c) {
		for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
	    return b
	})(firstContent);
	$('#newsContentByte').html(firstContentByteLength + ' ');
	
	$('.newsModifyContent').keyup(function() {
		//글자수 바이트 체크를 위한 변수 선언
		let content = $('.newsModifyContent').val();
		let contentLength = content.length;
		
		contentByteLength = (function(s,b,i,c){
		    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		    return b
		})(content);
		
		$('#newsContentByte').text(contentByteLength);
	});

	$('#newsModifyCancelBtn').click(function() {
		history.back();
	});
	
	let flag = false;
	let noneImg = false;
	
	$('#file').change(function(){
		$('.newsBlind').css('display', 'none');
		flag = true;
		noneImg = false;
	});
	
	$('.newsModifyTitle').keyup(function() {
		if($(this).val().length > 33) {
			alert('제목은 최대 33자 까지 가능합니다.');
			return;
		}
	});


	$('#newsUpdateBtn').click(function() {
		
		let file = $('#file').val();
		file = file.slice(file.indexOf('.') + 1).toLowerCase();
		
		if ($('.newsModifyTitle').val().trim() === '') {
			alert('제목은 필수 입력 사항입니다.');
			$('.newsModifyTitle').focus();
			return;
		} else if ($('.newsModifyContent').val().trim() === '') {
			alert('내용은 필수 입력 사항입니다.');
			$('.newsModifyContent').focus();
			return;
		} else if (contentByteLength > 4000) {
			alert('내용은 4000 Byte를 넘을 수 없습니다.');
			$('.newsModifyContent').focus();
			return;
		} else if(noneImg) {
			alert('사진입력은 필수입니다.');
			return;
		} else if (flag) {
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
				alert('사진등록은 jpg, png, jpeg, bmp만 가능합니다.');
				$('#file').val('');
				noneImg = true;
				flag = false;
				return;
			}
		} else 
			$('#newsUpdateFrom').submit();

	});
</script>