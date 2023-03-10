<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/header.jsp" %>

<div class="container user-login-container">

	<h1 class="col-sm-offset-5 user-login-h1">
		로&nbsp;&nbsp;그&nbsp;&nbsp;인
	</h1>

	<form action="<c:url value='/user/login' />" id="loginForm" method="post" class="form-horizontal">
		<div class="form-group form-group-lg">
			<label class="col-sm-offset-4 col-sm-4">아이디</label>
			<div class="col-sm-offset-4 col-sm-4">
				<input type="text" class="form-control" name="userId" id="loginId" placeholder="아이디를 입력하세요." maxlength="12">
			</div>
		</div>
		<div class="form-group form-group-lg">
			<label class="col-sm-offset-4 col-sm-4">비밀번호</label>
			<div class="col-sm-offset-4 col-sm-4">
				<input type="password" class="form-control" name="userPw" id="loginPw" placeholder="비밀번호를 입력하세요." maxlength="14">
				<input type="hidden" id="referer" name="referer" value="${referer}">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-4 col-sm-4">
				<div class="checkbox">
					<label><input type="checkbox" name="autoLogin" id="auto-login">자동 로그인</label>
				</div>
			</div>
		</div>
		<div class="form-group form-group-lg form-img-css">
			<div class="col-sm-offset-4 col-sm-4 user-join-btn">
				<button type="button" id="loginBtn" class="btn btn-info btn-lg btn-block">로그인</button>
				<div>
                	<a href="${urlKakao}"><img alt="카카오로그인" class="a-img" src="<c:url value='/img/kakao_login_medium_wide.png' />"></a>
                </div>
                <a class="user-join-a" href="<c:url value='/user/userFindId' />">아이디찾기</a>
                <span> / </span>
                <a class="user-join-a" href="<c:url value='/user/userFindPw' />">비밀번호찾기</a>
                <span> / </span>
                <a class="user-join-a" href="<c:url value='/user/userAgree' />">회원가입</a>
			</div>
		</div>
	</form>

</div>
<%@include file="../include/footer.jsp" %>
<script>
	
	$(document).ready(function() { 
		
		$('#loginId').focus();
		
		let msg = '${msg}';
		if(msg !== '') {
			alert(msg);
		}
		
		let referer = '${referer}';
		let ref = '${ref}'; //ra msg
		
		if(referer === 'http://3.37.116.50/user/userLogin') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/user/userJoin') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/user/kakaoUserJoin') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/user/kakaoUserChooseJoin') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/user/userAgree') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/user/userFindId') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/myPage/userModifyPw') {
			referer = 'http://3.37.116.50/';
			$('#referer').val(referer);
		}
		
		if(referer === 'http://3.37.116.50/user/userFindPw') {
			referer = 'http://3.37.116.50/myPage/userModifyPw';
			$('#referer').val(referer);
		}
		
		
		
		// 엔터로 로그인
		function submitLogin() {
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
			
			if(ref !== '') {
				$('#referer').val(ref);
			}
			
			$('#loginForm').submit();
			
		}
		
		$('#loginForm').on('keydown', 'input', function(e) {
			if(e.keyCode === 13) {
				submitLogin();
			}
		});
		
		// 클릭 시 로그인
		$('#loginBtn').click(function() {
			submitLogin();
		});
	
	});
</script>