<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/header.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="container user-join-container col-sm-6 col-sm-offset-4 col-md-7 col-md-offset-3 main">
	
	<div class="col-sm-offset-4" style="margin-bottom: 5%;">
		<h1>회&nbsp;원&nbsp;가&nbsp;입</h1>
	</div>
	
	<div class="hr-bottom">
		<hr>
	</div>
	
	<form action="<c:url value='/user/join' />" method="post" id="joinForm" class="form-horizontal">
	
		<div class="form-group form-group-lg">
			<label for="id" class="col-md-4 control-label">아이디</label>
			<div class="col-md-6">
				<div class="input-group">
					<input type="text" name="userId" class="form-control" id="userId" maxlength="12" placeholder="아이디를 (영문포함 4~12자 이상)">
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary btn-lg" id="idCheckBtn">중복체크</button>
					</span>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>

		<div class="col-sm-offset-4 div-span-input-bottom">
			<span id="msgId" class="span-user-join"></span>
		</div>
		
		<div class="hr-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="password" class="col-sm-4 control-label">비밀번호</label>
			<div class="col-sm-6">
				<input type="password" name="userPw" class="form-control" id="userPw" maxlength="14" placeholder="8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="col-sm-offset-4 div-span-input-bottom">
			<span id="msgPw" class="span-user-join"></span>		
		</div>
		
		<div class="hr-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="password" class="col-sm-4 control-label">비밀번호확인</label>
			<div class="col-sm-6">
				<input type="password" class="form-control" id="pwConfirm" maxlength="14" placeholder="비밀번호를 확인해주세요.">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="col-sm-offset-4 div-span-input-bottom">
			<span id="msgPw-c" class="span-user-join"></span>		
		</div>
		
		<div class="hr-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="name" class="col-sm-4 control-label">이름</label>
			<div class="col-sm-6">
				<input type="text" name="userName" class="form-control" id="userName" placeholder="이름을 입력하세요.">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="birth" class="col-sm-4 control-label">생년월일</label>
			<div class="col-sm-2">
				<input type="text" name="year" id="year" class="form-control" 
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1994">
			</div>
			<div class="col-sm-2">
				<select name="month" id="month" class="form-control">
					<option>월</option>
					<c:forEach var="m" begin="1" end="12">
						<option ${month == m ? 'checked' : ''}>${m}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-sm-2">
				<input type="text" name="day" id="day" value="${day}" class="form-control"
					oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="2" placeholder="13">
			</div>
			<div class="col-sm-2"></div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="gender" class="col-sm-4 control-label">주민등록번호 뒷자리</label>
			<div class="col-sm-1">
				<input type="text" name="userBirth2" class="form-control" id="userBirth2" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="1" placeholder="*">
			</div>
			<div class="col-sm-1" style="padding-left: 0px;">
				<label><strong>******</strong></label>
			</div>
			<div class="sol-sm-6"></div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="hp" class="col-sm-4 control-label">휴대폰번호</label>
			<div class="col-sm-6 input-group phone-group">
				<div class="col-sm-3">
					<select class="form-control phone1" name="userPh1" id="userPh1">
						<option>010</option>
						<option>011</option>
						<option>017</option>
						<option>018</option>
					</select>
				</div>
				<label for="hp" class="col-sm-1 control-label">—</label>
				<div class="col-sm-3" id="div-userPh2">
					<input type="text" class="form-control" name="userPh2" id="userPh2" 
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1234">
				</div>
				<label for="hp" class="col-sm-1 control-label">—</label>
				<div class="col-sm-3">
					<input type="text" class="form-control" name="userPh3" id="userPh3" 
						oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" maxlength="4" placeholder="1234">
				</div>
			</div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="email" class="col-sm-4 control-label">이메일</label>
			<div class="col-sm-8 input-group phone-group">
				<div class="col-sm-4">
					<input type="text" name="userEmail1" class="form-control" value="${userEmail1}" id="userEmail1" placeholder="이메일">
				</div>
				<div class="span-strong col-sm-1">
					<span><strong>@</strong></span>
				</div>
				<div class="col-sm-4">
					<select name="domain" class="form-control" id="userEmail2">
						<option ${userEmail2 == 'naver.com' ? 'checked' : ''}>naver.com</option>
						<option ${userEmail2 == 'daum.net' ? 'checked' : ''}>daum.net</option>
						<option ${userEmail2 == 'gmail.com' ? 'checked' : ''}>gmail.com</option>
						<option ${userEmail2 == 'hanmail.com' ? 'checked' : ''}>hanmail.com</option>
					</select>
				</div>
				<div class="col-sm-2">
					<button type="button" class="btn btn-primary btn-lg" id="mailCheckBtn">이메일인증</button>
				</div>
			</div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="emailCheck" class="col-sm-4 control-label">이메일 인증번호</label>
			<div class="mail-check-box col-sm-2">
				<input type="text" class="form-control mailCheckInput" placeholder="인증번호" maxlength="6" disabled="disabled">
			</div>
			<div class="span-email-check">
				<span id="mailCheckWarn" class="span-user-join"></span>		
			</div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="emailCheck" class="col-sm-4 control-label">이메일 수신동의</label>
			<div class="col-sm-2 form-inline div-checkbox">
				<div class="form-group clearfix">
					<div class="checkbox">
						<label><input type="checkbox" value="1" name="userMobileOk" id="userMobileOk">  모바일</label>
					</div>
				</div>
				<div class="form-group pull-right">
					<div class="checkbox">
						<label><input type="checkbox" value="1" name="userEmailOk" id="userEmailOk">  이메일</label>
					</div>
				</div>
			</div>
		</div>
		
		<div class="hr-top-bottom">
			<hr>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-num" class="col-sm-4 control-label">우편번호</label>
			<div class="col-sm-6">
				<div class="input-group">
					<input type="text" class="form-control" name="addrZipNum" id="addrZipNum" placeholder="우편번호" readonly>
					<span class="input-group-btn">
						<button type="button" class="btn btn-primary btn-lg" onclick="searchAddress()">주소찾기</button>
					</span>
				</div>
			</div>
		</div>
		
		<div class="form-group form-group-lg">
			<label for="addr-basic" class="col-sm-4 control-label">기본주소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="addrBasic" id="addrBasic" placeholder="기본주소" readonly>
			</div>
		</div>
		
		<div class="form-group form-group-lg div-bottom">
			<label for="addr-detail" class="col-sm-4 control-label">상세주소</label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="addrDetail" id="addrDetail" placeholder="상세주소">
			</div>
		</div>
		
		<div class="form-group join-btn-group clearfix">
			<div class="col-sm-offset-3 col-sm-7">
				<button type="button" id="userJoinRegistBtn" class="btn btn-lg btn-info col-sm-5">가입하기</button>
				<button type="button" id="userJoinClose" class="btn btn-lg btn-info col-sm-offset-1 col-sm-4">취소</button>
			</div>
		</div>

	</form>
	
