<<<<<<< HEAD
=======
<<<<<<<< HEAD:src/main/webapp/WEB-INF/views/food/foodRegist.jsp
>>>>>>> origin/kjy
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
<<<<<<< HEAD
<<<<<<< HEAD
				<p>고객의 소리 글쓰기</p>
			</div>

			<form action="${pageContext.request.contextPath}/claim/claimRegist" method="post" name="registForm">
=======
=======
>>>>>>> origin/kjy
				<p>상세보기</p>
			</div>

			<form action="#" method="post">
<<<<<<< HEAD
>>>>>>> origin/deukan
=======
>>>>>>> origin/kjy
				<div>
					<label>DATE</label>
				</div>
				<div class="form-group">
<<<<<<< HEAD
<<<<<<< HEAD
					<label>번호</label> <input class="form-control" name="bno" value="1" readonly>
				</div>
				<div class="form-group">
					<label>작성자</label> <input class="form-control" name="userId" value="작성자" readonly>
				</div>
				<div class="form-group">
					<label>제목</label> <input class="form-control" id="claimTitle" name="title" placeholder="제목을 입력하세요.">
=======
=======
>>>>>>> origin/kjy
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
<<<<<<< HEAD
>>>>>>> origin/deukan
=======
>>>>>>> origin/kjy
				</div>

				<div class="form-group">
					<label>내용</label>
<<<<<<< HEAD
<<<<<<< HEAD
					<textarea style="resize: none;" class="form-control" rows="10" id="claimContent" name="content" placeholder="제목을 입력하세요."></textarea>
				</div>

				<button type="button" id="registBtn" class="btn btn-primary">등록</button>
				<button type="button" id="listBtn" class="btn btn-dark" onclick="history.back();">취소</button>
=======
					<textarea class="form-control" rows="10" name="content" readonly>내용</textarea>
				</div>

				<button type="submit" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-dark">목록</button>
>>>>>>> origin/deukan
=======
					<textarea class="form-control" rows="10" name="content" readonly>내용</textarea>
				</div>

				<button type="button" class="btn btn-primary">수정</button>
				<button type="button" class="btn btn-dark">목록</button>
>>>>>>> origin/kjy
			</form>
		</div>
	</div>
</div>

<<<<<<< HEAD
<<<<<<< HEAD
<%@include file="../include/footer.jsp"%>

<script>
	
	$(function() {
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
			} else {
				document.registForm.submit();
			}
		});
	});
	

</script>






=======



<%@include file="../include/footer.jsp"%>
>>>>>>> origin/deukan
=======



========
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




>>>>>>>> origin/kjy:src/main/webapp/WEB-INF/views/claim/claimRegist.jsp
<%@include file="../include/footer.jsp"%>
>>>>>>> origin/kjy
