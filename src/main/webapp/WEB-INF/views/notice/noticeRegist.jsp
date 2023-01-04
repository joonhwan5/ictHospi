<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@include file="../include/header.jsp"%>

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
			<form action="${pageContext.request.contextPath}/notice/noticeRegist" method="post" id="registForm">
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="adminId" value="${admin.adminId}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="noticeTitle" name="title" placeholder="제목을 입력하세요.">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea style="resize: none;" class="form-control" rows="10" id="noticeContent" name="content" placeholder="내용을 입력하세요."></textarea>
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
			location.href="${pageContext.request.contextPath}/notice/noticeMain";
		});
		
		//등록 버튼 이벤트 처리
		$('#registBtn').click(function() {
			if($('input[name=title]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=title]').focus();
				return;
			} else if($('textarea[name=content]').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('textarea[name=content]').focus();
				return;
			} else {
				document.registForm.submit();
			}
		});
	});

</script>



