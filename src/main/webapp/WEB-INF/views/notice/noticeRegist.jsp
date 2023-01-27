<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

<style>

	.noticeByteCount {
		float: right;
	}

</style>

<div class="container-fluid">
	<div class="row">
	
		<%@ include file="../include/noticeSide.jsp" %>
		
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">공지사항</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>공지사항 글쓰기</p>
			</div>
			<form action="${pageContext.request.contextPath}/notice/noticeRegist" method="post" name="registForm">
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="adminId" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="noticeTitle" name="title" placeholder="제목을 입력하세요.">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea style="resize: none;" class="form-control" rows="10" id="noticeContent" name="content" placeholder="내용을 입력하세요."></textarea>
				</div>
				<div class="noticeByteCount">
					<span id="noticeContentByte">0</span><span>/ 4000</span>
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
		$('#noticeContent').keyup(function() {
			
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#noticeContent').val();
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			$('#noticeContentByte').text(contentByteLength);
		});
		
		//취소 버튼 이벤트 처리
		$('#cancelBtn').click(function() {
			location.href="${pageContext.request.contextPath}/notice/noticeMain";
		});
		
		//등록 버튼 이벤트 처리
		$('#registBtn').click(function() {
			
			//글자수 바이트 체크를 위한 변수 선언
			let content = $('#noticeContent').val();
			let contentLength = content.length;
			let contentByteLength = 0;
			
			contentByteLength = (function(s,b,i,c) {
				for(b=i=0;c=s.charCodeAt(i++);b+=c>>11?3:c>>7?2:1);
			    return b
			})(content);
			
			if($('#noticeTitle').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('#noticeTitle').focus();
				return;
			} else if($('#noticeContent').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('#noticeContent').focus();
				return;
			} else if(contentByteLength >= 4000) {
				alert('내용은 4000 Byte를 넘을 수 없습니다.');
				$('#noticeContent').focus();
				return;
			} else {
				document.registForm.submit();
			}
		});
	});

</script>


