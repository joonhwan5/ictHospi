<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp"%>

<div class="container user-modifypw-container">

<%@include file="../include/myPageSide.jsp"%>
	
	<form action="${pageContext.request.contextPath}/myPage/updatePw" id="pwUpdateForm" method="post" class="form-horizontal">
		<div class="pw-check-div">
			<h1 class="h1-div">
				현재 비밀번호 확인
			</h1>
			
			<div class="form-group form-group-lg div-oldpw">
				<label for="pw" class="col-sm-6 control-label">현재비밀번호</label>
				<div class="col-sm-4">
					<input type="password" name="oldPw" id="oldPw" class="form-control" placeholder="현재 비밀번호를 입력해주세요.">
					<input type="hidden" name="userId" value="${id}">
				</div>
			</div>
			
			<div class="form-group form-group-lg">
				<label for="pw" class="col-sm-6 control-label">새로운비밀번호</label>
				<div class="col-sm-4">
					<input type="password" name="newPw" id="newPw" class="form-control" placeholder="새로운 비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="col-sm-offset-6 div-span-input-bottom">
				<span id="msgPw" class="span-user-join"></span>
			</div>

			<div class="form-group form-group-lg">
				<label for="pw" class="col-sm-6 control-label">비밀번호확인</label>
				<div class="col-sm-4">
					<input type="password" name="newPwConfirm" id="newPwConfirm" class="form-control" placeholder="비밀번호 확인해주세요.">
				</div>
			</div>
			<div class="col-sm-offset-6 div-span-input-bottom">
				<span id="msgPw-c" class="span-user-join"></span>
			</div>

			<div class="form-group form-group-lg">
				<div class="col-sm-offset-6">
					<button type="button" id="modifyPwBtn" class="btn btn-lg btn-info col-sm-5">변경</button>
				</div>
			</div>
			
		</div>	
	</form>
</div>

<%@include file="../include/footer.jsp"%>

<script>

	let userModifyPwMsg = '${userModifyPwMsg}';
	
	if(userModifyPwMsg !== '') {
		alert(userModifyPwMsg);
	}

	$(document).ready(function() {
		$('#modifyPwBtn').click(function() {
			
			if($('#oldPw').val().trim() === '') {
				alert('현재 비밀번호를 입력해주세요.');
				$('#oldPw').val('');
				$('#oldPw').focus();
				return;
			}
			
			if(!check1 || !check2) {
				alert('비밀번호를 확인해 주세요.');
				if(!check1) {
					$('#newPw').val('');
					$('#newPw').focus();
					return;
				}
				
				if(!check2) {
					$('#newPwConfirm').val('');
					$('#newPwConfirm').focus();
					return;
				}
			}
			
			$('#pwUpdateForm').submit();
			
		});
	});
	
	let check1 = false;
	let check2 = false;
	
	/* 패스워드 유효성 검사 */
	var pw = document.getElementById("newPw");
	pw.onkeyup = function() {
		var regex = /^.*(?=^.{8,14}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		if (regex.test(document.getElementById("newPw").value)) {
			document.getElementById("newPw").style.borderColor = "green";
			document.getElementById("msgPw").innerHTML = "사용가능합니다";
			document.getElementById("msgPw").style.color = "black";
			check1 = true; 
		} else {
			document.getElementById("newPw").style.borderColor = "red";
			document.getElementById("msgPw").innerHTML = "8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.";
			document.getElementById("msgPw").style.color = "red";
			check1 = false;
		}
	}
	
	/* 비밀번호 확인검사 */
	var pwConfirm = document.getElementById("newPwConfirm");
	pwConfirm.onkeyup = function() {
		if (document.getElementById("newPwConfirm").value == document
				.getElementById("newPw").value) {
			document.getElementById("newPwConfirm").style.borderColor = "green";
			document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
			document.getElementById("msgPw-c").style.color = "black";
			check2 = true;
		} else {
			document.getElementById("newPwConfirm").style.borderColor = "red";
			document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치하지 않습니다.";
			document.getElementById("msgPw-c").style.color = "red";
			check2 = false;
		}
	}

</script>