</div>
<%@include file="../include/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	$(document).ready(function() {
		
		// 회원가입 취소 버튼
		$('#userJoinClose').click(function() {
			history.back();
		});
		
		/* 아이디 중복 체크 */
		$('#idCheckBtn').click(function() {
			const userId = $('#userId').val();
			
			if($('#userId').val().trim() === '') {
				$('#userId').val('');
				$('#userId').focus();
				alert('아이디를 반드시 입력해주세요.');
				return;
			}
			
			if($('#userId').val().length <= 3) {
				$('#userId').focus();
				alert('아이디를 정확히 입력해주세요.');
				return;
			}
			
			if($('#userId').val().length >= 13) {
				$('#userId').focus();
				alert('아이디를 정확히 입력해주세요.');
				return;
			}
			
			if(!($('#msgId').text() === '아이디 중복체크는 필수입니다.')) {
				$('#userId').focus();
				alert('아이디를 정확히 입력해주세요.');
				return;
			}
			
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
						$('#msgId').text('중복된 아이디입니다.');
						$('#msgId').css('color', 'red');
					}
				},
				error: function() {
					console.log('연결 실패');
				}
			}); //ajax 끝
			
		}); //id 중복체크끝
		
		let code = ''; //인증코드 저장
		
		//인증번호 이메일 전송
		$('#mailCheckBtn').click(function() {
			loading();
			
			if ($('#userEmail1').val() === '') {
				alert('이메일을 입력해주세요.');
				endLoading();
				return;
			}
			
			const email = $('#userEmail1').val() + '@' + $('#userEmail2').val();
			
			$.ajax({
				type: 'get',
				url: '<c:url value="/user/mailCheck?email=" />' + email,
				success: function(data) {
					endLoading();
					$('.mailCheckInput').attr('disabled', false); //비활성된 인증번호 입력창을 활성화.
					code = data; //인증번호를 전역변수에 저장.
					alert('인증번호가 전송되었습니다. 확인 후 입력란에 정확하게 입력하세요!');
				}
			}); //end ajax
			
		}); //이메일 전송 끝.
		
		/* 인증번호 체크 */
		$('.mailCheckInput').blur(function() {
			const inputCode = $(this).val();
			const $resultMsg = $('#mailCheckWarn');
			
			if(inputCode === code) {
				$resultMsg.html('인증번호가 일치합니다.');
				$resultMsg.css('color', 'green');
				$('#mailCheckBtn').attr('disabled', true);
				$('#userEmail1').attr('readonly', true);
				$('#userEmail2').attr('readonly', true);
				$(this).css('display', 'none');
				
				$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
				$('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
				
			} else {
				$resultMsg.html('인증번호를 다시 확인해 주세요.');
				$resultMsg.css('color', 'red');
				$(this).focus();
			}
			
		}); //인증번호 이벤트 끝.
		
		// 회원가입
		$('#userJoinRegistBtn').click(function() {
			
			// 아이디 체크
			if(!$('#userId').attr('readonly')) {
				$('#userId').focus();
				$('#userId').css('border-color', 'red');
				alert('아이디 중복 체크는 필수입니다.');
				return;
			}
			
			// 비밀번호 체크
			if(!check1 || !check2) {
				alert('비밀번호를 확인해 주세요.');
				if(!check1) {
					$('#userPw').val('');
					$('#userPw').focus();
					$('#userPw').css('border-color', 'red');
					return;
				}
				
				if(!check2) {
					$('#pwConfirm').val('');
					$('#pwConfirm').focus();
					$('#pwConfirm').css('border-color', 'red');
					return;
				}
			}
			
			// 이름 체크
			if($('#userName').val().trim() === '') {
				$('#userName').val('');
				$('#userName').focus();
				$('#userName').css('border-color', 'red');
				alert('이름은 필수입니다.');
				return;
			} else {
				if($('#userName').val().length <= 1) {
					$('#userName').focus();
					$('#userName').css('border-color', 'red');
					alert('이름을 정확히 입력해주세요.');
					return;
				}
				
				for(let i=0; i<$('#userName').val().length; i++) {
					let nch = $('#userName').val().substring(i, i+1);
					if(nch.match(/[0-9]|[a-z]|[A-Z]/)) {
						$('#userName').focus();
						$('#userName').css('border-color', 'red');
						alert('이름을 정확히 입력해주세요.');
						return;
					}
					
					if(nch.match(/([^가-힣\x20])/i)) {
						$('#userName').focus();
						$('#userName').css('border-color', 'red');
						alert('이름을 정확히 입력해주세요.');
						return;
					}
					
					if(nch.match(/[\s]/)) {
						$('#userName').focus();
						$('#userName').css('border-color', 'red');
						alert('글자 사이 공백이 있습니다.');
						return;
					}
				}
			}
			
			// 출생년도 체크
			if($('#year').val().trim() === '') {
				$('#year').val('');
				$('#year').focus();
				$('#year').css('border-color', 'red');
				alert('출생년도는 필수입니다.');
				return;
			} else {
				if($('#year').val().length <= 3) {
					$('#year').focus();
					$('#year').css('border-color', 'red');
					alert('출생년도를 정확히 입력해주세요.');
					return;
				}
				
				if(+$('#year').val() === 0) {
					$('#year').focus();
					$('#year').css('border-color', 'red');
					alert('출생년도를 정확히 입력해주세요.');
					return;
				}
			}
			
			// 월 체크
			if($('#month').val() === '월') {
				$('#month').focus();
				$('#month').css('border-color', 'red');
				alert('월을 선택해주세요.');
				return;
			}
			
			// 일 체크
			if($('#day').val().trim() === '') {
				$('#day').val('');
				$('#day').focus();
				$('#day').css('border-color', 'red');
				alert('출생일는 필수입니다.');
				return;
			} else {
				if(+$('#day').val() === 0) {
					$('#day').focus();
					$('#day').css('border-color', 'red');
					alert('출생일을 정확하게 입력해주세요.');
					return;
				}
				
				if(+$('#day').val() > 31) {
					console.log($('#day').val());
					$('#day').val('');
					$('#day').css('border-color', 'red');
					alert('출생일을 정확하게 입력해주세요.');
					return;
				}
				
				if(+$('#month').val() === 2) {
					if($('#day').val() > 29) {
						$('#day').css('border-color', 'red');
						alert('출생일을 정확하게 입력해주세요.');
						return;
					}
				}
			}
			
			// 주민번호뒷자리 체크
			if($('#userBirth2').val().trim() === '') {
				$('#userBirth2').val('');
				$('#userBirth2').focus();
				$('#userBirth2').css('border-color', 'red');
				alert('주민등록번호 뒷자리를 반드시 입력해주세요.');
				return;
			} else {
				if(+$('#userBirth2').val() === 0) {
					$('#userBirth2').focus();
					$('#userBirth2').css('border-color', 'red');
					alert('주민등록번호 뒷자리를 정확하게 입력해주세요.');
					return;
				}
			}
			
			// 휴대전화번호 체크
			if($('#userPh2').val().trim() === '' || $('#userPh3').val().trim() === '') {
				if($('#userPh2').val().trim() === '') {
					$('#userPh2').val('');
					$('#userPh2').focus();
					$('#userPh2').css('border-color', 'red');
					alert('휴대전화번호를 입력해주세요.');
					return;
				}
				
				if($('#userPh3').val().trim() === '') {
					$('#userPh3').val('');
					$('#userPh3').focus();
					$('#userPh3').css('border-color', 'red');
					alert('휴대전화번호를 입력해주세요.');
					return;
				}
				
			} else {
				if($('#userPh2').val().length <= 3) {
					$('#userPh2').focus();
					$('#userPh2').css('border-color', 'red');
					alert('휴대전화번호를 정확히 입력해주세요.');
					return;
				}
				
				if($('#userPh3').val().length <= 3) {
					$('#userPh3').focus();
					$('#userPh3').css('border-color', 'red');
					alert('휴대전화번호를 정확히 입력해주세요.');
					return;
				}
			}
			
			// 이메일 체크
			if(!$('#userEmail1').attr('readonly') || $('#userEmail1').val().trim() === '') {
				$('#userEmail1').focus();
				$('#userEmail1').css('border-color', 'red');
				alert('이메일 인증을 완료해주세요.');
				return;
			}
			
			// 주소 체크
			if($('#addrZipNum').val().trim() === '' || $('#addrBasic').val().trim() === '' || $('#addrDetail').val().trim() === '') {
				$('#addrDetail').focus();
				$('#addrDetail').css('border-color', 'red');
				alert('주소를 다시 확인해주세요.');
				return;
			}
			
			if(confirm('회원가입을 하시겠습니까?')) {
				$('#joinForm').submit();
			}
			
		});
	});
	
	// 카카오 주소 
	function searchAddress() {
		const width = 500;
		const height = 600;
		new daum.Postcode({
			oncomplete : function(data) {
				
				var addr = '';
				var extraAddr = '';
	
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
	
				document.getElementById('addrZipNum').value = data.zonecode;
				document.getElementById('addrBasic').value = addr;
				document.getElementById('addrDetail').focus();
			}
		}).open({
			left: (window.screen.width / 2) - (width / 2),
			top: (window.screen.height / 2) - (height / 2)
		});
	}
	
	/* 아이디 유효성 검사 */
	var id = document.getElementById("userId");
	id.onkeyup = function() {
		var regex = /^[A-Za-z0-9+]{4,12}$/;
		if (regex.test(document.getElementById("userId").value)) {
			document.getElementById("userId").style.borderColor = "green";
			document.getElementById("msgId").innerHTML = "아이디 중복체크는 필수입니다.";
			document.getElementById("msgId").style.color = "black";
		} else {
			document.getElementById("userId").style.borderColor = "red";
			document.getElementById("msgId").innerHTML = "영문과 숫자가 포함되게 작성해주세요.";
			document.getElementById("msgId").style.color = "red";
		}
	}
	
	let check1 = false;
	let check2 = false;
	
	/* 패스워드 유효성 검사 */
	var pw = document.getElementById("userPw");
	pw.onkeyup = function() {
		var regex = /^.*(?=^.{8,14}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		if (regex.test(document.getElementById("userPw").value)) {
			document.getElementById("userPw").style.borderColor = "green";
			document.getElementById("msgPw").innerHTML = "사용가능합니다";
			document.getElementById("msgPw").style.color = "black";
			check1 = true;
		} else {
			document.getElementById("userPw").style.borderColor = "red";
			document.getElementById("msgPw").innerHTML = "8~14자의 영문 대/소문자,숫자,특수문자 최소 한개씩 사용해야 합니다.";
			document.getElementById("msgPw").style.color = "red";
			check1 = false;
		}
		
		if(document.getElementById("pwConfirm").value != '') {
			if(document.getElementById("pwConfirm").value != document.getElementById("userPw").value) {
				document.getElementById("pwConfirm").style.borderColor = "red";
				document.getElementById("msgPw-c").innerHTML = "비밀번호 일치하지 않습니다.";
				document.getElementById("msgPw-c").style.color = "red";
				check2 = false;
			} else {
				document.getElementById("pwConfirm").style.borderColor = "green";
				document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
				document.getElementById("msgPw-c").style.color = "black";
				check2 = true;
			}
		}
		
		
	}
	
	/* 비밀번호 확인검사 */
	var pwConfirm = document.getElementById("pwConfirm");
	pwConfirm.onkeyup = function() {
		if(document.getElementById("userPw").value != '') {
			if (document.getElementById("pwConfirm").value == document
					.getElementById("userPw").value) {
				document.getElementById("pwConfirm").style.borderColor = "green";
				document.getElementById("msgPw-c").innerHTML = "비밀번호가 일치합니다";
				document.getElementById("msgPw-c").style.color = "black";
				check2 = true;
			} else {
				document.getElementById("pwConfirm").style.borderColor = "red";
				document.getElementById("msgPw-c").innerHTML = "비밀번호 일치하지 않습니다.";
				document.getElementById("msgPw-c").style.color = "red";
				check2 = false;
			}
		}
	}
	
	// 로딩창 열기
	function loading() {
		// 사용자 화면 환경에 따른 너비 변수 선언
		const windowWidth = window.document.body.clientWidth;
		// 사용자 화면 환경에 따른 높이 변수 선언
		const windowHeight = $(document).height;
		
		// 로딩창  나왔을때 뒷배경 디자인 변수 선언 [1번]
		const $loadingBackground = '<div id="loadingBackground" style="position: fixed; left: 0; top: 0; z-index: 50000000; background: #808080; display=none;"></div>';
		
		// 로딩 이미지 변수 선언 [2번]
		let $loadingImg = '';
		$loadingImg += '<div id="loadingImg" style="position: fixed; top: 50%; left: 50%; width: 100%; transform: translate(-50%, -50%); z-index: 99999;">';
		$loadingImg += `<img src="<c:url value='/img/loadingGif.gif' />" style="position: relative; display: block; margin: 0 auto;" />`;
		$loadingImg += '</div>';
					 
		// 화면에 [1번] [2번] 배치
		$('body').append($loadingBackground).append($loadingImg);
		
		// 미리 선언한 사용자 화면의 너비/높이를 loadingBackground에 적용
		$('#loadingBackground').css({
			'width' : windowWidth,
			'height' : windowHeight,
			'opacity' : '0.5'
		});
		
		// loadingBackground 와 loaingImg 화면 출력 함수 show() 적용
		$('#loadingBackground').show();
		$('#loadingImg').show();

	} // 로딩창 열기 끝
	
	// 로딩창 닫기
	function endLoading() {
		$('#loadingBackground, #loadingImg').hide();
	}
	
	
</script>

