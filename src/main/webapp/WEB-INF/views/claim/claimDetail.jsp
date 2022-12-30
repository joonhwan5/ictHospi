<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<style>

	.claim-delete-btn {
		float: right;
	}
	
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>게시판</h2></li>
				<li><a href="${pageContext.request.contextPath}/notice/noticeMain">공지사항</a></li>
				<li class="active"><a href="${pageContext.request.contextPath}/claim/claimMain">고객의 소리<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/food/foodMain">병원 식단</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h1 class="page-header">고객의 소리</h1>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="titlebox">
				<p>상세보기</p>
			</div>

			<form action="#" method="post" name="mainForm">
				<div>
					<label>DATE</label>
				</div>
				<div class="form-group">
					<label>번호</label> <input class="form-control" name="bno" value="1" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer" value="작성자" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title" value="제목" readonly>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content" readonly>내용</textarea>
				</div>

				<button type="button" id="updateBtn" class="btn btn-primary">수정</button>
				<button type="button" id="listBtn" class="btn btn-dark">목록</button>
				<button type="button" id="delBtn" class="btn btn-info claim-delete-btn">삭제</button>
			</form>
		</div>
	</div>
</div>

<script>

	const msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}

	$(function() {
		//취소 버튼 이벤트 처리
		$('#listBtn').click(function() {
			location.href="${pageContext.request.contextPath}/claim/claimMain";
		});
		
		//수정 이동 처리
		$('#updateBtn').click(function() {
			location.href="${pageContext.request.contextPath}/claim/claimModify";
		});
		
		//삭제 버튼 이벤트 처리
		$('#delBtn').click(function() {
			if(confirm('정말 삭제하시것어여?')) {
				$('form[name=mainForm]').attr('action', '${pageContext.request.contextPath}/claim/claimDelete');
				$('form[name=mainForm]').submit();
			}
		});
	});
	
</script>

<%@include file="../include/footer.jsp"%>