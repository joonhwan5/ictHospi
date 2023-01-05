<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<div class="container user-join-container">
	<h1 class="col-sm-offset-2">회원가입</h1>
	<form method="post"  class="form-horizontal">
	
		<div class="form-group form-group-lg">
			<label for="id" class="col-sm-2 control-label">아이디</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" id="userId" placeholder="아이디를 (영문포함 4~12자 이상)">
			</div>
			<div class="col-sm-2">
				<button type="button" class="btn btn-primary btn-lg" id="idCheckBtn">아이디중복체크</button>
			</div>
			<div class="col-sm-offset-2">
				<span id="msgId" class="span-user-join">dho</span>		
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="password" class="col-sm-2 control-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" name="userPw" class="form-control" id="userPw" placeholder="8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.">
			</div>
			<div class="col-sm-offset-2">
				<span id="msgPw" class="span-user-join">dho</span>		
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="password" class="col-sm-2 control-label">비밀번호확인</label>
			<div class="col-sm-10">
				<input type="password" name="userPw" class="form-control" id="userPw" placeholder="8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.">
			</div>
			<div class="col-sm-offset-2">
				<span id="msgPw" class="span-user-join">dho</span>		
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="name" class="col-sm-2 control-label">이름</label>
			<div class="col-sm-10">
				<input type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력하세요.">
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="birth" class="col-sm-2 control-label">생년월일</label>
			<div class="col-sm-2">
				<select class="form-control">
					<option>1년</option>
				</select>
			</div>
			<div class="col-sm-2">
				<select class="form-control">
					<option>1월</option>
				</select>
			</div>
			<div class="col-sm-2">
				<select class="form-control">
					<option>99일</option>
				</select>
			</div>
			<div class="col-sm-1">
				<input type="text" name="userBirth2" class="form-control" id="userBirth2" maxlength="1" placeholder="*">
			</div>
			<!-- <label for="birth2" class="col-sm-1 control-label"><strong>******</strong></label> -->
			<div class="span-strong">
				<span><strong>******</strong></span>
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="hp" class="col-sm-2 control-label">휴대폰 번호</label>
			<div class="col-sm-6 input-group phone-group">
				<select class="form-control phone1" name="userPh1" id="userPhone1">
					<option>010</option>
					<option>011</option>
					<option>017</option>
					<option>018</option>
				</select>
				<input type="text" class="form-control phone2" name="userPh2" id="userPhone2" maxlength="4" placeholder="1234">
				<input type="text" class="form-control phone3" name="userPh3" id="userPhone3" maxlength="4" placeholder="1234">
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-8 input-group phone-group">
				<div class="col-sm-4">
					<input type="text" name="userEmail1" class="form-control" id="userEmail1" placeholder="이메일">
				</div>
				<div class="span-strong col-sm-1">
					<span><strong>@</strong></span>
				</div>
				<div class="col-sm-4">
					<select name="userEmail2" class="form-control" id="userEmail2">
						<option>@naver.com</option>
						<option>@daum.net</option>
						<option>@gmail.com</option>
						<option>@hanmail.com</option>
					</select>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" id="idCheckBtn">아이디중복체크</button>
				</div>
			</div>
		</div>
		
	</form>
</div>
<%@include file="../include/footer.jsp" %>