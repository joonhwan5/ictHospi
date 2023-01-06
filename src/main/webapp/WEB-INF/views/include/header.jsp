<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
	<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/css/offcanvas.css" rel="stylesheet">
	
	
	<link href="${pageContext.request.contextPath}/resources/css/myCss.css" rel="stylesheet">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>

	<style>

	</style>
</head>
<body>
	<nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container header-container">
        <div class="navbar-header header-navbar-header clearfix">
          <button type="button" class="navbar-toggle collapsed right" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="${pageContext.request.contextPath}/">ict-병원</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="${pageContext.request.contextPath}/introduce/introMain/1">병원소개</a></li>
            <li><a href="${pageContext.request.contextPath}/news/newsMain?selectA=newList">소식</a></li>
            <li><a href="${pageContext.request.contextPath}/notice/noticeMain">게시판</a></li>
            <c:if test="${login!=null}">
            	<li><a href="${pageContext.request.contextPath}/myPage/myPageMain">마이페이지</a></li>
            </c:if>
            <c:if test="${admin!=null}">
            	<li><a href="${pageContext.request.contextPath}/admin/adminPageMain">관리자</a></li>
            </c:if>
          </ul>
          <form class="navbar-form navbar-right">
            
            <div class="form-group login-form-group">
            	<c:if test="${login==null && admin==null}">
          			<a id="login" href="#">&emsp;&emsp;로그인</a>
          		</c:if>
            	<c:if test="${login!=null || admin!=null}">
          			<a id="logout" href="#">&emsp;&emsp;로그아웃</a>
          		</c:if>
          	</div>
          </form>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

<section>
	<!-- 로그인 모달 -->
	<div class="modal fade" id="loginModal" role="dialog">
		<div class="modal-dialog modal-md-4">
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<form id="loginForm" action="<c:url value='/user/login' />" method="post">
							<div class="header-login-div">
								<h1>로그인</h1>
								<hr>
								<input type="text" name="userId" id="loginId" placeholder="아이디"> <br>
								<input type="password" name="userPw" id="loginPw" placeholder="비밀번호">
							</div>
							<div class="check-div">
								<input type="checkbox" id="auto-login" name="autoLogin">
								<label>&nbsp;&nbsp;로그인 상태 유지</label>
							</div>
							<button type="button" id="loginBtn" class="btn btn-block btn-info">로그인</button>
							<button type="button" id="joinBtn" class="btn btn-block btn-info">회원가입</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${pageContext.request.contextPath}/resources/js/offcanvas.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$(document).ready(function() {
		
		// a 태그 로그인
		$('#login').click(function() {
			event.preventDefault();
			$('#loginModal').modal('show');
		});
		
		// a 태그 로그아웃
		$('#logout').click(function() {
			event.preventDefault();
			location.href='${pageContext.request.contextPath}/user/logout';
		});
		
		// 회원가입 버튼 클릭시 이동
		$('#joinBtn').click(function() {
			$('#loginModal').modal('hide');
			location.href='<c:url value="/user/userJoin" />';
		}); 
		
		//로그인
		$('#loginBtn').click(function() {
			if($('#loginId').val().trim() === '') {
				$('#loginId').focus();
				alert('아이디를 입력해주세요.');
				return;
			}
			
			if($('#loginPw').val().trim() === '') {
				$('#loginPw').focus();
				alert('비밀번호를 입력해주세요.');
				return;
			}
			$('#loginForm').submit();
		});
		
	});
	
</script>


