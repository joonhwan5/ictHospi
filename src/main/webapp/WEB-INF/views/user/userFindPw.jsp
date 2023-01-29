<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>
<div class="container-fulid col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
	<form action="${pageContext.request.contextPath}/user/findPw" id="userFindPwForm" method="post" class="form-horizontal">
		<h1 class="col-sm-offset-4" style="margin-top: 15vh;">
			비밀번호 찾기
		</h1>
		
		<div class="form-group form-group-lg">
			<label for="Id" class="col-sm-3 control-label">아이디</label>
			<div class="col-sm-4">
				<input type="text" id="userId" name="id" class="form-control" placeholder="이메일을 입력해주세요.">
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="email" class="col-sm-3 control-label">이메일</label>
			<div class="col-sm-4">
				<input type="text" id="userEmail" name="email" class="form-control" placeholder="이메일을 입력해주세요.">
			</div>
			<div class="col-sm-5"></div>
		</div>
		
		<div class="form-group form-group-lg">
			<div class="col-sm-offset-5">
				<button type="button" id="userFindPwBtn" class="btn btn-lg btn-block btn-info">찾기</button>
			</div>
			<div class="col-sm-offset-7"></div>
		</div>
		
		<div>
			<a href="<c:url value='/user/userFindId' />" class="col-sm-offset-4">아이디를 잊으셨나요?</a>
		</div>
		
	</form>
</div>
<%@include file="../include/footer.jsp"%>
<script>
	
	let msg = '${msg}';
	if(msg !== '') {
		alert(msg);
	}
	
	$(document).ready(function() {
		
		function userFindId() {
			if($('#userId').val().trim() === '') {
				alert('아이디를 입력해주세요.');
				$('#userId').focus();
				return;
			}
			
			if($('#userEmail').val().trim() === '') {
				alert('이메일을 입력해주세요.');
				$('#userEmail').focus();
				return;
			}
			
			$('#userFindPwForm').submit();
		}
		
		$('#userFindPwBtn').click(function() {
			userFindId();
		});
		
		$('#userFindPwForm').on('keydown', 'input', function(e) {
			if(e.keyCode === 13) {
				userFindId();
			}
		});
		
	});
</script>