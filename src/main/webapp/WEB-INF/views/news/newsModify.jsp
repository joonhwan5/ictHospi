<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">

		<%@include file="../include/newsSide.jsp"%>

		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">병원 소식(수정)</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<form action="${pageContext.request.contextPath}/news/newsUpdate" method="post" id="newsUpdateFrom" enctype="multipart/form-data">
				<div class="form-group">
					<input type="hidden" class="form-control" name="bno" value="${article.bno}">
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control newsModifyTitle" name="title" value="${article.title}">
				</div>
				<div class="form-group">
					<label for="file">이미지 업로드</label> <input type="file" name="file" id="file">
					<!-- 파일 이름 -->
					<div class="newsBlind" style="background: white; position: absolute; left: 99px; top: 211px; z-index: 50000;">
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
				<button type="button" id="newsUpdateBtn" class="btn btn-primary news-modify-btn left">수정</button>
				<button type="button" id="newsModifyCancelBtn" class="btn btn-dark">취소</button>
			</form>
		</div>
	</div>
</div>

<%@include file="../include/footer.jsp"%>

<script>

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
		let contentByteLength = 0;
		
		contentByteLength = (function(s,b,i,c){
		    for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
		    return b
		})(content);
		
		$('#newsContentByte').text(contentByteLength);
	});

	$('#newsModifyCancelBtn').click(function() {
		location.href = "${pageContext.request.contextPath}/news/newsMain?order=${order}";
	});
	
	$('#file').change(function(){
		$('.newsBlind').css('display', 'none');
	});
	

	$('#newsUpdateBtn').click(function() {

		let file = $('#file').val();
		file = file.slice(file.indexOf('.') + 1).toLowerCase();
		
		let flag = false;
		
		$('#file').change(function() {
			let flag = true;
		});
		
		if ($('.newsModifyTitle').val().trim() === '') {
			alert('제목은 필수 입력 사항입니다.');
			$('.newsModifyTitle').focus();
			return;
		} else if ($('.newsModifyContent').val().trim() === '') {
			alert('내용은 필수 입력 사항입니다.');
			$('.newsModifyContent').focus();
			return;
		} else if (flag === true) {
			if(file !== 'jpg' && file !== 'png' && file !== 'jpeg' && file !== 'bmp') {
				$('#file').val('');
				$('.newsBlind').html('');
				return;
			}
		} else $('#newsUpdateFrom').submit();

	});
</script>