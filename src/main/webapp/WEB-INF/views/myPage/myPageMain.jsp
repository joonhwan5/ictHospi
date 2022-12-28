<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>마이페이지</h2></li>
				<li class="active"><a href="#">내 정보 수정<span class="sr-only">(current)</span></a></li>
				<li><a href="#">회원탈퇴</a></li>
				<li><h2>예약</h2></li>
				<li><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form action="${pageContext.request.contextPath}/user/userJoin"
				id="login-form" method="post">
				<div class="form-group">
					<!--사용자클래스선언-->
					<label for="id">아이디</label>
					<div class="input-group">
						<!--input2탭의 input-addon을 가져온다 -->
						<input type="text" name="userId" class="form-control" id="userId"
							placeholder="아이디를 (영문포함 4~12자 이상)">
					</div>
					<span id="msgId"></span>
					<!--자바스크립트에서 중복 관련 메세지 추가-->
				</div>
				<div class="form-group">
					<!--기본 폼그룹을 가져온다-->
					<label for="password">비밀번호</label> <input type="password"
						name="userPw" class="form-control" id="userPw"
						placeholder="비밀번호 (영 대/소문자, 숫자 조합 8~16자 이상)"> <span
						id="msgPw"></span>
					<!--자바스크립트에서 추가-->
				</div>
				<div class="form-group">
					<label for="password-confrim">비밀번호 확인</label> <input
						type="password" class="form-control" id="pwConfirm"
						placeholder="비밀번호를 확인해주세요."> <span id="msgPw-c"></span>
					<!--자바스크립트에서 추가-->
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text" name="userName"
						class="form-control" id="userName" placeholder="이름을 입력하세요.">
				</div>
				<div class="form-group">
					<label for="birth">생년월일 6자리</label> <input type="text"
						name="userBirth" class="form-control" id="userBirth"
						placeholder="990515">
				</div>
				<div class="form-group">
					<label for="hp">휴대폰번호</label>
					<div class="input-group phone-group">
						<select class="form-control phone1" name="userPhone1"
							id="userPhone1">
							<option>010</option>
							<option>011</option>
							<option>017</option>
							<option>018</option>
						</select> <input type="text" class="form-control phone2" name="userPhone2"
							id="userPhone2" placeholder="휴대폰번호를 입력하세요."> <input
							type="text" class="form-control phone3" name="userPhone3"
							id="userPhone3" placeholder="휴대폰번호를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="email">이메일</label><br>
					<div class="input-group email-group">
						<input type="text" name="userEmail1" class="form-control"
							id="userEmail1" placeholder="이메일"> <select
							name="userEmail2" class="form-control" id="userEmail2">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
						</select>
						<div class="input-group-addon">
							<button type="button" id="mail-check-btn" class="btn btn-primary">이메일
								인증</button>
						</div>
					</div>
					<div class="mail-check-box">
						<input type="text" class="form-control mail-check-input"
							placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
						<span id="mail-check-warn"></span>
					</div>
				</div>
				<div class="form-group">
					<label>이메일 수신동의</label> <br> <input type="checkbox" value=""
						id="sendMobile" checked> <label>모바일</label> <br> <input
						type="checkbox" value="" id="sendEmail" checked> <label>이메일</label>
				</div>

				<div class="form-group">
					<label for="addr-num">주소</label>
					<div class="input-group">
						<input type="text" class="form-control" name="addrZipNum"
							id="addrZipNum" placeholder="우편번호" readonly>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary"
								onclick="searchAddress()">주소찾기</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="addrBasic"
						id="addrBasic" placeholder="기본주소">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="addrDetail"
						id="addrDetail" placeholder="상세주소">
				</div>

				<div class="form-group">
					<button type="button" id="modify-Btn"
						class="btn btn-lg btn-info btn-block">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</div>




<%@include file="../include/footer.jsp"%>