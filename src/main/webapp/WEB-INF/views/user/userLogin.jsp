<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="../include/header.jsp" %>

<div class="container user-login-container">

	<h1 class="col-sm-12 user-login-h1">
		로&nbsp;&nbsp;그&nbsp;&nbsp;인
	</h1>

	<form action="<c:url value='/user/login' />" id="loginForm" method="post" class="form-horizontal">
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-6 ">
				<input type="text" class="form-control" name="userId" id="loginId" placeholder="ID">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-6">
				<input type="password" class="form-control" name="userPw" id="loginPw" placeholder="Password">
				<input type="hidden" name="referer" value="${referer}">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-10">
				<div class="checkbox">
					<label><input type="checkbox" name="autoLogin" id="auto-login">자동 로그인</label>
				</div>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-3 col-sm-6">
				<button type="button" id="loginBtn" class="btn btn-block btn-default">로그인</button>
				<button type="button" id="joinBtn" class="btn btn-block btn-default">회원가입</button>
			</div>
		</div>
	</form>

</div>
<%@include file="../include/footer.jsp" %>
<script>
	
	let msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	$(document).ready(function() {
		
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