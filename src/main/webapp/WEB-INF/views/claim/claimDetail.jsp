<<<<<<< HEAD
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<<<<<<< HEAD
<style>

	.claim-write-btn {
		float: right;
	}

</style>
=======

>>>>>>> origin/deukan

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

<<<<<<< HEAD
			<form action="#" method="post" name="mainForm">
=======
			<form action="#" method="post">
>>>>>>> origin/deukan
				<div>
					<label>DATE</label>
				</div>
				<div class="form-group">
					<label>번호</label> <input class="form-control" name="bno"
						value="1" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer"
						value="작성자" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title"
						value="제목" readonly>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content" readonly>내용</textarea>
				</div>

<<<<<<< HEAD
				<button type="button" id="updateBtn" class="btn btn-primary">수정</button>
				<button type="button" id="listBtn" class="btn btn-dark">목록</button>
				<button type="button" id="delBtn" class="btn btn-info claim-write-btn">삭제</button>
=======
				<button type="submit" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-dark">목록</button>
>>>>>>> origin/deukan
			</form>
		</div>
	</div>
</div>

<<<<<<< HEAD
<%@include file="../include/footer.jsp"%>

<script>

	$(function() {
		//목록 이동 처리
		$('#listBtn').click(function() {
			location.href="${pageContext.request.contextPath}/claim/claimMain";
		});
		
		//수정 이동 처리
		$('#updateBtn').click(function() {
			location.href="${pageContext.request.contextPath}/claim/claimModify";
		})
		
		//삭제 버튼 이벤트 처리
		$('#delBtn').click(function() {
			if(confirm('정말 삭제하시것어여?')) {
				$('form[name=mainForm]').attr('action', '${pageContext.request.contextPath}/claim/claimDelete');
				$('form[name=mainForm]').submit();
			}
		});
	});

</script>





=======



<%@include file="../include/footer.jsp"%>
>>>>>>> origin/deukan
=======
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/food/noticeRegist.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>



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

			<form action="#" method="post">
				<div>
					<label>DATE</label>
				</div>
				<div class="form-group">
					<label>번호</label> <input class="form-control" name="bno"
						value="1" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer"
						value="작성자" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title"
						value="제목" readonly>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content" readonly>내용</textarea>
				</div>

				<button type="submit" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-dark">목록</button>
			</form>
		</div>
	</div>
</div>




========
>>>>>>> origin/joonhwan5
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>



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

			<form action="#" method="post">
				<div>
					<label>DATE</label>
				</div>
				<div class="form-group">
					<label>번호</label> <input class="form-control" name="bno"
						value="1" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="writer"
						value="작성자" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" name="title"
						value="제목" readonly>
				</div>

				<div class="form-group">
					<label>내용</label>
					<textarea class="form-control" rows="10" name="content" readonly>내용</textarea>
				</div>

				<button type="submit" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-dark">목록</button>
			</form>
		</div>
	</div>
</div>




<<<<<<< HEAD
<%@include file="../include/footer.jsp"%>
>>>>>>> origin/kjy
=======
>>>>>>>> origin/joonhwan5:src/main/webapp/WEB-INF/views/claim/claimDetail.jsp
<%@include file="../include/footer.jsp"%>
>>>>>>> origin/joonhwan5
