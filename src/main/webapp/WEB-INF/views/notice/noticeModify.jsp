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
				<p>공지사항 수정</p>
			</div>
			<form action="${pageContext.request.contextPath}/notice/noticeUpdate" method="post" name="updateForm">
				<div class="form-group">
					<label>번호</label>
					<input class="form-control" name="bno" value="${article.bno}" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<input class="form-control" name="admin" value="${admin}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label>
					<input class="form-control" id="noticeTitle" name="title" value="${article.title}">
				</div>
				<div class="form-group">
					<label>내용</label>
					<textarea style="resize: none;" class="form-control" rows="10" id="noticeContent" name="content">${article.content}</textarea>
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
			location.href="${pageContext.request.contextPath}/notice/noticeMain";
		});
		
		//수정 버튼 이벤트 처리
		$('#updateBtn').click(function() {
			if($('input[name=title]').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('input[name=title]').focus();
				return;
			} else if($('textarea[name=content]').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('textarea[name=content]').focus();
				return;
			} else {
				document.updateForm.submit();
			}
		});
	});

</script>






