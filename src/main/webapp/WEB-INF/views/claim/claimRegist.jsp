<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main board-main">
			<h1>고객의 소리</h1>
			<div class="titlebox">
				<p>고객의 소리 글쓰기</p>
			</div>
			<form action="${pageContext.request.contextPath}/claim/claimRegist" method="post" id="registForm">
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="userId" value="${login}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="claimTitle" name="title" placeholder="제목을 입력하세요." maxlength="33">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea style="resize: none;" class="form-control" rows="10" id="claimContent" name="content" placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="claimByteCount right">
					<span id="claimContentByte">0</span><span>/ 4000</span>
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
		
		let contentByteLength = 0;
		
		$('#claimContent').keyup(function() {
			
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#claimContent').val();
			let contentLength = content.length;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			$('#claimContentByte').text(contentByteLength);
		});	
		
		//취소 버튼 이벤트 처리
		$('#cancelBtn').click(function() {
			location.href="${pageContext.request.contextPath}/claim/claimMain";
		});
		
		$('#claimTitle').keyup(function() {
			if($(this).val().length > 33) {
				alert('제목은 최대 33자 까지 가능합니다.');
				$(this).focus();
				return;
			}
		});
		
		//등록 버튼 이벤트 처리
		$('#registBtn').click(function() {
			
			if($('#claimTitle').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('#claimTitle').focus();
				return;
			} else if($('#claimContent').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('#claimContent').focus();
				return;
			} else if(contentByteLength > 4000) {
				alert('내용은 4000 Byte를 넘을 수 없습니다.');
				$('#claimContent').focus();
				return;
			} else {
				$('#registForm').submit();
			}
		}); 
	});

</script>






