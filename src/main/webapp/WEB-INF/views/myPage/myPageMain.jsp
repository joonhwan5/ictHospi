<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-sm-3 col-md-2 sidebar">
			<ul class="nav nav-sidebar">
				<li><h2>마이페이지</h2></li>
				<li class="active"><a href="${pageContext.request.contextPath}/myPage/myPageMain">내 정보 수정<span class="sr-only">(current)</span></a></li>
				<li><a href="${pageContext.request.contextPath}/myPage/userWithdrawal">회원탈퇴</a></li>
				<li><h2>예약</h2></li>
				<li><a href="${pageContext.request.contextPath}/myPage/reservation">예약현황</a></li>
			</ul>
		</div>
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form action="${pageContext.request.contextPath}/myPage/userModify" id="modify-form" method="post">
				<div class="form-group">
					<!--사용자클래스선언-->
					<label for="id">아이디</label>
					<div class="input-group">
						<!--input2탭의 input-addon을 가져온다 -->
						<input type="text" name="userId" class="form-control" id="userId" value="${user.userId}" placeholder="아이디를 (영문포함 4~12자 이상)">
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary" id="idCheckBtn">아이디중복체크</button>
						</div>
					</div>
					<span id="msgId"></span>
					<!--자바스크립트에서 중복 관련 메세지 추가-->
				</div>
				<div class="form-group">
					<!--기본 폼그룹을 가져온다-->
					<label for="password">비밀번호</label> <input type="password" name="userPw" class="form-control" id="userPw"
						placeholder="8~32자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.">
						<span id="msgPw"></span>
					<!--자바스크립트에서 추가-->
				</div>
				<div class="form-group">
					<label for="password-confrim">비밀번호 확인</label>
					<input type="password" class="form-control" id="pwConfirm" placeholder="비밀번호를 확인해주세요.">
					<span id="msgPw-c"></span>
					<!--자바스크립트에서 추가-->
				</div>
				<div class="form-group">
					<label for="name">이름</label>
					<input type="text" name="userName" class="form-control" id="userName" value="${user.userName}" 
						placeholder="이름을 입력하세요.">
				</div>
				<div class="form-group">
					<label for="birth">생년월일 6자리</label>
					<input type="text" name="userBirth1" class="form-control" id="userBirth1" maxlength="6" 
						value="${user.userBirth1}" placeholder="990515">
					<input type="text" name="userBirth2" class="form-control" id="userBirth2" maxlength="1" 
						value="${user.userBirth2}" placeholder="1******">
				</div>
				<div class="form-group">
					<label for="hp">휴대폰번호</label>
					<div class="input-group phone-group">
						<select class="form-control phone1" name="userPh1" id="userPhone1">
							<option ${user.userPh1 == '010' ? 'selected' : ''}>010</option>
							<option ${user.userPh1 == '011' ? 'selected' : ''}>011</option>
							<option ${user.userPh1 == '017' ? 'selected' : ''}>017</option>
							<option ${user.userPh1 == '018' ? 'selected' : ''}>018</option>
						</select>
						<input type="text" class="form-control phone2" name="userPh2" id="userPhone2" 
							value="${user.userPh2}" placeholder="휴대폰번호를 입력하세요.">
						<input type="text" class="form-control phone3" name="userPh3" id="userPhone3" 
							value="${user.userPh3}" placeholder="휴대폰번호를 입력하세요.">
					</div>
				</div>
				<div class="form-group">
					<label for="email">이메일</label><br>
					<div class="input-group email-group">
						<input type="text" name="userEmail1" class="form-control" value="${user.userEmail1}" id="userEmail1" placeholder="이메일">
						<select	name="userEmail2" class="form-control" id="userEmail2">
							<option ${user.userEmail2 == '@naver.com' ? 'selected' : ''}>@naver.com</option>
							<option ${user.userEmail2 == '@daum.net' ? 'selected' : ''}>@daum.net</option>
							<option ${user.userEmail2 == '@gmail.com' ? 'selected' : ''}>@gmail.com</option>
							<option ${user.userEmail2 == '@hanmail.com' ? 'selected' : ''}>@hanmail.com</option>
						</select>
						<div class="input-group-addon">
							<button type="button" id="mail-check-btn" class="btn btn-primary">이메일인증</button>
						</div>
					</div>
					<div class="mail-check-box">
						<input type="text" class="form-control mail-check-input"
							placeholder="인증번호 6자리를 입력하세요." maxlength="6" disabled="disabled">
						<span id="mail-check-warn"></span>
					</div>
				</div>
				<div class="form-group">
					<label>이메일 수신동의</label> <br>
					<input type="checkbox" value="${user.userMobileOk}" id="sendMobile" ${user.userMobileOk == 1 ? 'checked' : ''}> <label>모바일</label> <br>
					<input type="checkbox" value="${user.userEmailOk}" id="sendEmail" ${user.userEmailOk == 1 ? 'checked' : ''}> <label>이메일</label>
				</div>

				<div class="form-group">
					<label for="addr-num">주소</label>
					<div class="input-group">
						<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" 
							value="${user.addrZipNum}" placeholder="우편번호" readonly>
						<div class="input-group-addon">
							<button type="button" class="btn btn-primary"onclick="searchAddress()">주소찾기</button>
						</div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="addrBasic" id="addrBasic" 
						value="${user.addrBasic }" placeholder="기본주소">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" name="addrDetail" id="addrDetail" 
						value="${user.addrDetail}" placeholder="상세주소">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	/* 아이디 중복 체크 */
	$('#idCheckBtn').click(function() {
		const userId = $('#userId').val();
		
		if(userId === '') {
			alert('아이디를 입력해주세요.');
			return;
		}
		
		console.log(userId);
		
		$.ajax({
			type: 'post',
			url: '<c:url value="/user/idCheck" />',
			contentType: 'application/json',
			data: userId,
			success: function(data) {
				if(data === 'ok') {
					$('#userId').attr('readonly', true);
					$('#idCheckBtn').attr('disabled', true);
					$('#msgId').html('사용 가능한 아이디입니다.'); 
					$('#msgId').css('color', 'green');
				} else {
					$('#msgId').text('중복된 아이디 입니다.');
					$('#msgId').css('color', 'red');
				}
			},
			error: function() {
				console.log('연결 실패');
			}
		}); //ajax 끝
		
	}); //id 중복체크끝
	
	//다음 주소 API 사용해 보기
	function searchAddress() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	            var addr = ''; // 주소 변수
	            var extraAddr = ''; // 참고항목 변수
	
	            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                addr = data.roadAddress;
	            } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                addr = data.jibunAddress;
	            }
	
	
	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
	            document.getElementById('addrZipNum').value = data.zonecode;
	            document.getElementById('addrBasic').value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById('addrDetail').focus();
	        }
	    }).open();
	}

	/* 아이디 유효성 검사 */
	var id = document.getElementById("userId");
	id.onkeyup = function() {
	    var regex = /^[A-Za-z0-9+]{4,12}$/;
	    if(regex.test(document.getElementById("userId").value )) {
	        document.getElementById("userId").style.borderColor = "green";
	        document.getElementById("msgId").innerHTML = "아이디중복체크는 필수 입니다.";
	    } else {
	        document.getElementById("userId").style.borderColor = "red";
	        document.getElementById("msgId").innerHTML = "영문과 숫자가 포함되게 작성해주세요.";
	    }
	}
	let check1 = false;
	let check2 = false;
	/* 패스워드 유효성 검사 */
	var pw = document.getElementById("userPw");
	pw.onkeyup = function(){
	    var regex = /^.*(?=^.{8,14}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	     if(regex.test(document.getElementById("userPw").value )) {
	        document.getElementById("userPw").style.borderColor = "green";
	        document.getElementById("msgPw").innerHTML = "사용가능합니다";
	        check1 = true;
	    } else {
	        document.getElementById("userPw").style.borderColor = "red";
	        document.getElementById("msgPw").innerHTML = "8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.";
	        check1 = false;
	    }
	}
	
	/* 비밀번호 확인검사 */
	var pwConfirm = document.getElementById("pwConfirm");
	pwConfirm.onkeyup = function() {
	    if(document.getElementById("pwConfirm").value == document.getElementById("userPw").value ) {
	        document.getElementById("pwConfirm").style.borderColor = "green";
	        document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
	        check2 = true;
	    } else {
	        document.getElementById("pwConfirm").style.borderColor = "red";
	        document.getElementById("msgPw-c").innerHTML = "비밀번호 확인란을 확인하세요";
	        check2 = false;
	    }
	}
</script>


















