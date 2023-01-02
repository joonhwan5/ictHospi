<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>



<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>게시판</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
				<li><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">공지사항</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>공지사항 글쓰기</p>
			</div>

			<form action="${pageContext.request.contextPath}/notice/noticeRegist" method="post" id="registForm">
				<div>
					<label>${article.regDate}</label>
				</div>
				<div class="form-group">
					<label>번호</label> <input class="form-control" name="bno" value="${article.bno}" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="adminId" value="${article.adminId}" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" id="ntoiceTitle" name="title" placeholder="제목을 입력하세요.">
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" id="noticeContent" name="content" placeholder="내용을 입력하세요."></textarea>
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
		
		//수정 버튼 이벤트 처리
		$('#registBtn').click(function() {
			if($('#ntoiceTitle').val().trim() === '') {
				alert('제목은 필수 항목입니다.');
				$('#noticeTitle').focus();
				return;
			} else if($('#noticeContent').val().trim() === '') {
				alert('내용은 필수 항목입니다.');
				$('#noticeContent').focus();
				return;
			} else {
				$('#registForm').submit();
			}
		});
	});

</script>



